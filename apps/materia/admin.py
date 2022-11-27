from django.contrib import admin

# Register your models here.
from .models import Materias


class MateriasAdmin(admin.ModelAdmin):

    # fields = ('nombre', 'sigla', 'curso', 'creditos', 'pre_requisitos')

    list_display = ('sigla', 'nombre', 'curso', 'tipo', 'creditos')


admin.site.register(Materias, MateriasAdmin)
