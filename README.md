# cep_sdk

[![Pub Version](https://img.shields.io/pub/v/cep_sdk)](https://pub.dev/packages/cep_sdk)
[![Build Status](https://img.shields.io/github/actions/workflow/status/viniciusbarross/cep_sdk/flutter.yml?branch=main)](https://github.com/viniciusbarross/cep_sdk/actions)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

`cep_sdk` é um SDK **leve, multiplataforma e nativo** para Dart/Flutter que permite consultar CEPs e endereços do Brasil utilizando a [API ViaCEP](https://viacep.com.br/).  
Funciona em **Android, iOS, Desktop e Web**, sem depender de pacotes HTTP externos.

---

## 🚀 Funcionalidades

- **Consulta de CEP**: Recupere informações detalhadas de um endereço a partir de um CEP.
- **Busca por endereço**: Encontre CEPs correspondentes a um logradouro, bairro, cidade e estado.
- **Normalização de CEP**: Formata automaticamente o CEP para o padrão `XXXXX-XXX`.
- **Compatibilidade multiplataforma**: Funciona em Android, iOS, Web e Desktop.
- **Retorno estruturado**: Todos os dados retornam em objetos `CepResult`.

---

## 📦 Instalação

No `pubspec.yaml`:

```yaml
dependencies:
  cep_sdk:
    git:
      url: https://github.com/viniciusbarross/cep_sdk.git
```
Depois rode:

bash
Copiar código
flutter pub get
🛠️ Exemplo de uso
dart
Copiar código
import 'package:cep_sdk/cep_client.dart';

void main() async {
  // Consulta por CEP
  final result = await CepClient.getAddress("01001000");
  print(result); 
  // Saída: Praça da Sé, Sé - São Paulo/SP (CEP: 01001-000)

  // Busca por endereço
  final results = await CepClient.searchByAddress(
    uf: "SP",
    city: "São Paulo",
    street: "Praça da Sé",
  );

  results.forEach(print);
}
📄 Classe CepResult
dart
Copiar código
class CepResult {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  @override
  String toString() {
    return "$logradouro, $bairro - $localidade/$uf (CEP: $cep)";
  }
}
Exemplo de saída ao consultar 01001000:

json
Copiar código
{
  "cep": "01001-000",
  "logradouro": "Praça da Sé",
  "bairro": "Sé",
  "localidade": "São Paulo",
  "uf": "SP"
}
🤝 Como contribuir
Fork o repositório.

Crie uma branch para sua feature:

bash
Copiar código
git checkout -b feature/nova-feature
Commit suas mudanças:

bash
Copiar código
git commit -am 'Adiciona nova feature'
Push para a branch:

bash
Copiar código
git push origin feature/nova-feature
Abra um Pull Request.

💡 Roadmap / Possíveis melhorias
 Cache local de CEPs para reduzir chamadas à API

 Consulta batch de CEPs ou endereços

 Widgets prontos para Flutter (formulário de endereço)

 Suporte a APIs de outros países

 Eventos de log ou callbacks detalhados de erro

🔗 Referências
ViaCEP API

Documentação Dart conditional imports

📄 Licença
MIT License. Veja o arquivo LICENSE para mais detalhes.


Feito com ❤️ por Vinicius Barros 
