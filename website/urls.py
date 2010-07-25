# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from ragendja.urlsauto import urlpatterns
from ragendja.auth.urls import urlpatterns as auth_patterns

from django.contrib import admin

admin.autodiscover()

handler500 = 'ragendja.views.server_error'

urlpatterns = auth_patterns + patterns('',
    ('^admin/(.*)', admin.site.root),
		(r'^$', 'objecthandles.views.home'),    
		(r'^usage$', 'django.views.generic.simple.direct_to_template', {'template': 'objecthandles/usage.html'}),    		
		(r'^consulting$', 'objecthandles.views.consulting'),    		
		
		
		(r'^license$', 'objecthandles.views.license'),
		(r'^examples$', 'objecthandles.views.examples'),
		(r'^examples/purchaseExamples.html$', 'objecthandles.views.purchaseExamples'),
		(r'^examples/donate.html$', 'objecthandles.views.donate'),
		(r'^examples/googleDonate$', 'objecthandles.views.googleDonate'),		
		#(r'^examples/download$', 'objecthandles.views.download'),		
		(r'^download$', 'objecthandles.views.download'),		
#		(r'^adminify$', 'objecthandles.views.adminify'),						
		(r'^youtube/(?P<youtubeid>.+)$','django.views.generic.simple.direct_to_template', {'template': 'objecthandles/youtube.html'}),						
) + urlpatterns
