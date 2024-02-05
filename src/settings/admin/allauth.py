from __future__ import annotations


class AllAuthConfig:
    # https://docs.allauth.org/en/latest/account/configuration.html
    ACCOUNT_AUTHENTICATION_METHOD: str = "email"
    ACCOUNT_CHANGE_EMAIL: bool = True
    ACCOUNT_EMAIL_REQUIRED: bool = True
    ACCOUNT_EMAIL_VERIFICATION: str = "optional"
    ACCOUNT_USER_MODEL_EMAIL_FIELD: str = "email"

    def get_middleware_b(self) -> list:
        return [
            "allauth.account.middleware.AccountMiddleware",
        ]

    @property
    def AUTHENTICATION_BACKENDS(self) -> list[str]:  # noqa: N802
        return [
            # `allauth` specific authentication methods, such as login by email
            #'django.contrib.auth.backends.ModelBackend',
            "allauth.account.auth_backends.AuthenticationBackend",
        ]

    @property
    def SOCIALACCOUNT_PROVIDERS(self) -> dict:  # noqa: N802
        # https://docs.allauth.org/en/latest/socialaccount/providers/index.html
        return {}
