# Databases
# https://docs.djangoproject.com/en/4.2/ref/databases/#postgresql-notes

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.oracle",
        "NAME": "postgres",
        "USER": "postgres",
        "PASSWORD": "Password",
        "HOST": "localhost",
        "PORT": "5432",
    }
}
