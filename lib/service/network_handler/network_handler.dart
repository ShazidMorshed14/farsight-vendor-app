import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();

  static void post(var body, String endpoint) async {
    var response = await client.post(buildUri(endpoint) as Uri, body: body);
  }

  static Future<Uri> buildUri(String endpoint) async {
    String host = 'http://192.168.0.104:5000/';
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken(String token) async {
    await storage.read(key: 'token');
  }
}
