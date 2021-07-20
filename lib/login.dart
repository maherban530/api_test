import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:another_flushbar/flushbar.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 420.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: AssetImage("images/image1.jfif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 250.0,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 425.0,
                  width: 370,
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                      ),
                      TextFormField(
                        controller: passwordController,
                      ),
                      ElevatedButton(
                        child: Text("LOGIN"),
                        onPressed: () async {
                          var headers = {
                            'Cookie':
                                'PHPSESSID=dcr80103ri4d4gta8j88uunc2g; currency=INR; default=ep4qbb1pan7q3cc6di6cld2ccp; language=en-gb'
                          };
                          var request = http.MultipartRequest(
                            'POST',
                            Uri.parse(
                                'https://osiamart.com/index.php?route=api/android/customer/login'),
                          );
                          request.fields.addAll({
                            'email': emailController.text,
                            'password': passwordController.text,
                            'devicetoken': '123456',
                            'devicetype': 'ios'
                          });

                          request.headers.addAll(headers);

                          http.StreamedResponse response = await request.send();

                          if (response.statusCode == 200) {
                            String status =
                                await response.stream.bytesToString();
                            var statusLength = jsonDecode(status)['success'];
                            print("status $statusLength");
                            // print(await response.stream.bytesToString());
                            if (statusLength == true) {
                              Flushbar(
                                title: "Login Successful",
                                message: "$statusLength",
                                duration: Duration(seconds: 3),
                              )..show(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            } else {
                              Flushbar(
                                title: "${jsonDecode(status)['message']}",
                                message: "$statusLength",
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          } else {
                            print(response.reasonPhrase);
                          }
                          emailController.clear();
                          passwordController.clear();
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
