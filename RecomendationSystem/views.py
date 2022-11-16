from django.http import HttpResponse
from django.shortcuts import render

def login(request):
    return render(request,'login.html')

def inicio(request):
    return render(request,'base.html')