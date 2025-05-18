import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  final String baseUrl = 'https://api.restaurante.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ApiClient._internal();

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(uri, headers: _mergeHeaders(headers));
      _handleErrors(response);
      return response;
    } catch (e) {
      throw Exception('Erro ao fazer GET: $e');
    }
  }

  Future<http.Response> post(
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        uri,
        headers: _mergeHeaders(headers),
        body: jsonEncode(body),
      );
      _handleErrors(response);
      return response;
    } catch (e) {
      throw Exception('Erro ao fazer POST: $e');
    }
  }

  Future<http.Response> put(
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.put(
        uri,
        headers: _mergeHeaders(headers),
        body: jsonEncode(body),
      );
      _handleErrors(response);
      return response;
    } catch (e) {
      throw Exception('Erro ao fazer PUT: $e');
    }
  }

  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.delete(uri, headers: _mergeHeaders(headers));
      _handleErrors(response);
      return response;
    } catch (e) {
      throw Exception('Erro ao fazer DELETE: $e');
    }
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {...defaultHeaders, if (headers != null) ...headers};
  }

  void _handleErrors(http.Response response) {
    if (response.statusCode >= 400) {
      throw Exception('Erro da API: ${response.statusCode} ${response.body}');
    }
  }
}
