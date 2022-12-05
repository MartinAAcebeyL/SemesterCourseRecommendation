from apps.materia.models import Materias
from apps.alumnos.models import Alumnos
from apps.horarios.models import Horarios


def materias_habilitadas(materias_aprobadas: Materias):
    #todas las materias
    materias_restantes = set(Materias.objects.all())
    #todas lasmaterias que faltan llevar
    materias_restantes = list(
        materias_restantes.difference(set(materias_aprobadas)))

    materias_abiertas = []
    #conjungo con materias aprobadas
    x = set(materias_aprobadas)
    for i in materias_restantes:
        y = set(i.pre_requisitos.all())
        #si x es subconjunto de y
        if x.issuperset(y):
            materias_abiertas.append(i)

    return materias_abiertas


def conjunto_horarios(materias_habilitadas: Materias):
    # materias_habilitadas --> lista de materias
    result = [] # lista con horarios
    
    #horarios de materias habilitadas
    horarios_sugeridos = []
    #todos los horarios
    horarios = Horarios.objects.all()

    for horario in horarios:
        if horario.materia in materias_habilitadas:
            horarios_sugeridos.append(horario)

    #diccionario con materia y lista de horarios
    #{"materia":[lista de horarios de materia]}
    diccionario_horarios = crear_dict(horarios_sugeridos, materias_habilitadas)
    
    primer_f = primer_filtro(diccionario_horarios)

    result.extend(primer_f)

    print('\nmatriz con horarios finales')
    print(result)
    
    return result


def crear_dict(horarios: Horarios, materias: Materias):
    diccionario_horarios = {}

    for materia in materias:
        diccionario_horarios[materia.nombre] = crear_list(horarios, materia)

    for i in diccionario_horarios:
        valor = diccionario_horarios.get(i)
        print(f"{i}\n{valor}\n{'---'*40}")
    return diccionario_horarios


def crear_list(horarios, materia):
    l = []
    for horario in horarios:
        if horario.materia == materia:
            l.append(horario)
    return l


def primer_filtro(horarios_dict):
    list_2_horarios = []
    for horario in horarios_dict.values():
        # print(horario)
        if len(horario) == 2:
            list_2_horarios.append(horario)
    return list_2_horarios
