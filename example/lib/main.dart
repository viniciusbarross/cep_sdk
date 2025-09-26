import 'package:cep_sdk/cep_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CepExampleApp());
}

class CepExampleApp extends StatelessWidget {
  const CepExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exemplo Cep SDK",
      home: Scaffold(
        appBar: AppBar(title: const Text("Exemplo Cep SDK")),
        body: const CepExampleScreen(),
      ),
    );
  }
}

class CepExampleScreen extends StatefulWidget {
  const CepExampleScreen({super.key});

  @override
  State<CepExampleScreen> createState() => _CepExampleScreenState();
}

class _CepExampleScreenState extends State<CepExampleScreen> {
  final TextEditingController _cepController = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _cepController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Digite o CEP",
              hintText: "Ex: 01001000",
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final cep = _cepController.text;
              try {
                final result = await CepClient.getAddress(cep);
                setState(() {
                  _result = result.toString();
                });
              } catch (e) {
                setState(() {
                  _result = "Erro: $e";
                });
              }
            },
            child: const Text("Buscar CEP"),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              try {
                final results = await CepClient.searchByAddress(
                  uf: "SP",
                  city: "São Paulo",
                  street: "Praça da Sé",
                );
                setState(() {
                  _result = results.map((e) => e.toString()).join("\n\n");
                });
              } catch (e) {
                setState(() {
                  _result = "Erro: $e";
                });
              }
            },
            child: const Text("Buscar por endereço"),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                _result,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
