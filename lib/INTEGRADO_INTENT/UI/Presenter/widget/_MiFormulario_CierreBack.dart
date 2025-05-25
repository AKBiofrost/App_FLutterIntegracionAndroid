

import 'package:flutter/material.dart';

class MyFormularioCierreBack extends StatefulWidget {
  @override
  _MiFormularioState createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MyFormularioCierreBack> {
  bool isSelectedCierre = false;
  String VTID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _FormularioBackCierre()
    );
  }

  Widget _FormularioBackCierre() {
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
                SizedBox(height: 2),
                TextView_Text(VTID, "VTID"),
                ChoiceChip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text('Formatear Cierre',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  selected: isSelectedCierre,
                  onSelected: (bool selected) {
                    setState(() {
                      isSelectedCierre = selected;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método de ejemplo para TextView_Text
  Widget TextView_Text(String value, String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: value,
      ),
    );
  }
}
