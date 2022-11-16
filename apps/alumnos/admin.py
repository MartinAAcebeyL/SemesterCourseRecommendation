from django.contrib import admin

# Register your models here.
from .models import Alumnos


class AlumnosAdmin(admin.ModelAdmin):
    pass
    # fields = ('title', 'description', 'price')
    # list_display = ('__str__', 'slug', 'date')


admin.site.register(Alumnos, AlumnosAdmin)
