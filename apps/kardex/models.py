from django.db import models
# Create your models here.


class Kadex(models.Model):
    plan = models.IntegerField(default=1)

    def __str__(self) -> str:
        return f"id: {self.id}"