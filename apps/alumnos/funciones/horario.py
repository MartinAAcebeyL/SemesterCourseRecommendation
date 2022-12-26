from . import *
from .auxiliares import mostart_dict, crear_dict, generar_dict_r, extraer_pos_horaria_horario2x2, materias_eljidas


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


def comparar_horarios2(lista_2x2: list, dict_materias: dict):
    # elimina materias con choques de lista_2x2 en dict_materias
    # y retorna un diccionario con las materias que tienen choques
    choques = {}

    for lista in lista_2x2:
        nombre = lista[0].materia.nombre
        dict_materias.pop(nombre)

    lst_pos_horaria = extraer_pos_horaria_horario2x2(lista_2x2)
    for i in dict_materias:
        lista_horarios = dict_materias.get(i)
        lst_choques = []
        for item_horaraio in lista_horarios:
            posicion_horaria_actual = item_horaraio.posicion_horaria
            if posicion_horaria_actual in lst_pos_horaria:
                # significa que hay choque
                grupo = item_horaraio.grupo
                lst_choques.append(item_horaraio)
                lista_horarios.remove(item_horaraio)
                for j in lista_horarios:
                    if j.grupo == grupo:
                        lst_choques.append(j)
                        lista_horarios.remove(j)
        dict_materias[i] = lista_horarios
        choques[i] = lst_choques
    return choques


def primer_filtro(horarios_dict: dict):
    # 1er filtro donde devuelve las meterias que puede llevar
    list_2_horarios = []
    for horario in horarios_dict.values():
        if len(horario) == 2:
            list_2_horarios.append(horario)
    return list_2_horarios
