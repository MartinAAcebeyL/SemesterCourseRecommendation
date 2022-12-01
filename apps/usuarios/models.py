from django.db import models
from django.contrib.auth.models import AbstractUser
from .managers import CustomUserManager

# Create your models here.


class Usuarios(AbstractUser):
    username = None
    name = models.CharField(max_length=255, null=True)
    last_name = models.CharField(max_length=255, null=True)
    phone = models.CharField(max_length=30, null=False)
    email = models.EmailField(
        max_length=255, unique=True, null=True, blank=True)
    address = models.CharField(max_length=50, null=False)
    created_at = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def __str__(self):
        return f'Usuario con nombre: {self.name} {self.last_name}'