import 'package:bytebank/models/Transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              if (transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida!);
                });
              }
            });
          },
          child: Icon(Icons.add)),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(this.transferencia.valor.toString()),
      subtitle: Text(this.transferencia.numeroConta.toString()),
    ));
  }
}
