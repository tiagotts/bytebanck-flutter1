import 'package:bytebank/components/editor.dart';
import 'package:bytebank/main.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta, rotulo: 'Numero da conta', dica: '0000'),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(onPressed: () => _criarTransferencia(context), child: Text('Confirmar')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
