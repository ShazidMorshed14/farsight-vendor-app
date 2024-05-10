class Environment {
  final String mode;
  Environment(this.mode);

  getConfig() {
    if (mode == 'dev') {
      return {
        'mode': 'DEVELOPMENT',
        'appName': 'Farsight',
        'version': '1.0.0-poc',
        'baseUrl': 'https://farsight-server.onrender.com/api/v1',
        'secretPin': '9999'
      };
    }
    return {
      'mode': 'STAGING',
      'appName': 'Farsight',
      'version': '1.0.0',
      'baseUrl': 'http://192.168.0.106:5000/api/v1',
      'secretPin': '1780'
    };
  }
}
