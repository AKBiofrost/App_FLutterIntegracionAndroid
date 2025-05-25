import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CORE/MethdCallHandler/YourFlutterClass.dart';
import 'UI/Presenter/widget/_MiFormularioAnulacionBack.dart';
import 'UI/Presenter/widget/_MiFormularioCompraBack.dart';
import 'UI/Presenter/widget/_MiFormulario_CierreBack.dart';
import 'UI/Presenter/widget/_MiFormulario_Front.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController Monto;
  late TextEditingController Secuencia;
  late TextEditingController VTID;
  late TextEditingController Cedula;
  List<String> items = [
    'COMPRA',
    'CIERRE',
    'ULT_VOUCHER',
    'ANULACION',
    'CALIBRAR',
    'C@MBIO'
  ];
   String? selectedItem;
   late FlipCardController  _controller = FlipCardController();

  late bool isSelectedVoucher = false;
  late bool isSelectedCorreo = false;
  late bool isSelectedCedula = false;
  late bool isSelectedCierre= false;

  @override
  void initState() {
    super.initState();

    Monto = TextEditingController();
    VTID = TextEditingController();
    Cedula = TextEditingController();
    Secuencia= TextEditingController();
  }

  @override
  void dispose() {
    // Asegúrate de liberar los controladores cuando ya no los necesites
    Monto.dispose();
    VTID.dispose();
    Cedula.dispose();
    Secuencia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body:Body_center( context)

      /*
      peticion(
          context,
          Monto,          // Controlador de Monto
          Secuencia,      // Controlador de Secuencia
          VTID,           // Controlador de VTID
          Cedula,         // Controlador de Cédula
          selectedItem?? "default",   // Elemento seleccionado
          isSelectedCierre,   // Bandera de cierre
          isSelectedVoucher,  // Bandera de voucher
          isSelectedCedula,   // Bandera de cédula
          _controller,         // Controlador FlipCard
          _FormularioFront,    // Función del formulario frontal
          _FormularioBackCondition  // Función del formulario posterior
      ),
    */
    );
  }

/*
  *
  * */

/*
*
* */



  Widget Body_center(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _renderContent(context),
      ElevatedButton(
        onPressed: () {
          Map<String, dynamic> datos = {
            "monto": Monto.text + ".00",
            "cedula": Cedula.text,
            "vtid": VTID.text,
            "accion": selectedItem ?? 'default_value',
            "CierreFormateado": isSelectedCierre ,
            "blockCedula": isSelectedVoucher ,
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



  Widget TextView_Editext(
    TextEditingController controller,
    String TextEditing,
  ) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: TextField(
          style: TextStyle(fontSize: 20.0),
          controller: controller,
          decoration: InputDecoration(
              hintText: TextEditing, hintStyle: TextStyle(fontSize: 20.0)),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            DecimalTextInputFormatter(),
          ],
        ));
  }

  Widget TextView_Text(
    TextEditingController controller,
    String TextEditing,
  ) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              hintText: TextEditing, hintStyle: TextStyle(fontSize: 20.0)),
        ));
  }

  PreferredSize _buildAppBar(BuildContext context) {
    // Get the screen height
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate height for the Size object
    double desiredHeight = screenHeight / 2.6;

    // Define a width (you can adjust this as needed)
    double desiredWidth = 100.0; // Example width
    // Create a Size object
    Size mySize = Size(desiredWidth, desiredHeight);

    return PreferredSize(
      preferredSize: mySize,
      child: Container(
        margin: const EdgeInsets.only(top: 1),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [_TextBox(context)],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
      gradient: LinearGradient(
        colors: [Colors.white, Colors.teal.shade300],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      ),
      image: DecorationImage(
        image: NetworkImage(
            "https://cdn-images-1.medium.com/v2/resize:fit:1024/0*vowtRZE_wvyVA7CB"),
        // Use your image URL here
        fit: BoxFit.fill, // Cover the entire container
      ),
    );
  }

  Widget _TextBox(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _tabBar(context),
      SizedBox(height: 15),
      _createInfoEdicion()
    ]);
  }

  Widget _tabBar(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  Text(
                    "Flutter Power",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ]);
  }

  Widget _createInfoEdicion() {
    return const Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Align(
        alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          // Ajusta el valor según lo necesites
          child: Text(
            "Modo",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Cambia el color según lo desees
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          // Ajusta el valor según lo necesites
          child: Text(
            "Integrado",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Cambia el color según lo desees
            ),
          ),
        ),
      ),
    ]);
  }

  _renderContent(context) {

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
        front: MyFormularioFront(),
        back: _FormularioBackCondition(selectedItem ?? 'default_value'),
      ),
    );
  }

  Widget _FormularioFront() {
    return
      SingleChildScrollView(
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
                    const Text("Selecione Operación",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const SizedBox(height: 40),
                    DropdownButton<String>(
                      value: selectedItem,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      dropdownColor: Colors.white,
                      hint: const Text('Selecciona un Comando',
                          style: TextStyle(color: Colors.black)),
                      // Change to black for better visibility
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: TextStyle(
                                  color: Colors
                                      .black)), // Change to black for better visibility
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItem = newValue;
                          _controller.toggleCard();
                          print("selectedItem: $selectedItem");
                        });
                      },
                    ),
                    SizedBox(height: 20),
                  ]))
        ],
      ),
    );
  }

  Widget _FormularioBackCondition(String value) {
    if(value.isNotEmpty){
      print("value: $value");
      switch (value) {
        case 'ANULACION':
          return MyFormularioAnulacionBack(); // Llama a una función para construir el widget específico
        case 'COMPRA':
          return MyFormCompraBack(); // Otro caso
      // Agrega más casos según sea necesario
        case 'C@MBIO':
          return MyFormCompraBack(); // Otro caso
        case 'CIERRE':
          return MyFormularioCierreBack(); // Otro caso

      // Agrega más casos según sea necesario

        case 'ULT_VOUCHER':
          return _FormularioBackUltVoucher(); // Otro caso

          // Agrega más casos según sea necesario

        case 'CALIBRAR':
          return _FormularioBackCalibracion(); // Otro caso

          // Agrega más casos según sea necesario

        default:
          return _FormularioBackB(); // Widget por defecto si no hay coincidencias
      }
    }else{
      return _FormularioBackB(); // Widget por defecto si no hay coincidencias
    }


  }

  Widget _FormularioBackB() {
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
  Widget _FormularioBackCompra() {
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
  */
  Widget _FormularioBackAnulacion() {
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
                        label: const Padding(
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

  /*
  Widget _FormularioBackCierre() {
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
  */
  Widget _FormularioBackUltVoucher() {
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
                  label: const Padding(
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
  Widget _FormularioBackCalibracion() {
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
  }
}



class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Regex para validar el formato decimal
    final regex = RegExp(r'^\d*\.?\d{0,2}');

    // Comprobar si el nuevo valor coincide con el regex
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue; // Si no coincide, devolver el valor anterior
  }
}
