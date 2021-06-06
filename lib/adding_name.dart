import 'package:flutter/material.dart';

String input_name, input_address, input_number;

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
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    elevation: 10.0,
                                  ),
                                  onPressed: () {
                                    //code for saving and all
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
