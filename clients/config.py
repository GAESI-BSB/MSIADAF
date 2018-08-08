import ruamel_yaml as yaml


class Config(object):

    def __init__(self):
        self.data_services = {}
        self.wsSettings = self.get_data_services('services.yml')
        self.sysKey = self.wsSettings['sys_key']

    def get_data_services(self, filename):
        with open(filename, 'r') as dt:
            self.data_services = yaml.load(dt)

        return self.data_services

    def get_service(self, name):
        settings = self.wsSettings
        service_name = settings['services'][name]
        service = settings['protocol']+'://'+settings['domain']+'/'+settings['path']+'/'+service_name+settings['extension']
        return service

    def connector(self, service):
        url = self.get_service(service)
        soap_client_params = {'encoding': 'UTF-8',
                              'verifypeer': False,
                              'verifyhost': False,
                              'soap_version': 'SOAP_1_2',
                              'trace': 0,
                              'exceptions': 0,
                              'connection_timeout': 1,
                              'namespace': "http://www.ibm.com/maximo",
                              'namespace_identifier': None,
                              'convert_request_keys_to': False}
        return SoapClient(url, soap_client_params)
