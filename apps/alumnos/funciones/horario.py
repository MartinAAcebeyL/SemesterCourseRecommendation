from . import *
from .auxiliares import crear_dict, generar_dict_r, materias_eljidas


def materias_habilitadas(materias_aprobadas: Materias):
    # devuelve una LISTA con las materias que el alumno puede llevar

    # todas las materias
    materias_restantes = set(Materias.objects.all())
    # todas las materias que faltan llevar
    materias_restantes = list(
        materias_restantes.difference(set(materias_aprobadas)))

    materias_abiertas = []
    # conjungo con materias aprobadas
    x = set(materias_aprobadas)
    for i in materias_restantes:
        y = set(i.pre_requisitos.all())
        # si x es subconjunto de y
        if x.issuperset(y):
            materias_abiertas.append(i)
    return materias_abiertas

# main para devolver horarios


def conjunto_horarios(materias_habilitadas: Materias):
    """devuele un diccionario con las materias y los horarios sugeridos
    diccionario con materia y lista de horarios sugeridas, sin choques"""
    dict_r = {}

    """horarios de materias habilitadas"""
    horarios_habilitados = []

    """todos los horarios"""
    horarios = Horarios.objects.all()
    """recolecion de horarios habilitados """
    for horario in horarios:
        if horario.materia in materias_habilitadas:
            horarios_habilitados.append(horario)

    """diccionario con materia y lista de horarios
    {"materia":[lista de horarios de materia]}"""
    diccionario_horarios = crear_dict(
        horarios_habilitados, materias_habilitadas)

    """copias de las materias habilitadas y el diccionario de horarios"""
    materias_habilitadas_copy = materias_habilitadas.copy()
    diccionario_horarios_copy = diccionario_horarios.copy()
    while diccionario_horarios_copy:
        """lista de las materias habilitadas con menor curso"""
        materias = materias_eljidas(materias_habilitadas_copy)
        dict_r.update(generar_dict_r(
            materias, diccionario_horarios_copy, materias_habilitadas_copy))
        materias = materias_eljidas(materias_habilitadas_copy)
    return dict_r
