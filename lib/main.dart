import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Engineering"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: sampledata1,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: sampledata2,
                decoration: const InputDecoration(hintText: "IC"),
              ),
              SizedBox(
                height: 10.0,
              ),
              FloatingActionButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "field1": sampledata1.text,
                    "field2": sampledata2.text
                  };
                  FirebaseFirestore.instance.collection("User Data").add(data);
                },
                child: Text("Submit"),
                //color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
