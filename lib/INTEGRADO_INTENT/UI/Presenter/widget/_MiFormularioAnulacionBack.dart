
import 'package:flutter/material.dart';

class MyFormularioAnulacionBack extends StatefulWidget {
  @override
  _MiFormularioState createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MyFormularioAnulacionBack> {
  // State variables for choice chips
  bool isSelectedVoucher = false;
  bool isSelectedCorreo = false;
  bool isSelectedCedula = false;

  // Text editing controllers
  final TextEditingController Secuencia = TextEditingController();
  final TextEditingController Cedula = TextEditingController();
  final TextEditingController VTID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Back Anulación'),
      ),
      body: _FormularioBackAnulacion(),
    );
  }

  Widget _FormularioBackAnulacion() {
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
                _buildTextField(Secuencia, "Secuencia"),
                SizedBox(height: 2),
                _buildTextField(Cedula, "Cedula"),
                SizedBox(height: 2),
                _buildReadOnlyTextField(VTID, "VTID"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildChoiceChip('Mostrar Voucher', isSelectedVoucher, (selected) {
                      setState(() {
                        isSelectedVoucher = selected;
                      });
                    }),
                    SizedBox(width: 10),
                    _buildChoiceChip('Correo', isSelectedCorreo, (selected) {
                      setState(() {
                        isSelectedCorreo = selected;
                      });
                    }),
                  ],
                ),
                _buildChoiceChip('Bloquear Cédula', isSelectedCedula, (selected) {
                  setState(() {
                    isSelectedCedula = selected;
                  });
                }),
                ElevatedButton(
                  onPressed: _processForm,
                  child: Text('Procesar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Helper method to create read-only text fields
  Widget _buildReadOnlyTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Helper method to create choice chips
  Widget _buildChoiceChip(String label, bool isSelected, Function(bool) onSelected) {
    return ChoiceChip(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
    );
  }

  // Method to process the form
  void _processForm() {
    // Implement your form processing logic here
    print('Secuencia: ${Secuencia.text}');
    print('Cedula: ${Cedula.text}');
    print('VTID: ${VTID.text}');
    print('Mostrar Voucher: $isSelectedVoucher');
    print('Correo: $isSelectedCorreo');
    print('Bloquear Cédula: $isSelectedCedula');
  }

  @override
  void dispose() {
    // Clean up controllers
    Secuencia.dispose();
    Cedula.dispose();
    VTID.dispose();
    super.dispose();
  }
}
