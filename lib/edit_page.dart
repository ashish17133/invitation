import 'package:flutter/material.dart';
import 'package:invitation/database/database.dart';
import 'package:invitation/main.dart';
import 'package:invitation/model/people.dart';

import 'database/database.dart';

//editing the value from here
EditPerson editedperson = EditPerson();

//catch person name for change;
String originalname;

class Screen3 extends StatefulWidget {
  Screen3({Key key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    originalname = editedperson.name;
    print(originalname);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                changedatabase = true;
              });
            },
          ),
          title: Text("Edit Windows"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.lightGreen,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Container(
                  color: Colors.deepPurple,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "${editedperson.name}"),
                        onChanged: (value) {
                          editedperson.name = value;
                          print("${editedperson.name}");
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "${editedperson.address}"),
                        onChanged: (value) {
                          editedperson.address = value;
                          print("${editedperson.address}");
                        },
                      ),
                      TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "${editedperson.number}"),
                          onChanged: (value) {
                            editedperson.number = value;
                            print("${editedperson.number}");
                          }),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "${editedperson.status}"),
                        onChanged: (value) {
                          editedperson.status = value;
                          print("${editedperson.status}");
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await Daaatabase.update(
                                originalname,
                                editedperson.name,
                                editedperson.address,
                                editedperson.number,
                                editedperson.status);
                            setState(() {
                              changedatabase = true;
                            });
                            print("Status update code here");
                          },
                          child: Text("Update"))
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
