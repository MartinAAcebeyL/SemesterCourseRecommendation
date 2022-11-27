from django.contrib import admin

# Register your models here.
from .models import Docentes


class DocentesAdmin(admin.ModelAdmin):
    fields = ('name', 'last_name', 'email')
    list_display = [
        'name', 'last_name', 'email']


admin.site.register(Docentes, DocentesAdmin)
