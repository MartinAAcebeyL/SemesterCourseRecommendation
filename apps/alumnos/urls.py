from django.urls import path
from .views import kardex, horario_sugerido, programarse, mis_programaciones

urlpatterns = [
    path('kardex/', kardex, name='kardex'),
    path('horario/sugerido/', horario_sugerido, name='horario_sugerido'),
    path('programacion/', programarse, name='programacion'),
    path('mis_programaciones/', mis_programaciones, name='mis_programaciones'),
]
