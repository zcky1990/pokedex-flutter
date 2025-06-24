import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<T?> fetchData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    print("URL : " + path);
    final url = Uri.parse(path);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print("response : $response.body");
        final data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
