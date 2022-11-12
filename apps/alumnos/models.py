from django.db import models
from apps.usuarios.models import Usuarios
from apps.kardex.models import Kadex
from apps.carreras.models import Carreras

# Create your models here.

class Alumnos(Usuarios):
    pass
    kardex = models.OneToOneField(
        Kadex,
        on_delete=models.CASCADE,
        primary_key=True,
    )
    carrera = models.ForeignKey(
        Carreras, on_delete=models.CASCADE, related_name='alumnos')
