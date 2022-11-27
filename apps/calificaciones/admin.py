from django.contrib import admin
from .models import Calificaciones
# Register your models here.


class CalificacionesAdmin(admin.ModelAdmin):
    list_display = ('anio', 'gestion', 'final',
                    'segunda_instancia', 'estado', 'kardex', 'materia')


admin.site.register(Calificaciones, CalificacionesAdmin)
