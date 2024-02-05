from __future__ import annotations

from settings.admin.admin_interface import AdminInterfaceConfig
from settings.admin.allauth import AllAuthConfig
from settings.common.base import BaseConfig


class AdminBaseConfig(AdminInterfaceConfig, AllAuthConfig, BaseConfig):
    ROOT_URLCONF = "urls.admin"

    def get_django_apps_t(self) -> list:
        return [
            # "admin_interface",
            # "colorfield",
            "pixelflow_theme",
            "django.contrib.admin",
            "django.contrib.auth",
            "django.contrib.contenttypes",
            "django.contrib.sessions",
            "django.contrib.messages",
        ]

    def get_third_party_apps(self) -> list:
        return ["allauth", "allauth.account", "allauth.socialaccount"]
