from django.db import models
from apps.docentes.models import Docentes
from apps.materia.models import Materias

# Create your models here.


class Horarios(models.Model):
    class TipoMateria(models.TextChoices):
        laboratorio = 'lab', 'Laboratorio'
        teoria = 'teo', 'Teoria'

    posicion_horaria = models.IntegerField()
    aula = models.CharField(max_length=50)
    tipo = models.CharField(max_length=3,
                            choices=TipoMateria.choices,
                            default=TipoMateria.teoria)
    grupo = models.IntegerField(default=11)
    # llaves foreneas
    docente = models.ForeignKey(
        Docentes, on_delete=models.CASCADE, related_name='horarios')

    materia = models.ForeignKey(
        Materias, on_delete=models.CASCADE, related_name='horarios')

    def __str__(self) -> str:
        return f"{self.materia} G{self.grupo}"

    def __repr__(self) -> str:
        return f"<{self.materia} Grupo:{self.grupo} {self.posicion_horaria}>"
