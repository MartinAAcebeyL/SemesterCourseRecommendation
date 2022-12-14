# Generated by Django 4.1.3 on 2022-11-12 16:12

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Kadex',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gestion', models.IntegerField()),
                ('plan', models.IntegerField()),
                ('curso', models.IntegerField()),
                ('sigla', models.CharField(max_length=150)),
                ('nombre_materia', models.CharField(max_length=150)),
                ('final', models.IntegerField()),
                ('segunda_instancia', models.IntegerField()),
                ('estado', models.CharField(choices=[('ap', 'Aprobado'), ('rp', 'Reprobado'), ('co', 'Convalidado')], default='ap', max_length=2)),
            ],
        ),
    ]
