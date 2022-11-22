from django.db import models

# Create your models here.


class Materias(models.Model):
    nombre = models.CharField(max_length=100)
    sigla = models.CharField(max_length=8)
    curso = models.IntegerField()
    creditos = models.IntegerField()
    # relacion recursiva
    pre_requisitos = models.ManyToManyField(
        'self', blank=True,
        symmetrical=False, related_name='materias')

    def __str__(self) -> str:
        return self.sigla
