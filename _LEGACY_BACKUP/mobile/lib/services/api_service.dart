import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Usamos localhost. Si fallara en Android, cambiaríamos esto.
  static const String baseUrl = 'http://localhost:8000';

  Future<Map<String, dynamic>> analyzeEmotion(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/analyze'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': text}),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return Map<String, dynamic>.from(decoded);
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}