from django.db import models

# Create your models here.

# plan=models.enums.


class Kadex(models.Model):
    gestion = models.IntegerField()
    plan = models.IntegerField()
    curso = models.IntegerField()
    sigla = models.CharField(max_length=150)
    nombre_materia = models.CharField(max_length=150)
    final = models.IntegerField()
    segunda_instancia = models.IntegerField()

    class EstadoMateria(models.TextChoices):
        aprobado = 'ap', 'Aprobado'
        reprobado = 'rp', 'Reprobado'
        convalidado = 'co', 'Convalidado'

    estado = models.CharField(max_length=2,
                              choices=EstadoMateria.choices,
                              default=EstadoMateria.aprobado)
