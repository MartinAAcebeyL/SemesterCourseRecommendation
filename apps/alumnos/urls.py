from django.urls import path
from .views import kardex

urlpatterns = [
    path('kardex/', kardex, name='kardex'),
]