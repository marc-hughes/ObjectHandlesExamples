# -*- coding: utf-8 -*- 
import base64
import re
import random
import htmlentitydefs 

from django.http import HttpResponseRedirect
from django.utils.translation import ugettext as _
from ragendja.template import render_to_response
from django.contrib.auth.decorators import login_required
from google.appengine.api import urlfetch
from objecthandles.models import *

def home(request):
  return render_to_response( request,'objecthandles/home.html' );

@login_required  
def donate(request):
  donations_q = User.all()
  donations_q.filter('paid_amount >', 0)
  donations = donations_q.fetch(5000)
  
  count = 0
  amount = 0
  for user in donations:
    amount = amount + user.paid_amount
    count = count + 1

  if count > 0 :
    amount = "%0.2f" % ((amount/100) / count)
  return render_to_response( request,'objecthandles/donate.html', {'donated_amount':amount});
  
@login_required
def googleDonate(request):

  amount = int( 100 * float( request.POST.get('amount','0') ));
   
  if amount < 1500:
    amount = 1500
  
  key = str(random.randint(10000,50000))
  
  request.user.pending_key = key
  request.user.pending_amount = amount
  request.user.put()
  
  request_body="_type=checkout" + \
              "&item_name_1=ObjectHandles%20Example%20Applications" + \
              "&item_description_1=Help%20to%20improve%20ObjectHandles%20by%20donating" + \
              "&item_price_1=" + "%0.2f" % (amount/100) + \
              "&item_currency_1=USD" + \
              "&item_quantity_1=1" + \
              "&shopping-cart.items.item-1.digital-content.display-disposition=OPTIMISTIC" + \
              "&shopping-cart.items.item-1.digital-content.description=Please%20go%20to%20&lt;a%20href=&quot;http://object-handles-examples.appspot.com/download?key=" + key + "&quot;&gt;the%20download%20page&lt;/a&gt;" + \
              "&shopping-cart.items.item-1.digital-content.url=http://object-handles-examples.appspot.com/download?key=" + key + \
              "&_charset_"

  key = "Basic " + base64.b64encode("334861116685487:lJ9Ju7frsxiVRNyey89zdA")
  headers = {"Authorization":key};

  response = urlfetch.fetch("https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/334861116685487", payload=request_body, method="POST", headers=headers, follow_redirects=False)

  data = converthtml(response.content)

  m = re.search('<A HREF="([^"]+)">',data)
  data=m.group(1)
  
  return HttpResponseRedirect(data)
  
@login_required
def download(request):
  
  if request.GET.get("key","") == request.user.pending_key :
    request.user.paid_amount += request.user.pending_amount
    request.user.pending_amount = 0
    request.user.pending_key = ""
    request.user.put()
    
  donation = "%0.2f" % (request.user.paid_amount / 100)  

  if request.user.paid_amount < 1500:
    return render_to_response( request,'objecthandles/baddownload.html' , {'user':request.user});
  else:
    return render_to_response( request,'objecthandles/download.html' , {'donation_amount':donation});

@login_required
def adminify(request):
  if( request.user.email == "marc.hughes@gmail.com") :
    request.user.is_staff=True
    request.user.is_superuser=True
    request.user.is_superuser=True
    request.user.put()
  return render_to_response( request,'objecthandles/home.html' ); 




def convertentity(m):
  if m.group(1)=='#':
    try:
      return chr(int(m.group(2)))
    except ValueError:
      return '&#%s;' % m.group(2)
  try:
    return htmlentitydefs.entitydefs[m.group(2)]
  except KeyError:
    return '&%s;' % m.group(2)

def converthtml(s):
  return re.sub(r'&(#?)(.+?);',convertentity,s)