from apps.materia.models import Materias
from apps.alumnos.models import Alumnos
from apps.horarios.models import Horarios


def materias_habilitadas(materias_aprobadas: Materias):
    # devuelve una lista con las materias habilitadas

    # todas las materias
    materias_restantes = set(Materias.objects.all())
    # todas lasmaterias que faltan llevar
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
    # materias_habilitadas --> lista de materias

    # horarios de materias habilitadas
    horarios_sugeridos = []
    # todos los horarios
    horarios = Horarios.objects.all()

    for horario in horarios:
        if horario.materia in materias_habilitadas:
            horarios_sugeridos.append(horario)

    # diccionario con materia y lista de horarios
    # {"materia":[lista de horarios de materia]}
    diccionario_horarios = crear_dict(horarios_sugeridos, materias_habilitadas)
    mostart_dict(diccionario_horarios)
    primer_f = primer_filtro(diccionario_horarios)

    if primer_f:
        comparar_horarios2(primer_f, diccionario_horarios)
        dict_horarios_2x2 = crear_dict_lst2x2(primer_f)
        diccionario_horarios.update(dict_horarios_2x2)
        # mostart_dict(diccionario_horarios)
        return diccionario_horarios

    # mostart_dict(diccionario_horarios)


def crear_dict_lst2x2(lst2x2):
    res = {}
    for item in lst2x2:
        sigla = item[0].materia.sigla
        res[sigla] = item
    return res


def mostart_dict(dic: dict):
    print()
    for i in dic:
        print(f"{i}\t{dic.get(i)}")


def comparar_horarios2(lista_2x2: list, dict_materias: dict):
    # elimina materias de lista_2x2 en dict_materias
    for lista in lista_2x2:
        nombre = lista[0].materia.nombre
        dict_materias.pop(nombre)

    lst_pos_horaria = extraer_pos_horaria_horario2x2(lista_2x2)
    for i in dict_materias:
        lista_horarios = dict_materias.get(i)
        for item_horaraio in lista_horarios:
            posicion_horaria_actual = item_horaraio.posicion_horaria
            if posicion_horaria_actual in lst_pos_horaria:
                # significa que hay choque
                grupo = item_horaraio.grupo
                lista_horarios.remove(item_horaraio)
                for j in lista_horarios:
                    if j.grupo == grupo:
                        lista_horarios.remove(j)

        dict_materias[i] = lista_horarios


def extraer_pos_horaria_horario2x2(lst_2x2: list):
    l = []
    for item in lst_2x2:
        for i in item:
            l.append(i.posicion_horaria)
    return l


def crear_dict(horarios: Horarios, materias: Materias):
    # retorna dicciona con las materias
    diccionario_horarios = {}

    for materia in materias:
        diccionario_horarios[materia.nombre] = crear_list(horarios, materia)

    return diccionario_horarios


def crear_list(horarios: Horarios, materia: Materias):
    # devuelve una lista con materias habilitadas
    l = []
    for horario in horarios:
        if horario.materia == materia:
            l.append(horario)
    return l


def primer_filtro(horarios_dict: dict):
    # 1er filtro donde devuelve las meterias que puede llevar
    list_2_horarios = []
    for horario in horarios_dict.values():
        if len(horario) == 2:
            list_2_horarios.append(horario)
    return list_2_horarios
