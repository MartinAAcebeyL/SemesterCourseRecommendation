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
    # recojo las calificaciones de alumno, las cuales aprobo.
    calificaciones = Calificaciones.objects.filter(
        kardex=user.kardex.id, estado='ap')

    # en este array guardo las materias aprobadas
    materias_aprobadas = []

    for i in calificaciones:
        materias_aprobadas.append(i.materia)

    # materias que puede llevar
    materias_habilitadas_ = materias_habilitadas(materias_aprobadas)[:-3]

    horarios = conjunto_horarios(materias_habilitadas_)

    #organizando horarios
    lst_horarios = []
    for i in horarios:
        dict_aux = {}
        materias = horarios.get(i)
        aux = materias[0][0]
        
        dict_aux["nombre"] = i
        dict_aux["sigla"] = aux.materia.sigla
        dict_aux["curso"] = aux.materia.curso
        dict_aux["lab"] = aux.materia.tiene_lab

        
        for materia in materias:
            print(materia)

        lst_horarios.append(dict_aux)
    
    # for i in lst_horarios:
        # print(i)


    return render(request, 'horario.html', context={
        "user": user,
        "calificaciones": calificaciones,
        "horarios": horarios,
        "dimencion": range(len(horarios))
    })
