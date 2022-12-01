from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate


def login(request):
    if request.method == 'POST':
        password = request.POST.get('password')
        email = request.POST.get('email')
        alumno = authenticate(email=email, password=password)
        if alumno:
            print(alumno)
        else:
            print("no existe")

    return render(request, 'login.html')


def inicio(request):
    return render(request, 'base.html')
