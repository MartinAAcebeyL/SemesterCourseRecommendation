# Generated by Django 4.1.3 on 2022-11-12 16:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('horarios', '0001_initial'),
        ('docentes', '0001_initial'),
        ('materia', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='horarios',
            name='decente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='horarios', to='docentes.docentes'),
        ),
        migrations.AddField(
            model_name='horarios',
            name='materia',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='horarios', to='materia.materias'),
        ),
    ]