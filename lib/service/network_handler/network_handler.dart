import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();

  static Future<String> post(var body, String endpoint) async {
    Uri uri = await buildUri(endpoint);
    var response = await client
        .post(uri, body: body, headers: {"Content-type": "application/json"});
    return response.body;
  }

  static Future<String> put(var body, String endpoint) async {
    Uri uri = await buildUri(endpoint);
    var response = await client
        .put(uri, body: body, headers: {"Content-type": "application/json"});
    return response.body;
  }

  static Future<Uri> buildUri(String endpoint) async {
    String host = 'http://192.168.0.103:5000/api/v1/';
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken(String token) async {
    await storage.read(key: 'token');
  }
}
