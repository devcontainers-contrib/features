from jinja2.ext import Extension


class ToEnvCase(Extension):
    """Jinja2 extension to create a random string."""

    def __init__(self, environment):
        """Jinja2 Extension Constructor."""
        super().__init__(environment)

        def to_camel_case(input_str: str):
            output = ''.join(x for x in input_str.title() if x.isalnum())
            return output[0].lower() + output[1:]
                      
        def to_screaming_snake_case(input_str: str) -> str:
            return ''.join(x if x.isalnum() else "_" for x in input_str.upper())

        def to_env_case(input_str: str) -> str:
            return ''.join(x for x in input_str.upper() if x.isalnum())

        environment.filters.update(to_env_case=to_env_case,
                                    to_camel_case=to_camel_case,
                                    to_screaming_snake_case=to_screaming_snake_case)
