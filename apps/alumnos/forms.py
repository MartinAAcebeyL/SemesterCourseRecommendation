from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import Alumnos

class CustomUserCreationForm(UserCreationForm):

    class Meta:
        model = Alumnos
        fields = ('email',)


class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = Alumnos
        fields = '__all__'
