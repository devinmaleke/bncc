import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isVisible = false;
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false, // set it to false

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 232, 230, 180),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/instagramlogo.svg',
                ),
                SizedBox(height: height * 0.04),
                const Text(
                  "Welcome,",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 27, 7, 123)),
                ),
                const Text(
                  "Please Login Here!",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 27, 7, 123)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Enter Your Email"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
                            .hasMatch(value!)) {
                      return "Enter Correct Email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      ),
                      labelText: "Enter Your password"),
                ),
                NeumorphicButton(
                    margin: EdgeInsets.only(top: 50),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: Text('Login Successful'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: Colors.indigo,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        )));
  }
}
