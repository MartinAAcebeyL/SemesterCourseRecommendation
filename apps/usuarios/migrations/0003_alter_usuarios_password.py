# Generated by Django 3.2.2 on 2022-11-30 11:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('usuarios', '0002_alter_usuarios_email_alter_usuarios_is_active_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuarios',
            name='password',
            field=models.CharField(max_length=128, verbose_name='password'),
        ),
    ]
