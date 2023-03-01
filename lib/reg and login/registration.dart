import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final name_controller = TextEditingController();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  late SharedPreferences logindata;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name_controller.dispose();
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Registration Page",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: name_controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box_sharp),
                        hintText: "Enter your name",
                        labelText: "NAME",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    textInputAction: TextInputAction.next),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: username_controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box_sharp),
                        hintText: "Enter username",
                        labelText: "USERNAME",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    textInputAction: TextInputAction.next),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: password_controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box_sharp),
                        hintText: "Enter password",
                        labelText: "PASSWORD",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    textInputAction: TextInputAction.next),
              ),
              ElevatedButton(
                onPressed: () {
                  registerr();
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerr() async {
    var logindata = await SharedPreferences.getInstance();

    String name = name_controller.text;
    String uname = username_controller.text;
    String password = password_controller.text;

    if (uname != "" && password != ""){
      logindata.setString("name", name);
      logindata.setString("username", uname);
      logindata.setString("password", password);

      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
