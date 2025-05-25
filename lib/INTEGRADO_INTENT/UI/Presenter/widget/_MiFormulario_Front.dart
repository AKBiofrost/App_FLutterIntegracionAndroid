import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class MyFormularioFront extends StatefulWidget {
  @override
  _MiFormularioState createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MyFormularioFront> {
  // Lista de elementos para el dropdown
  final List<String> items = [
    'Opción 1',
    'Opción 2',
    'Opción 3',
    'Opción 4'
  ];

  // Variable para almacenar el elemento seleccionado
  String? selectedItem;

  // Controlador para la animación de la tarjeta
  final FlipCardController _controller = FlipCardController();

  // Método para manejar el cambio de estado
  void handleStateChange({
    required Function(dynamic) onStateUpdate,
    required dynamic newValue
  }) {
    onStateUpdate(newValue);
  }

  // Método para actualizar el elemento seleccionado
  void updateSelectedItem(dynamic newValue) {
    setState(() {
      selectedItem = newValue;
      _controller.toggleCard();
      print("selectedItem: $selectedItem");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _FormularioFront(
          selectedItem,
          items,
          _controller
      ),
    );
  }

  // Widget de formulario frontend
  Widget _FormularioFront(
      String? selectedItem,
      List<String> items,
      FlipCardController _controller
      ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Seleccione Operación",
                        style: TextStyle(color: Colors.black, fontSize: 25)
                    ),
                    SizedBox(height: 40),
                    DropdownButton<String>(
                      value: selectedItem,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      dropdownColor: Colors.white,
                      hint: Text(
                          'Selecciona un Comando',
                          style: TextStyle(color: Colors.black)
                      ),
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                              item,
                              style: TextStyle(color: Colors.black)
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Uso del método handleStateChange
                        handleStateChange(
                            onStateUpdate: updateSelectedItem,
                            newValue: newValue
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ]
              )
          )
        ],
      ),
    );
  }
}
