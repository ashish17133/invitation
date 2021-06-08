import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key key}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  void initState() {
    getpref();
    print(showphonevalue);
    super.initState();
  }

  bool showphonevalue;
  Future<void> getpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showphonevalue = prefs.getBool("phonepref") ?? true;
    setState(() {});

    if (showphonevalue == null) {
      showphonevalue = true;
    }
  }

  Future<void> setpref(bool prefvalue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("phonepref", prefvalue);
    showphonevalue = prefvalue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Setting"),
            ),
            body: Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setpref(true);
                        },
                        child: Text(
                          "Show Phone number",
                          style: TextStyle(
                              color: showphonevalue == true
                                  ? Colors.red
                                  : Colors.yellow),
                        )),
                    TextButton(
                      onPressed: () {
                        setpref(false);
                      },
                      child: Text("Hide phone number",
                          style: TextStyle(
                              color: showphonevalue == false
                                  ? Colors.red
                                  : Colors.yellow)),
                    ),
                  ],
                ))));
  }
}
