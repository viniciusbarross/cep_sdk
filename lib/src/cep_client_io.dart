import 'dart:convert';
import 'dart:io';
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
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final body = await response.transform(utf8.decoder).join();
      return jsonDecode(body);
    } else {
      throw Exception("Erro HTTP: ${response.statusCode}");
    }
  }
}
