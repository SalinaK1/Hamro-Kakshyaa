# Generated by Django 3.1.5 on 2021-06-22 09:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subject', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='classcode',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
        migrations.AlterField(
            model_name='subject',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
        migrations.AlterField(
            model_name='subjectcode',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]