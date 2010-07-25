# -*- coding: utf-8 -*-
from django.utils.translation import ugettext_lazy as _
from google.appengine.ext import db

from ragendja.auth import google_models

class User(google_models.User):
	paid_amount = db.IntegerProperty(default=0)
	pending_amount = db.IntegerProperty(default=0)	
	pending_key = db.StringProperty(default="")	
	