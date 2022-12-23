from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect
from apps.alumnos.models import Alumnos


def login_view(request):
    if request.user.is_authenticated:
        return redirect('inicio')

    if request.method == 'POST':
        password = request.POST.get('password')
        email = request.POST.get('email')
        alumno = authenticate(request, email=email, password=password)
        if alumno:
            login(request, alumno)
            return redirect('inicio')

        return render(request, 'login.html', context={
            "error": "No existe este usuario"
        })

    return render(request, 'login.html')


def inicio(request):
    user = Alumnos.get_by_email(request.user.email)

    return render(request, 'base.html', context={
        "user": user
    })


def logout_view(request):
    logout(request)
    print("Sesion cerrada")
    return redirect('login')
