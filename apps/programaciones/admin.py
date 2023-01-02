from django.contrib import admin

# Register your models here.
from .models import Programaciones


class ProgramacionesAdmin(admin.ModelAdmin):
    list_display = ('id', 'anio', 'gestion', 'fecha', 'alumno')

admin.site.register(Programaciones, ProgramacionesAdmin)
