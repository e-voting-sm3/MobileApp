import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_tile/constansts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
   bool isConfirmPasswordVisible = false;

  Future<void> registerUser(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validasi email dan password

    if (_nameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Failed'),
            content: Text('Please enter your name.'),
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
      return;
    }

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Failed'),
            content: Text('Passwords do not match. Please try again.'),
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
      return;
    }

    var body = {
      'name': _nameController.text,
      'email': email,
      'password': password,
    };

    var response = await http.post(
      Uri.parse('http://voting.surabayawebtech.com/api/auth/register'),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );
    var responseBody = json.decode(response.body);
    var message = responseBody['message'];

    if (message == 'Registration successful') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Successful'),
            content: Text('You have successfully registered.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Failed'),
            content: Text('Failed to register. Please try again.'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
            vertical: size.height * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/signup.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        makeInputName(label: "Name", controller: _nameController),
                        makeInputEmail(
                            label: "Email", controller: _emailController),
                        makeInputPwd(
                          label: "Password",
                          isPasswordVisible: isPasswordVisible,
                          controller: _passwordController,
                          togglePasswordVisibility: togglePasswordVisibility,
                        ),
                         makeInputConfirmPwd(
                          label: "Confirm Password",
                          isConfirmPasswordVisible: isConfirmPasswordVisible,
                          controller: _confirmPasswordController,
                           toggleConfirmPasswordVisibility: toggleConfirmPasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          registerUser(context);
                        },
                        color: Color(0xff5E64FD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("Already have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Login",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInputName({
    required String label,
    bool obscureText = false,
    required TextEditingController controller,
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
              Icons.person,
              color: kPrimaryColor,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget makeInputEmail({
    required String label,
    bool obscureText = false,
    required TextEditingController controller,
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

Widget makeInputConfirmPwd({
  required String label,
  bool isConfirmPasswordVisible = false,
  required TextEditingController controller,
  required VoidCallback toggleConfirmPasswordVisibility,
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
        obscureText: !isConfirmPasswordVisible,
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
              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
            onPressed: toggleConfirmPasswordVisibility,
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
  
  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }
}
