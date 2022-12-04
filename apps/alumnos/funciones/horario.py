from apps.materia.models import Materias
from apps.alumnos.models import Alumnos


def materias_habilitadas(materias_aprobadas: Materias):
    materias_restantes = set(Materias.objects.all())
    materias_restantes = list(
        materias_restantes.difference(set(materias_aprobadas)))

    materias_abiertas = []
    x = set(materias_aprobadas)
    for i in materias_restantes:
        y = set(i.pre_requisitos.all())
        if x.issuperset(y):
            materias_abiertas.append(i)
    
    return materias_abiertas