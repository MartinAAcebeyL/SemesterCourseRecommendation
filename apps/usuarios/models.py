from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractUser, PermissionsMixin
from django.contrib.auth.hashers import make_password, check_password
# Create your models here.

class CustomUserManager(BaseUserManager):
    def create_user(self, name, last_name, email, password=None, **extra_fields):
        return self._create_user(name, last_name, email, password, False, False, **extra_fields)

    def create_superuser(self, name, last_name, email, password=None, **extra_fields):
        return self._create_user(name, last_name, email, password, True, True, **extra_fields)


class Usuarios(AbstractUser):
    name = models.CharField(max_length=255, null=True, blank=True)
    last_name = models.CharField(max_length=255, null=True, blank=True)
    phone = models.CharField(max_length=10, null=False)
    email = models.EmailField(max_length=255, unique=True, null=False)
    password = models.CharField(max_length=100, null=False)
    address = models.CharField(max_length=50, null=False)
    created_at = models.DateTimeField(auto_now_add=True)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    
    def __str__(self):
        return f'Usuario con nombre: {self.name} {self.last_name}'

    def set_password(self, password):
        self.password = make_password(password)
        self.save()

    def check_password(self, password):
        """Returns true if this is the user's password, false
        otherwise """
        return check_password(password, self.password)
