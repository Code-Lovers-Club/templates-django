from __future__ import annotations

from .env_dev import DevConfig


class LocalConfig(DevConfig):
    def get_django_apps_b(self) -> list[str]:
        return [
            "django_extensions",
        ]
