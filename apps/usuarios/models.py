from django.db import models
from django.contrib.auth.models import AbstractUser,  PermissionsMixin, BaseUserManager
# from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.hashers import make_password, check_password
# Create your models here.


class CustomUserManager(BaseUserManager):
    def _create_user(self, name, last_name, email, password, is_staff, is_superuser, **extra_fields):
        user = self.model(
            name=name,
            last_name=last_name,
            email=email,
            is_staff=is_staff,
            is_superuser=is_superuser,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self.db)
        return user

    def create_user(self, name, last_name, email, password=None, **extra_fields):
        return self._create_user(name, last_name, email, password, False, False, **extra_fields)

    def create_superuser(self, email, password=None, name='', last_name='', **extra_fields):
        return self._create_user(name, last_name, email, password, True, True, **extra_fields)


class Usuarios(AbstractUser, PermissionsMixin):
    name = models.CharField(max_length=255, null=False, blank=True)
    last_name = models.CharField(max_length=255, null=False, blank=True)
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
