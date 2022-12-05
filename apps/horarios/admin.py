from django.contrib import admin

# Register your models here.
from .models import Horarios


class HorariosAdmin(admin.ModelAdmin):
    list_display = ('id', 'materia',
                    'aula', 'tipo', 'docente', 'grupo')


admin.site.register(Horarios, HorariosAdmin)
