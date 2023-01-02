from django.db import models
from apps.alumnos.models import Alumnos
from apps.horarios.models import Horarios
from datetime import datetime
# Create your models here.


class Programaciones(models.Model):
    anio = models.IntegerField()
    gestion = models.IntegerField()
    fecha = models.DateField(default=datetime.now)
    # relaciones
    alumno = models.ForeignKey(Alumnos, on_delete=models.CASCADE)
    horarios = models.ManyToManyField(Horarios)

    @classmethod
    def create(self, anio, gestion, alumno, horarios):
        self.anio = anio
        self.gestion = gestion
        self.alumno = alumno
        self.horarios = horarios
        self.save()