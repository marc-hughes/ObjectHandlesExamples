# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from ragendja.urlsauto import urlpatterns
from ragendja.auth.urls import urlpatterns as auth_patterns

from django.contrib import admin

admin.autodiscover()

handler500 = 'ragendja.views.server_error'

urlpatterns = auth_patterns + patterns('',
    ('^admin/(.*)', admin.site.root),
		(r'^examples$', 'objecthandles.views.home'),
		(r'^examples/donate.html$', 'objecthandles.views.donate'),
		(r'^examples/googleDonate$', 'objecthandles.views.googleDonate'),		
		(r'^examples/download$', 'objecthandles.views.download'),		
#		(r'^adminify$', 'objecthandles.views.adminify'),						
		(r'^youtube/(?P<youtubeid>.+)$','django.views.generic.simple.direct_to_template', {'template': 'objecthandles/youtube.html'}),						
) + urlpatterns
