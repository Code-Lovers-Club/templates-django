from configurations import values

from .base import APIBaseConfig


class DevConfig(APIBaseConfig):
    SECRET_KEY = values.Value()
    EMAIL_BACKEND = values.Value()
    EMAIL_HOST = values.Value()
    EMAIL_PORT = values.Value()
    EMAIL_USE_TLS = values.BooleanValue(default=False)
