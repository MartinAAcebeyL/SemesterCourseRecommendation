from django.contrib import admin

# Register your models here.
from .models import Alumnos
from .forms import *
from django.contrib.auth.admin import UserAdmin


class AlumnosAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = Alumnos

    list_display = ('email', 'is_staff', 'is_active',)
    list_filter = ('email', 'is_staff', 'is_active',)

    fieldsets = (
        (None, {'fields': ('email', 'password',
         'phone', 'address', 'kardex', 'carrera')}),
        ('Permissions', {'fields': ('is_staff', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2',
                       'name', 'last_name', 'phone', 'address',
                       'kardex', 'carrera')
        }
        ),
    )

    search_fields = ('email',)
    ordering = ('email',)

admin.site.register(Alumnos, AlumnosAdmin)
