import 'package:flutter/services.dart';

class MyFlutterApp {
  static const platform = MethodChannel('hola');
  static const MethodChannel _channel = MethodChannel('hola');

  Future<void> callNativeMethod() async {
    try {
      print('Resultado del método nativo: invocacion');
      var result = await platform.invokeMethod('startMobilePOS');

      print('Resultado del método nativo: $result');
    } on PlatformException catch (e) {
      print("Error al invocar el método: '${e.message}'.");
    }
  }

  void startListening() {
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'startMobilePOS') {
        String value = call.arguments;
        // Aquí puedes manejar el valor recibido
        print('Valor recibido: $value');
      }
    });
  }

}