import 'package:flutter/material.dart';
import 'package:invitation/database/database.dart';
import 'package:invitation/edit_page.dart';
import 'package:invitation/model/people.dart';
import 'adding_name.dart';
import 'package:invitation/database/database.dart';

Daaatabase dbmain = Daaatabase();
var value;
//Edited name passer
EditPerson editedperson = EditPerson();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbmain.initialize();
  //delete syntax goes like this
  //Daaatabase.deletee("Ashish Dhakal");

  //insert syntax goes like this
  // await Daaatabase.inseert(Person(
  //     id: "",
  //     name: "Ghanashyam Dhakal",
  //     number: "9845897016",
  //     address: "Simara,Bara",
  //     status: "Yes"));

  //getting data goes like this
  value = await Daaatabase.getdata();
  for (int i = 0; i <= value.length - 1; i++) {
    print(value[i].name);
    print(value[i].address);
    print(value[i].id);
    print(value[i].number);
    print(value[i].status);
  }
  //getting data code upto here

  //updating code goes like this
  Daaatabase.update(
      "Ghanashyam", "Alish", "simara-chittu-house", "9845778096", "Yes");

  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Screen1();
                }));
              }),
        ],
        title: Text("Invitation App"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightGreen,
        child: Items(),
      ),
    );
  }
}

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          editedperson.name = value[index].name;
          editedperson.address = value[index].address;
          editedperson.number = value[index].number;
          editedperson.status = value[index].status;

          return Container(
            height: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${value[index].name}",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "ADDRESS:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "${value[index].address}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Phone No:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text(
                                "${value[index].number}",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "Visit Status:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "${value[index].status}",
                            ),
                          ],
                        )),
                        Expanded(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Screen3();
                            }));
                          },
                          icon: Icon(Icons.edit),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
