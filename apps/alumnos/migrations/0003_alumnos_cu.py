# Generated by Django 4.1.3 on 2022-12-04 02:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alumnos', '0002_alumnos_horarios'),
    ]

    operations = [
        migrations.AddField(
            model_name='alumnos',
            name='cu',
            field=models.IntegerField(default=111),
        ),
    ]