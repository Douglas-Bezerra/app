import 'package:flutter/material.dart';

import 'package:myapp/services/api_services.dart';
import 'package:myapp/models/cotacoes_model.dart';

class TelaConversao extends StatefulWidget {
  const TelaConversao({super.key});

  @override
  State<StatefulWidget> createState() => _TelaConversao();
}

class _TelaConversao extends State<TelaConversao> {
  
  var _codeController = TextEditingController();
  var _codeinController = TextEditingController();
  var _highController = TextEditingController();
  var _lowController = TextEditingController();
  var _timestampController = TextEditingController();
  var _createdateController = TextEditingController();

  var _valueController = TextEditingController();
  var _resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de Moedas"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _codeController,
                      decoration: const InputDecoration(
                        labelText: "De",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _codeinController,
                      decoration: const InputDecoration(
                        labelText: "Para",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _valueController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Valor",
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  ElevatedButton(
                    onPressed: () async {
                      try {
                        CotacoesModel dados = await ApiServices.conversorMoedas(
                          code: _codeController.text,
                          codein: _codeinController.text,
                        );

                        double valorOriginal = double.tryParse(_valueController.text) ?? 0.0;
                        double cotacaoAlta = double.tryParse(dados.high) ?? 0.0;
                        double resultado = valorOriginal * cotacaoAlta;

                        setState(() {
                          _highController.text = dados.high;
                          _lowController.text = dados.low;
                          _timestampController.text = dados.timestamp;
                          _createdateController.text = dados.createdate;
                          _resultController.text = resultado.toStringAsFixed(2);
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Erro na API/Rede: ${e.toString()}'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    child: const Text("Converter"),
                  ),
                ],
              ),

              SizedBox(height: 30),

              TextField(
                controller: _resultController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Resultado da Conversão",
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              SizedBox(height: 20),

              const Text("Detalhes da Cotação",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              TextField(
                controller: _highController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Alta",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: _lowController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Baixa",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: _timestampController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Timestamp (Epoch)",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: _createdateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Data de Criação (UTC)",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}