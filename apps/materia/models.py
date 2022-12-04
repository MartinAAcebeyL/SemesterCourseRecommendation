from django.db import models

# Create your models here.


class Materias(models.Model):
    class TipoMateria(models.TextChoices):
        normal = 'N', 'normal'
        optativa = 'O', 'optativa'

    nombre = models.CharField(max_length=100)
    sigla = models.CharField(max_length=8)
    curso = models.IntegerField()
    creditos = models.IntegerField(default=3)
    tipo = models.CharField(max_length=8, choices=TipoMateria.choices,
                            default=TipoMateria.normal)
    tiene_lab= models.BooleanField(default=False)
    # relacion recursiva
    pre_requisitos = models.ManyToManyField(
        'self', blank=True,
        symmetrical=False, related_name='materias')

    def show(self):
        return f"sigla: {self.sigla}, curso: {self.curso}, requisitos: {self.pre_requisitos}"

    def __str__(self) -> str:
        return self.sigla

    def __repr__(self) -> str:
        return f"<{self.sigla}>"