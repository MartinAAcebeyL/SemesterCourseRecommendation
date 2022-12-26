from . import *


def mostart_dict(dic: dict):
    print()
    for i in dic:
        print(f"{i}\t{dic.get(i)}")


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

#


def extraer_menor_curso(materias_habilitadas: Materias):
    # retorna el menor curso de las materias habilitadas, un entero
    menor_curso = 11
    for materia in materias_habilitadas:
        if materia.curso < menor_curso:
            menor_curso = materia.curso

    return menor_curso


def materias_eljidas(materias_habilitadas):
    menor_curso = extraer_menor_curso(materias_habilitadas)
    lst_menores_cursos_habilitados = []
    for materia in materias_habilitadas:
        if materia.curso == menor_curso:
            lst_menores_cursos_habilitados.append(materia)

    materias_siguiente_curso = Materias.objects.filter(
        curso=menor_curso + 1)
    lst_pre_requisitos = []
    cont = 0
    for materia in lst_menores_cursos_habilitados:
        for materia_siguiente in materias_siguiente_curso:
            if materia in materia_siguiente.pre_requisitos.all():
                cont += 1
        lst_pre_requisitos.append(cont)
        cont = 0

    dict_materias = {}
    # por ejemplo: {Materia: veces que se necesita en otra Materia, ...}
    for i in range(len(lst_menores_cursos_habilitados)):
        dict_materias[lst_menores_cursos_habilitados[i]
                      ] = lst_pre_requisitos[i]
    # print(dict_materias)

    return lst_menores_cursos_habilitados


def dict_lst_choques(main_grupos, diccionario_horarios_copy, materia):
    dict_choques = {}
    lst_choques = []
    for i in main_grupos:
        """por ejemplo {materia1:[grupo1,grupo2]}"""
        dict_choques_aux = {}

        """lista de horarios con el mismo grupo
        por ejemplo: [horario1,horario2]"""
        grupo = [j for j in diccionario_horarios_copy.get(
            materia.nombre) if j.grupo == i]

        # print(f"grupo: {grupo[0].grupo}")
        cont = 0
        for j in grupo:
            for aux in diccionario_horarios_copy:
                lst_choques_aux = []
                if aux == materia.nombre:
                    continue
                lst_horarios = diccionario_horarios_copy.get(aux)
                for horario in lst_horarios:
                    if j.posicion_horaria == horario.posicion_horaria:
                        # print(
                        # f"{j.materia.nombre} choca con {horario.materia.nombre} G{horario.grupo} en la posicion {j.posicion_horaria}")
                        lst_choques_aux.append(horario.grupo)
                        dict_choques_aux[horario.materia.nombre] = lst_choques_aux
                        cont += 1

            dict_choques[i] = dict_choques_aux
        lst_choques.append(cont)

    return dict_choques, lst_choques


def generar_dict_r(materias, diccionario_horarios_copy, materias_habilitadas_copy):
    dict_r = {}
    for materia in materias:
        materias_habilitadas_copy.remove(materia)
        # print(materia.nombre.center(30, "-"))
        lst_horarios = diccionario_horarios_copy.get(materia.nombre)
        """grupos que tiene la materia
        por ejemplo: [9,8,7]"""
        main_grupos = list(set([i.grupo for i in lst_horarios]))

        """ayuda en los choques. Si la lst_choques no tiene 0
        se elige el grupo con menos choques y se elimina el grupo con
        la materia que choca
        si la lst_choques tiene 0, se elige los grupos con 0 choques y se 
        agregan a dict_r
        ejemplo de dict_choques: {9:{materia1:[grupo1,grupo2]}, 8:{materia2:[grupo3]}"""

        dict_choques, lst_choques = dict_lst_choques(
            main_grupos, diccionario_horarios_copy, materia)

        cant_min_choques = min(lst_choques)
        # print(f"lista de choques: {lst_choques}")
        if cant_min_choques == 0:
            # print(f"cantidad minima de choques {cant_min_choques}")
            lst_horarios = []
            for i in range(len(lst_choques)):
                if lst_choques[i] == 0:
                    grupo = main_grupos[i]
                    # print(f"grupo {grupo} a agregar")
                    horarios_temp = Horarios.objects.filter(
                        materia=materia, grupo=grupo)
                    for horario in horarios_temp:
                        lst_horarios.append(horario)

            dict_r[materia.nombre] = lst_horarios
            # del (diccionario_horarios_copy[materia.nombre])
        else:
            # print(
            # f"El grupo con menos choques es {main_grupos[lst_choques.index(cant_min_choques)]} con {cant_min_choques} choques")

            indice = lst_choques.index(cant_min_choques)
            grupo_agregar = main_grupos[indice]

            dict_r[materia.nombre] = list(Horarios.objects.filter(
                materia=materia, grupo=grupo_agregar))

            dict_horarios_eliminar = dict_choques.get(grupo_agregar)
            for materia_aux in dict_horarios_eliminar:
                # lista grupo de la materia que choca
                lst_grupos_eliminar = dict_horarios_eliminar.get(materia_aux)

                # lista de horarios de la materia que choca
                horarios_materia_eliminar_aux = diccionario_horarios_copy.get(
                    materia_aux)
                for i in lst_grupos_eliminar:
                    lst_aux = []
                    for horario_aux in horarios_materia_eliminar_aux:
                        if horario_aux.grupo != i:
                            lst_aux.append(horario_aux)
                diccionario_horarios_copy[materia_aux] = lst_aux
        # mostart_dict(diccionario_horarios_copy)
        del (diccionario_horarios_copy[materia.nombre])
    return dict_r
