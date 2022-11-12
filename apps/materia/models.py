from django.db import models

# Create your models here.


class Materias(models.Model):
    nombre = models.CharField(max_length=100)
    sigla = models.CharField(max_length=8)
    curso = models.IntegerField()
    creditos = models.IntegerField()
    # relacion recursiva
    pre_requisitos = models.ForeignKey(
        'self', null=False, on_delete=models.CASCADE, related_name='materias')
