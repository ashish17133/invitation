import 'package:flutter/material.dart';
import 'package:invitation/main.dart';
import 'package:invitation/model/people.dart';
import 'package:invitation/database/database.dart';

String input_name, input_address, input_number, input_status;

class Screen1 extends StatefulWidget {
  Screen1({Key key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add a person"),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid)),
                              ),
                              onChanged: (value) {
                                input_name = value;
                                print(value);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              onChanged: (value) {
                                input_address = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Address",
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              onChanged: (value) {
                                input_number = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                input_status = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Visiting Status(Yes or No)",
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    elevation: 10.0,
                                  ),
                                  onPressed: () async {
                                    //code for saving and all
                                    await Daaatabase.inseert(Person(
                                        id: "",
                                        name: input_name,
                                        number: input_number,
                                        address: input_address,
                                        status: input_status));
                                    setState(() {
                                      changedatabase = true;
                                    });
                                    print("data saved");
                                  },
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                        shape: BoxShape.rectangle)),
              ),
            ],
          )),
    );
  }
}
