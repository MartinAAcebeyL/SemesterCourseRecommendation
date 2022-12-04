from django.shortcuts import render
from .models import Alumnos
from apps.calificaciones.models import Calificaciones
from apps.materia.models import Materias
from .funciones.horario import *
# Create your views here.


def kardex(request):
    user = Alumnos.get_by_email(request.user.email)
    calificaciones = Calificaciones.objects.filter(
        kardex=user.kardex.id)

    return render(request, 'kardex.html', context={
        "user": user,
        "calificaciones": calificaciones
    })


def horario_sugerido(request):
    user = Alumnos.get_by_email(request.user.email)
    calificaciones = Calificaciones.objects.filter(
        kardex=user.kardex.id, estado='ap')
    
    materias_aprobadas = []

    for i in calificaciones:
        materias_aprobadas.append(i.materia)

    materias_habilitadas_ = materias_habilitadas(materias_aprobadas)

    return render(request, 'horario.html', context={
        "user": user,
        "calificaciones": calificaciones
    })
