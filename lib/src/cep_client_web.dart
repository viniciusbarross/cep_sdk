import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import '../cep_result.dart';

class CepClient {
  static const String _baseUrl = 'https://viacep.com.br/ws';

  static Future<CepResult> getAddress(String cep) async {
    final cleanCep = _sanitizeCep(cep);
    final url = '$_baseUrl/$cleanCep/json/';
    final data = await _fetch(url);

    if (data['erro'] == true) throw Exception("CEP não encontrado");
    return CepResult.fromJson(data);
  }

  static Future<List<CepResult>> searchByAddress({
    required String uf,
    required String city,
    required String street,
  }) async {
    final url = '$_baseUrl/$uf/$city/$street/json/';
    final data = await _fetch(url);

    if (data is List) return data.map((e) => CepResult.fromJson(e)).toList();
    throw Exception("Nenhum CEP encontrado");
  }

  static String _sanitizeCep(String cep) {
    final digits = cep.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 8) throw Exception("CEP inválido");
    return digits;
  }

  static Future<dynamic> _fetch(String url) async {
    final response = await HttpRequest.getString(url);
    return jsonDecode(response);
  }
}
