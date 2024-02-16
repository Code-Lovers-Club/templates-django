from configurations import values


class BaseDatabaseConfig:
    @property
    def DATABASES(self) -> dict:  # noqa: N802
        pg_db: str = values.Value(environ_name="POSTGRES_DB")
        pg_user: str = values.Value(environ_name="POSTGRES_USER")
        pg_password: str = values.Value(environ_name="POSTGRES_PASSWORD")
        pg_host: str = values.Value(environ_name="POSTGRES_HOST")
        pg_port: str = values.Value(environ_name="POSTGRES_PORT")

        return {
            "default": {
                "ENGINE": "django.db.backends.postgresql",
                "NAME": pg_db,
                "USER": pg_user,
                "PASSWORD": pg_password,
                "HOST": pg_host,
                "PORT": pg_port,
                "ATOMIC_REQUESTS": True,
            },
        }
