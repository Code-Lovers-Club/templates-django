from __future__ import annotations

from settings.common.base import BaseConfig

from settings.api.rest_framework import BaseRestFrameworkConfig, BaseSpectacularConfig


class APIBaseConfig(BaseRestFrameworkConfig, BaseSpectacularConfig, BaseConfig):
    ROOT_URLCONF:str = "urls.api"
    APPEND_SLASH:bool = True

    def get_third_party_apps(self) -> list[str]:
        apps = super().get_third_party_apps()
        return [
            *apps,
            "rest_framework",
            "knox",
            "drf_spectacular"
        ]
