import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/pages/opt_verification.dart';
//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:elaka_delivery_app/widgets/opt.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:email_auth/email_auth.dart';
import 'package:elaka_delivery_app/services/Auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _obscureText = true;
  final TextEditingController _resetEmailController = TextEditingController();
  // final _auth = FirebaseAuth.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize the package
  //   emailAuth = new EmailAuth(
  //     sessionName: "Ealaka App",
  //   );

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const HeightBox(85),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        // height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 35,
                                  spreadRadius: 30,
                                  offset: const Offset(3, 3))
                            ]),
                        child:
                            const Image(image: AssetImage("images/logo.png"))),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            // height: 30,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  blurRadius: 15,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        controller: _resetEmailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            label: const Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter Email",
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 206, 113))),
                            border: const OutlineInputBorder(),
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(
                                top: 11,
                                bottom: 11,
                                right: 8,
                                left: 11,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 78, 206, 113),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.lock_reset_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ))),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 78, 206, 113),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          print(_resetEmailController.text);

                          forgotPass(_resetEmailController.text);
                          //  _auth.sendPasswordResetEmail(email: _resetEmailController.text);
                          Fluttertoast.showToast(
                              msg: "Please check your mailbox");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
