# cep_sdk

[![pub package](https://img.shields.io/pub/v/cep_sdk)](https://pub.dev/packages/cep_sdk)

`cep_sdk` é um SDK **leve, multiplataforma e nativo** para Dart/Flutter que permite consultar CEPs e endereços do Brasil utilizando a [API ViaCEP](https://viacep.com.br/).  
Funciona tanto em **Android, iOS, Desktop** quanto na **Web**, sem depender de pacotes HTTP externos.

---

## 🚀 Funcionalidades

- Consulta de CEP (`getAddress`)  
- Busca de CEPs por endereço (`searchByAddress`) usando UF, cidade e logradouro  
- Normalização e formatação automática do CEP (ex.: `01001-000`)  
- Compatível com Flutter Web, Android, iOS e Desktop  
- Retorno estruturado em objeto `CepResult`  
- Simples e fácil de integrar  

---

## 📦 Instalação

Adicione a dependência no `pubspec.yaml`:

```yaml
dependencies:
  cep_sdk:
    git:
      url: https://github.com/seuusuario/cep_sdk.git
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

  for (var r in results) {
    print(r);
  }
}
📄 Classe CepResult
O retorno das consultas é sempre um objeto CepResult:

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
cep: CEP formatado (ex.: 01001-000)

logradouro: Rua, avenida, praça, etc.

bairro: Bairro do endereço

localidade: Cidade

uf: Unidade federativa (Estado)

⚡ Diferenciais do cep_sdk
Multiplataforma nativo: funciona sem depender de http ou dio.

Simples de usar: poucas linhas de código para integração.

Formatação automática de CEP: evita erros comuns.

Consulta direta via Web ou Mobile: cada plataforma usa a API nativa (HttpClient ou HttpRequest).

Pronto para Pub.dev: incluindo exemplo completo e fácil de testar.

💡 Possíveis melhorias / roadmap
 Cache local de CEPs para reduzir chamadas à API

 Validação de endereço completo antes da consulta

 Consulta batch de CEPs ou endereços

 Widgets prontos para Flutter (ex.: formulário de endereço)

 Suporte a APIs de outros países

 Eventos de log ou callbacks detalhados de erro

🔗 Referências
ViaCEP API

Documentação Dart conditional imports

📝 Licença
MIT License. Sinta-se à vontade para usar, modificar e contribuir.

Feito com ❤️ por Vinicius Barros 