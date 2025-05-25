


import 'package:flutter/material.dart';



Widget _FormularioBackB(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF145EB3),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(' Demo Bivfrost Group',
            style: Theme.of(context).textTheme.displayLarge),
        Text('Toca la pantalla para volver',
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    ),
  );
}

/*
Widget _FormularioBackCompra(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          ),
          elevation: 10, // Sombra
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView_Editext(Monto, "Monto"),
              SizedBox(height: 2),
              TextView_Editext(Cedula, "Cedula"),
              SizedBox(height: 2),
              TextView_Text(VTID, "VTID"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center the chips horizontally
                  children: [
                    ChoiceChip(
                      label: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        // Adjust as needed
                        child: Text('Mostrar Voucher',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Cambia el color según lo desees
                            )),
                      ),
                      selected: isSelectedVoucher,
                      onSelected: (bool selected) {
                        setState(() {
                          isSelectedVoucher = selected;
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        // Adjust as needed
                        child: Text('Correo ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Cambia el color según lo desees
                            )),
                      ),
                      selected: isSelectedCorreo,
                      onSelected: (bool selected) {
                        setState(() {
                          isSelectedCorreo = selected;
                        });
                      },
                    )
                  ]),
              ChoiceChip(
                label: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // Adjust as needed
                  child: Text('Bloquear Cédula',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color:
                        Colors.black, // Cambia el color según lo desees
                      )),
                ),
                selected: isSelectedCedula,
                onSelected: (bool selected) {
                  setState(() {
                    isSelectedCedula = selected;
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
Widget _FormularioBackAnulacion(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          ),
          elevation: 10, // Sombra
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView_Editext(Secuencia, "Secuencia"),
              SizedBox(height: 2),
              TextView_Editext(Cedula, "Cedula"),
              SizedBox(height: 2),
              TextView_Text(VTID, "VTID"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center the chips horizontally
                  children: [
                    ChoiceChip(
                      label: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        // Adjust as needed
                        child: Text('Mostrar Voucher',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Cambia el color según lo desees
                            )),
                      ),
                      selected: isSelectedVoucher,
                      onSelected: (bool selected) {
                        setState(() {
                          isSelectedVoucher = selected;
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        // Adjust as needed
                        child: Text('Correo ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Cambia el color según lo desees
                            )),
                      ),
                      selected: isSelectedCorreo,
                      onSelected: (bool selected) {
                        setState(() {
                          isSelectedCorreo = selected;
                        });
                      },
                    )
                  ]),
              ChoiceChip(
                label: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // Adjust as needed
                  child: Text('Bloquear Cédula',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color:
                        Colors.black, // Cambia el color según lo desees
                      )),
                ),
                selected: isSelectedCedula,
                onSelected: (bool selected) {
                  setState(() {
                    isSelectedCedula = selected;
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

Widget _FormularioBackCierre(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          ),
          elevation: 10, // Sombra
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2),
              TextView_Text(VTID, "VTID"),
              ChoiceChip(
                label: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // Adjust as needed
                  child: Text('Formatear Cierre',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color:
                        Colors.black, // Cambia el color según lo desees
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
Widget _FormularioBackUltVoucher(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          ),
          elevation: 10, // Sombra
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2),
              TextView_Text(VTID, "VTID"),
              ChoiceChip(
                label: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // Adjust as needed
                  child: Text('Mostrar Voucher',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color:
                        Colors.black, // Cambia el color según lo desees
                      )),
                ),
                selected: isSelectedVoucher,
                onSelected: (bool selected) {
                  setState(() {
                    isSelectedCedula = selected;
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
Widget _FormularioBackCalibracion(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          ),
          elevation: 10, // Sombra
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2),
              TextView_Text(VTID, "VTID"),
            ],
          ),
        ),
      ],
    ),
  );
}*/