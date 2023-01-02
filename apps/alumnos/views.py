from django.shortcuts import render, redirect
from .models import Alumnos
from apps.calificaciones.models import Calificaciones
from apps.materia.models import Materias
from apps.horarios.models import Horarios
from apps.programaciones.models import Programaciones
from .funciones.horario import *
from datetime import datetime
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
    fecha = (str(datetime.now()).split(" ")[0]).split("-")[:2]
    anio = int(fecha[0])
    gestion = 1 if int(fecha[1]) < 6 else 2
    programaciones = Programaciones.objects.filter(
        alumno_id=user, anio=anio, gestion=gestion)
    if programaciones:
        return render(request, 'horario_existente.html', context={
            "user": user,
            "message": "Ya tienes un horario programado"
        })

    print(programaciones)
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

    # organizando horarios
    lst_horarios = []
    for i in horarios:
        dict_aux = {}
        materias = horarios.get(i)
        aux = materias[0][0]

        dict_aux["nombre"] = i
        dict_aux["sigla"] = aux.materia.sigla
        dict_aux["curso"] = aux.materia.curso
        dict_aux["lab"] = aux.materia.tiene_lab

        lst_horarios_aux = []
        for tp_materia in materias:
            materia = tp_materia[0].grupo
            if [materia, tp_materia[1]] in lst_horarios_aux:
                continue
            lst_horarios_aux.append([materia, tp_materia[1]])
        dict_aux["grupos"] = lst_horarios_aux
        lst_horarios.append(dict_aux)

    return render(request, 'horario.html', context={
        "user": user,
        "calificaciones": calificaciones,
        "horarios": lst_horarios,
    })


def programarse(request):
    user = Alumnos.get_by_email(request.user.email)
    fecha = (str(datetime.now()).split(" ")[0]).split("-")[:2]

    anio = int(fecha[0])
    gestion = 1 if int(fecha[1]) < 6 else 2

    dict_request = dict(request.POST).copy()
    del dict_request['csrfmiddlewaretoken']

    lst_materias = []
    for i in dict_request:
        materia = Materias.objects.filter(nombre=i)
        lst_materias.append(*materia)

    for i, j in zip(dict_request, lst_materias):
        horario = dict_request.get(i)
        if len(horario) == 1:
            aux_insert = Horarios.objects.filter(
                materia=j, grupo=horario[0])
            h = Programaciones(anio=anio, gestion=gestion,
                               alumno=user)
            h.save()
            h.horarios.add(*aux_insert)

        else:
            lst_aux = []
            materia_teo = Horarios.objects.filter(
                materia=j, grupo=horario[0], tipo='teo').first()

            materia_lab = Horarios.objects.filter(
                materia=j, grupo=horario[1], tipo='lab').first()

            lst_aux.append(materia_teo.id)
            lst_aux.append(materia_lab.id)
            h = Programaciones(anio=anio, gestion=gestion,
                               alumno=user)
            h.save()
            h.horarios.add(*lst_aux)

    return redirect('mis_programaciones')


def mis_programaciones(request):
    user = Alumnos.get_by_email(request.user.email)

    # programaciones
    programaciones = Programaciones.objects.filter(
        alumno=user).order_by('-anio', '-gestion')

    lst_programaciones_anio_gestion = []
    for i in programaciones:
        lst_programaciones_anio_gestion.append(f"{i.gestion}/{i.anio}")

    lst_programaciones_anio_gestion = list(
        set(lst_programaciones_anio_gestion))

    # print(lst_programaciones_anio_gestion)
    programaciones = Programaciones.objects.filter(
        alumno=user, anio=lst_programaciones_anio_gestion[0].split("/")[1], gestion=lst_programaciones_anio_gestion[0].split("/")[0])

    if request.POST:
        programaciones = request.POST.get('gestion')
        gestion, anio = programaciones.split("/")
        programaciones = Programaciones.objects.filter(
            alumno=user, anio=anio, gestion=gestion)

    lst_show = []
    for i in programaciones:
        dict_show = {}
        horario = i.horarios.all()
        dict_show["sigla"] = horario[0].materia.sigla
        dict_show["nombre"] = horario[0].materia.nombre
        dict_show["curso"] = horario[0].materia.curso
        dict_show["lab"] = horario[0].materia.tiene_lab

        if not horario[0].materia.tiene_lab:
            dict_show["grupo_teo"] = horario[0].grupo
            dict_show["grupo_lab"] = -1
        else:
            dict_show["grupo_teo"] = horario[0].grupo
            dict_show["grupo_lab"] = horario[1].grupo

        lst_show.append(dict_show)

    return render(request, 'mis_programaciones.html', context={
        "user": user,
        "programaciones": lst_programaciones_anio_gestion,
        "horarios": lst_show,
    })
