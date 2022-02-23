import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Todo Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input = "";
  List todo = [];

  @override
  Widget build(BuildContext context) {
    /* SafeArea */
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        /* appBar */
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 20,
          centerTitle: true,
          /* Text */
          title: Text(
            "Todo App",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              letterSpacing: 5,
            ),
          ),
        ),
        /* Button */
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white60,
          /* Icon */
          child: Icon(
            Icons.add,
            color: Colors.deepPurple,
            size: 35,
          ),
          /* onPressed function */
          onPressed: () {
            /* The showDialog Function */
            showDialog(
                context: context,
                /* BuildContext */
                builder: (BuildContext context) {
                  /* AlertDialog  */
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    backgroundColor: Color.fromARGB(255, 219, 136, 42),
                    title: Text("Add Todo"),
                    /* TextField */
                    content: TextField(
                      decoration: InputDecoration(
                        hintText: "ToDo",
                      ),

                      /* onChange Function prende il valore stringa */
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: [
                      /* TextButton  */
                      TextButton(
                        /* onPressed function, al click -> setState((){}); notifica e apporta la modificazione 
                          dello stato -> metodo add (aggiunge input all'array/List todo */
                        onPressed: () {
                          setState(() {
                            todo.add(input);
                            /* metodo print, controllo array/List nella console del flutter devTools */
                            print(todo);
                          });
                          /* metodo migliore per rimuovere l'alertDialog  */
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
        /* ---------------- */
        /* costruire ListView, prima manipolazione array/List, implementazione delete */
        /* body: Padding(
            padding: EdgeInsets.all(5),
            /*  child: ListView.builder(
            
            ),  */
          ) */
      ),
    );
  }
}
