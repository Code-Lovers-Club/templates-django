class BaseRestFrameworkConfig:
    @property
    def REST_FRAMEWORK(self) -> dict:  # noqa: N802
        return {
            "DEFAULT_RENDERER_CLASSES": [
                "rest_framework.renderers.JSONRenderer",
            ],
            "DEFAULT_AUTHENTICATION_CLASSES": ["knox.auth.TokenAuthentication"],
            "DEFAULT_PERMISSION_CLASSES": [
                "rest_framework.permissions.IsAuthenticated",
            ],
        }


class BaseSpectacularConfig:
    @property
    def SPECTACULAR_SETTINGS(self) -> dict:  # noqa: N802
        return {
            "TITLE": "{{ cookiecutter.project_name }} API",
            "DESCRIPTION": "This documentation its just available into development environment.",
            "VERSION": "1.0.0",
            "SERVE_INCLUDE_SCHEMA": False,
        }
