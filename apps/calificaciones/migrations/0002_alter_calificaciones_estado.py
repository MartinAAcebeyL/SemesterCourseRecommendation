# Generated by Django 4.1.3 on 2022-12-04 03:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('calificaciones', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='calificaciones',
            name='estado',
            field=models.CharField(choices=[('Aprobado', 'Aprobado'), ('Reprobado', 'Reprobado'), ('Convalidado', 'Convalidado')], default='Aprobado', max_length=15),
        ),
    ]
