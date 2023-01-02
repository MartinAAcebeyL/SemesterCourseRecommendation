from django.urls import path
from .views import kardex, horario_sugerido, programarse

urlpatterns = [
    path('kardex/', kardex, name='kardex'),
    path('horario/sugerido/', horario_sugerido, name='horario_sugerido'),
    path('programacion/', programarse, name='programacion'),
]
