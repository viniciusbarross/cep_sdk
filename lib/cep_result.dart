class CepResult {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  CepResult({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory CepResult.fromJson(Map<String, dynamic> json) {
    final rawCep = json['cep'] ?? '';
    final formattedCep = _formatCep(rawCep);

    return CepResult(
      cep: formattedCep,
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
    );
  }

  static String _formatCep(String cep) {
    final digits = cep.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 8) {
      return "${digits.substring(0, 5)}-${digits.substring(5)}";
    }
    return cep;
  }

  @override
  String toString() {
    return "$logradouro, $bairro - $localidade/$uf (CEP: $cep)";
  }
}
