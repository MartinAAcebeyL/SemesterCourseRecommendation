from django.db import models
from apps.kardex.models import Kadex
from apps.materia.models import Materias
# Create your models here.


class Calificaciones(models.Model):
    id = models.BigAutoField(primary_key=True)
    class Gestion(models.IntegerChoices):
        primero = 1, 'primero'
        segundo = 2, 'Reprobado'

    class EstadoMateria(models.TextChoices):
        aprobado = 'ap', 'Aprobado'
        reprobado = 'rp', 'Reprobado'
        convalidado = 'co', 'Convalidado'

    anio = models.IntegerField(null=True, blank=True, default=2022)
    gestion = models.IntegerField(
        default=Gestion.primero, choices=Gestion.choices)
    final = models.IntegerField()
    segunda_instancia = models.IntegerField(null=True, blank=True)
    estado = models.CharField(max_length=15,
                              choices=EstadoMateria.choices,
                              default=EstadoMateria.aprobado)

    # relaciones
    kardex = models.ForeignKey(Kadex, on_delete=models.CASCADE)
    materia = models.ForeignKey(Materias, on_delete=models.CASCADE)
