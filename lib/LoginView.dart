import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_tile/constansts.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                   Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff373086),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "EtoV",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff373086),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                        "assets/images/login2.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    makeInput(
                      label: "Email",
                      controller: _emailController,
                    ),
                    makeInputPwd(
                      label: "Password",
                      isPasswordVisible: isPasswordVisible,
                      controller: _passwordController,
                      togglePasswordVisibility: togglePasswordVisibility,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.only(top: 0, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      loginUser(context);
                    },
                    color: Color(0xff5E64FD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff021BFF),
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> loginUser(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    var body = {'email': email, 'password': password};

    var response = await http.post(
      Uri.parse('http://voting.surabayawebtech.com/api/auth/login'),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var token = data['access_token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      Navigator.pushNamed(context, '/myHome');
      return token;
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: Text('Invalid email or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      throw Exception('Login failed');
    }
  }

  Widget makeInput(
      {label, obscureText = false, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff373086),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: const InputDecoration(
            filled: true,
            fillColor: kPrimaryLightColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
            ),
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget makeInputPwd({
    required String label,
    bool isPasswordVisible = false,
    required TextEditingController controller,
    required VoidCallback togglePasswordVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff373086),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          obscureText: !isPasswordVisible,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: kPrimaryLightColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: kPrimaryColor,
              ),
              onPressed: togglePasswordVisibility,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
