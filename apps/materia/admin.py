from django.contrib import admin

# Register your models here.
from .models import Materias


class MateriasAdmin(admin.ModelAdmin):

    list_display = ('sigla', 'id', 'nombre',
                    'tiene_lab', 'curso', 'tipo', 'creditos')


admin.site.register(Materias, MateriasAdmin)
