# Generated by Django 4.1.3 on 2022-11-22 05:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('materia', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='materias',
            name='pre_requisitos',
        ),
        migrations.AddField(
            model_name='materias',
            name='pre_requisitos',
            field=models.ManyToManyField(blank=True, related_name='materias', to='materia.materias'),
        ),
    ]
