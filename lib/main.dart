// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByeBankApp());
}

class ByeBankApp extends StatelessWidget {
  const ByeBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.accent,
          ),
        ),
        home: ListaTransferencias());
  }
}
