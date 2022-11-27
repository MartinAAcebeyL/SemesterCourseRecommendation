from django.contrib import admin
# Register your models here.
from .models import Kadex


class KadexAdmin(admin.ModelAdmin):
    list_display = ('id', 'plan')


admin.site.register(Kadex, KadexAdmin)
