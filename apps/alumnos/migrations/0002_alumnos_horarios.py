# Generated by Django 4.1.3 on 2022-11-12 16:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('horarios', '0002_initial'),
        ('alumnos', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='alumnos',
            name='horarios',
            field=models.ManyToManyField(to='horarios.horarios'),
        ),
    ]