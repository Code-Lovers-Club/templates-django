from __future__ import annotations

from configurations import values

from settings.base import BaseConfig

from .rest_framework import BaseRestFrameworkConfig, BaseSpectacularConfig


class APIBaseConfig(BaseRestFrameworkConfig, BaseSpectacularConfig, BaseConfig):
    ROOT_URLCONF = values.Value("urls.api")

    @property
    def APPEND_SLASH(self) -> bool:  # noqa: N802
        return True

    def get_third_party_apps(self) -> list[str]:
        return ["rest_framework", "knox", "drf_spectacular"]
