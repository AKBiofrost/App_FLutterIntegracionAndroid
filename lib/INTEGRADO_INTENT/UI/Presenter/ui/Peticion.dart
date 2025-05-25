import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../CORE/MethdCallHandler/YourFlutterClass.dart';



class peticion extends StatelessWidget {
  final Widget childFront;
  final Widget childBack;
  final TextEditingController Monto;
  final TextEditingController Secuencia;
  final TextEditingController VTID;
  final TextEditingController Cedula;
  final String selectedItem;
  final bool isSelectedCierre;
  final bool isSelectedVoucher;
  final bool isSelectedCedula;
  final FlipCardController controller;

  const peticion( {
    super.key,
    required this.childFront,
    required this.childBack,
    required this.Monto,
    required this.Secuencia,
    required this.VTID,
    required this.Cedula,
    required this.selectedItem,
    required this.isSelectedCierre,
    required this.isSelectedVoucher,
    required this.isSelectedCedula,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _renderContent(context, controller, childFront,
          childBack, selectedItem),
      ElevatedButton(
        onPressed: () {
          Map<String, dynamic> datos = {
            "monto": Monto.text + ".00",
            "cedula": Cedula.text,
            "vtid": VTID.text,
            "accion": selectedItem ?? " ",
            "CierreFormateado": isSelectedCierre,
            "blockCedula": isSelectedCedula,
            "voucher": isSelectedVoucher,
            "seqnum": Secuencia.text,
          };
          // Convertir el mapa a JSON
          String datosJson = jsonEncode(datos);

          YourFlutterClass().startMobilePOS(context, datosJson);
        },
        child: Text('Enviar Petición',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    ])));
  }
}


/*
Widget Body_center(
    BuildContext context,
    TextEditingController Monto,
    TextEditingController Secuencia,
    TextEditingController VTID,
    TextEditingController Cedula,
    String selectedItem,
    bool isSelectedCierre,
    bool isSelectedVoucher,
    bool isSelectedCedula,
    FlipCardController controller,
    {required Widget Function() formularioFront,
    required Widget Function(String) formularioBackCondition}) {
  return SingleChildScrollView(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    _renderContent(context, controller, formularioFront,
        formularioBackCondition, selectedItem),
    ElevatedButton(
      onPressed: () {
        Map<String, dynamic> datos = {
          "monto": Monto.text + ".00",
          "cedula": Cedula.text,
          "vtid": VTID.text,
          "accion": selectedItem ?? 'default_value',
          "CierreFormateado": isSelectedCierre,
          "blockCedula": isSelectedCedula,
          "voucher": isSelectedVoucher,
          "seqnum": Secuencia.text,
        };
        // Convertir el mapa a JSON
        String datosJson = jsonEncode(datos);

        YourFlutterClass().startMobilePOS(context, datosJson);
      },
      child: Text('Enviar Petición',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ),
  ])));
}
*/



_renderContent(
    context,
    FlipCardController _controller,
    Widget  formularioFront,
    Widget  formularioBackCondition,
    String selectedItem) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0), // Bordes redondeados
    ),
    elevation: 20,
    color: Color(0xFF145EB3),
    child: FlipCard(
      controller: _controller,
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 800,
      onFlipDone: (status) {
        print(status);
      },
      front: formularioFront,
      back: formularioBackCondition,
    ),
  );
}
