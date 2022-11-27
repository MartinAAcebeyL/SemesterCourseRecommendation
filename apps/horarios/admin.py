from django.contrib import admin

# Register your models here.
from .models import Horarios


class HorariosAdmin(admin.ModelAdmin):
    list_display = ('materia', 'aula', 'tipo', 'docente')


admin.site.register(Horarios, HorariosAdmin)
