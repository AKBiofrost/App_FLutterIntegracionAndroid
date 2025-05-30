import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void mostrarBottomSheet(BuildContext context, String nombre, String precio, String etiqueta) {

  if (nombre.isNotEmpty && precio.isNotEmpty) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: Container(
            height: 300,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    precio,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4C92CC),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(etiqueta),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
      },
    );
  } else {
    // Manejo de errores si alguno de los parámetros es nulo o vacío
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Por favor proporciona un nombre, precio e imagen válidos.'),
    ));
  }
}
void mostrarBottomSheetFallido(
    BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    // Establecer en false para evitar que se oculte al tocar fuera
    isScrollControlled: true,
    // Agregar esta línea para evitar errores de layout
    backgroundColor: Colors.transparent,
    // Establecer el fondo transparente
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        // Bordes redondeados en la parte superior
        child: Container(
          height: 400, // Altura del BottomSheet
          color: Colors.white,
          child: Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fallo inesperado",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Intente nuevamente.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA20000),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      foregroundColor:
                      Colors.white, // Establece el color del texto aquí
                    ),
                    child: Text('Comprar'),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}