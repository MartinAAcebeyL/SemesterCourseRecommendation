# Generated by Django 4.1.3 on 2022-11-27 13:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kardex', '0006_alter_kadex_segunda_instancia'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='kadex',
            name='anio',
        ),
        migrations.RemoveField(
            model_name='kadex',
            name='estado',
        ),
        migrations.RemoveField(
            model_name='kadex',
            name='final',
        ),
        migrations.RemoveField(
            model_name='kadex',
            name='gestion',
        ),
        migrations.RemoveField(
            model_name='kadex',
            name='materias',
        ),
        migrations.RemoveField(
            model_name='kadex',
            name='segunda_instancia',
        ),
    ]