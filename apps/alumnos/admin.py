from django.contrib import admin

# Register your models here.
from .models import Alumnos


class AlumnosAdmin(admin.ModelAdmin):
    fields = ('name', 'last_name', 'phone', 'email',
              'password', 'address', 'kardex', 'carrera')
    list_display = ('email', 'name', 'carrera')


admin.site.register(Alumnos, AlumnosAdmin)
