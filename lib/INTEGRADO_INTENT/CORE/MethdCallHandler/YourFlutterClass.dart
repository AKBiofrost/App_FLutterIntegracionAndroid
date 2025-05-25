import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../UI/utiles/Dialog.dart';

class YourFlutterClass {
  static const platform = MethodChannel('hola');

  void startMobilePOS(BuildContext context, String datos) async {
    try {
      var result = await await platform
          .invokeMethod('startMobilePOS', {'peticion': datos});



      // Extracting values into separate variables
      String estado = "";
      String textom = "";
      var decodedResponse;

      try {
        // Decode the JSON response
        decodedResponse = jsonDecode(result);
      }catch  (e) {

      }

      try {
        estado = decodedResponse['Estado'];
        textom = decodedResponse['Textom'];
      } catch (e) {
        textom = result;
      }

      print("Datos recibidos estado: $estado");
      print("Datos recibidos textom: $textom");

      mostrarBottomSheet(context, textom, "Estado $estado ", "Continuar");
    } on PlatformException catch (e) {
      print("Error al iniciar Mobile POS: '${e.message}'.");
    }

    platform.setMethodCallHandler((call) async {
      if (call.method == "startMobilePOS") {
        String responseData = call.arguments;
        // Procesa la respuesta JSON aquí
        print("Datos recibidos: $responseData");
      }
    });
  }
}
