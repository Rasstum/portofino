import 'package:flutter/material.dart';
import 'package:portofino/screens/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Register"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        color: Colors.amberAccent[400],
        child: Form(
            key: _registerKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "write an email" : null,
                  onChanged: (val) async {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.length < 6 ? "at least 6 characters" : null,
                  obscureText: true,
                  onChanged: (val) async {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  child: Text("Register"),
                  onPressed: () async {
                    if (_registerKey.currentState!.validate()) {
                      print(email);
                      print(password);
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}
