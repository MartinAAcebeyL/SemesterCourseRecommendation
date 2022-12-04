from django.shortcuts import render
from .models import Alumnos
from apps.calificaciones.models import Calificaciones
# Create your views here.


def kardex(request):
    user = Alumnos.get_by_email(request.user.email)
    calificaciones = Calificaciones.objects.filter(kardex=user.kardex.id)
    return render(request, 'kardex.html', context={
        "user": user,
        "calificaciones": calificaciones
    })
