# Generated by Django 4.1.3 on 2022-11-27 19:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('horarios', '0002_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='horarios',
            old_name='decente',
            new_name='docente',
        ),
    ]