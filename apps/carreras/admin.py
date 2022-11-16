from django.contrib import admin

# Register your models here.
from .models import Carreras


class CarrerasAdmin(admin.ModelAdmin):
    pass
    # fields = ('title', 'description', 'price')
    # list_display = ('__str__', 'slug', 'date')


admin.site.register(Carreras, CarrerasAdmin)
