from clients.config import Config


class Client(Config):

    def __init__(self):
        super().__init__()
        self.config = Config()

    def get_farm(self):
        service = self.config.connector('wsdl_farm')
        return service
