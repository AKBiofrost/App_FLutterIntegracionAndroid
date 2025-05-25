
import 'package:flutter/material.dart';
/*

class _MyFormCompraBack extends StatefulWidget {
  @override
  _MyFormularioBackCompraState createState() => _MyFormularioBackCompraState();
}

class _MyFormularioBackCompraState extends State<_MyFormCompraBack> {
  bool isSelectedVoucher = false;
  bool isSelectedCorreo = false;
  bool isSelectedCedula = false;
  dynamic selectedItem;

  // Method to handle state changes generically
  void handleStateChange({
    required Function(dynamic) onStateUpdate,
    required dynamic newValue
  }) {
    onStateUpdate(newValue);
  }

  // Method to update selected item
  void updateSelectedItem(dynamic newValue) {
    setState(() {
      selectedItem = newValue;
      // Optional: Add any additional logic
      print("selectedItem: $selectedItem");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _FormularioBackCompra(context),
    );
  }
  Widget _FormularioBackCompra(BuildContext context) {
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
                // Your existing widgets...
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text('Mostrar Voucher'),
                      selected: isSelectedVoucher,
                      onSelected: (bool selected) {
                        // Use handleStateChange for Voucher
                        handleStateChange(
                            onStateUpdate: (value) {
                              setState(() {
                                isSelectedVoucher = value;
                              });
                            },
                            newValue: selected
                        );
                      },
                    ),
                    ChoiceChip(
                      label: Text('Correo'),
                      selected: isSelectedCorreo,
                      onSelected: (bool selected) {
                        // Use handleStateChange for Correo
                        handleStateChange(
                            onStateUpdate: (value) {
                              setState(() {
                                isSelectedCorreo = value;
                              });
                            },
                            newValue: selected
                        );
                      },
                    ),
                    ChoiceChip(
                      label: Text('Bloquear Cédula'),
                      selected: isSelectedCedula,
                      onSelected: (bool selected) {
                        // Use handleStateChange for Cédula
                        handleStateChange(
                            onStateUpdate: (value) {
                              setState(() {
                                isSelectedCedula = value;
                              });
                            },
                            newValue: selected
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}*/

import 'package:flutter/material.dart';

class MyFormCompraBack extends StatefulWidget {
  const MyFormCompraBack({Key? key}) : super(key: key);

  @override
  _MyFormularioBackCompraState createState() => _MyFormularioBackCompraState();
}

class _MyFormularioBackCompraState extends State<MyFormCompraBack> {
  bool isSelectedVoucher = false;
  bool isSelectedCorreo = false;
  bool isSelectedCedula = false;
  dynamic selectedItem;

  // Generalized method to handle state changes
  void handleStateChange({
    required Function(dynamic) onStateUpdate,
    required dynamic newValue
  }) {
    setState(() {
      onStateUpdate(newValue);
    });
  }

  // Method to update selected item
  void updateSelectedItem(dynamic newValue) {
    setState(() {
      selectedItem = newValue;
      debugPrint("selectedItem: $selectedItem");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Compra'),
      ),
      body: _buildFormularioBackCompra(context),
    );
  }

  Widget _buildFormularioBackCompra(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildChoiceChips(),
              const SizedBox(height: 20),
              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceChips() {
    return Wrap(
      spacing: 8.0,
      children: [
        _buildSingleChoiceChip(
          label: 'Mostrar Voucher',
          isSelected: isSelectedVoucher,
          onSelected: (selected) {
            handleStateChange(
              onStateUpdate: (value) => isSelectedVoucher = value,
              newValue: selected,
            );
          },
        ),
        _buildSingleChoiceChip(
          label: 'Correo',
          isSelected: isSelectedCorreo,
          onSelected: (selected) {
            handleStateChange(
              onStateUpdate: (value) => isSelectedCorreo = value,
              newValue: selected,
            );
          },
        ),
        _buildSingleChoiceChip(
          label: 'Bloquear Cédula',
          isSelected: isSelectedCedula,
          onSelected: (selected) {
            handleStateChange(
              onStateUpdate: (value) => isSelectedCedula = value,
              newValue: selected,
            );
          },
        ),
      ],
    );
  }

  Widget _buildSingleChoiceChip({
    required String label,
    required bool isSelected,
    required Function(bool) onSelected,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: Colors.blue.shade100,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
