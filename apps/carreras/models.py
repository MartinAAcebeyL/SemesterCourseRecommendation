from django.db import models

# Create your models here.
class Carreras(models.Model):
    nombre = models.CharField(max_length=150)
    direccion = models.CharField(max_length=150)