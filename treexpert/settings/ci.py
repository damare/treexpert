from .base import *

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.oracle",
        "NAME": "ci",
        "USER": "postgres",
        "PASSWORD": "Password",
        "HOST": "localhost",
        "PORT": "5432",
    },
}
