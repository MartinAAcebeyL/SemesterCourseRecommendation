# Generated by Django 4.1.3 on 2022-11-12 16:12

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('usuarios', '0001_initial'),
        ('carreras', '0001_initial'),
        ('kardex', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Alumnos',
            fields=[
                ('usuarios_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, to=settings.AUTH_USER_MODEL)),
                ('kardex', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='kardex.kadex')),
                ('carrera', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='alumnos', to='carreras.carreras')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            bases=('usuarios.usuarios',),
        ),
    ]
