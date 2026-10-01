import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your deployed API URL before production.
  static const baseUrl = 'http://10.0.2.2:3000/api';

  Future<List<dynamic>> routes() async {
    final response = await http.get(Uri.parse('$baseUrl/routes'));
    if (response.statusCode >= 400) throw Exception('Unable to load routes');
    return jsonDecode(response.body) as List<dynamic>;
  }

  Future<Map<String, dynamic>> createBooking(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bookings'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode >= 400) throw Exception('Booking failed');
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
