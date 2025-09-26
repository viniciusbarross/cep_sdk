import '../cep_result.dart';

class CepClient {
  static Future<CepResult> getAddress(String cep) {
    throw UnsupportedError('Plataforma não suportada');
  }

  static Future<List<CepResult>> searchByAddress({
    required String uf,
    required String city,
    required String street,
  }) {
    throw UnsupportedError('Plataforma não suportada');
  }
}
