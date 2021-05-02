import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class SecondPage extends StatelessWidget {
  SecondPage(String nom, String ape, String docu, String cur);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pagina 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SecondHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class SecondHomePage extends StatefulWidget {
  SecondHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondHomePage createState() => _SecondHomePage();
}

class _MyHomePageState extends State<MyHomePage> {
  String valueChoose;
  List cursos = ['Flutter', 'Java', 'C#', 'Phyton'];
  final nombres = TextEditingController();
  final apellidos = TextEditingController();
  final dni = TextEditingController();
  String cursito = '';

  String nom = '';
  String ape = '';
  String docu = '';
  String cur = '';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('EXAMEN APLICACIONES MOVILES 2'),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          Container(
            margin: EdgeInsets.all(20),
            child: Wrap(children: <Widget>[
              Text('Nombres'),
              TextFormField(
                controller: nombres,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
              Text('Apellidos'),
              TextFormField(
                controller: apellidos,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
              Text('DNI'),
              TextFormField(
                controller: dni,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
              Row(children: <Widget>[
                Text('Curso'),
                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 60)),
                DropdownButton(
                  hint: Text('Seleccione Curso'),
                  icon: Icon(Icons.arrow_drop_down),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                      cursito = valueChoose;
                    });
                  },
                  items: cursos.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                )
              ]),
              // ignore: deprecated_member_use
              Padding(padding: EdgeInsets.fromLTRB(120, 0, 0, 100)),
              RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.all(20),
                  child: (Text('Registrar')),
                  onPressed: () async {
                    nom = nombres.text;
                    ape = apellidos.text;
                    docu = dni.text;
                    cur = cursito;

                    debugPrint('nom: $nom');
                    debugPrint('ape: $ape');
                    debugPrint('docu: $docu');
                    debugPrint('cur: $cur');
                    await showDialog(
                      context: context,
                      builder: (context) => new AlertDialog(
                        title: new Text('Message'),
                        content: Container(
                          width: 50,
                          height: 80,
                          child: Column(
                            children: <Widget>[
                              Text('$nom'),
                              Text('$ape'),
                              Text('$docu'),
                              Text('$cur'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(); // dismisses only the dialog and returns nothing
                            },
                            child: new Text('OK'),
                          ),
                        ],
                      ),
                    );
                  })
            ]),
          )
        ],
      ),
    );
  }
}

class _SecondHomePage extends State<SecondHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage objec
        // the App.build method, and use it to set our appb
        title: Text(''),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          Container(
            margin: EdgeInsets.all(20),
            child: Wrap(children: <Widget>[
              Text('Nombres'),
              TextFormField(
                controller: TextEditingController(text: 'Hola'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 100)),
              Text('Apellidos'),
              TextFormField(
                controller: TextEditingController(text: 'Hola'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 100)),
              Text('DNI'),
              TextFormField(
                controller: TextEditingController(text: 'Hola'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 100)),
              Row(children: <Widget>[
                Text('Curso'),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 100)),
              ]),
              // ignore: deprecated_member_use
              Padding(padding: EdgeInsets.fromLTRB(120, 0, 0, 100)),
              RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.all(20),
                  child: (Text('Regresar')),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  })
            ]),
          )
        ],
      ),
    );
  }
}
