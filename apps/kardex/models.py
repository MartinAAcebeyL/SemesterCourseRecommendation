from django.db import models
from apps.materia.models import Materias
# Create your models here.


class Kadex(models.Model):
    class Gestion(models.IntegerChoices):
        primero = 1, 'primero'
        segundo = 2, 'Reprobado'

    class EstadoMateria(models.TextChoices):
        aprobado = 'ap', 'Aprobado'
        reprobado = 'rp', 'Reprobado'
        convalidado = 'co', 'Convalidado'

    anio = models.IntegerField(null=True, blank=True)
    gestion = models.IntegerField(
        default=Gestion.primero, choices=Gestion.choices)
    plan = models.IntegerField(default=1)
    final = models.IntegerField()
    segunda_instancia = models.IntegerField(null=True,blank=True)
    estado = models.CharField(max_length=2,
                              choices=EstadoMateria.choices,
                              default=EstadoMateria.aprobado)

    materias = models.ManyToManyField(Materias)
