from django.db import models
from apps.usuarios.models import Usuarios
# Create your models here.


class Docentes(Usuarios):

    def __str__(self):
        return f"{self.name}. {self.last_name}"
