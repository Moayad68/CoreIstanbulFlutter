
import 'package:firstapp/providers/facilities_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey myKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                // image ...
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Image.asset(
                    'images/logo.png',
                    scale: 0.9,
                  ),
                ),
                // welcome ...
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Text(
                        "Welcome Again!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 129, 0, 184),
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "we are happy to see you again",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    child: Form(
                      key: myKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email'),
                          const SizedBox(
                            height: 10,
                          ),
                          // email continer
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 129, 0, 184),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: TextFormField(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text('Password'),
                          const SizedBox(
                            height: 10,
                          ),
                          //password continer
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 129, 0, 184),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: TextFormField(),
                          ),
                          TextButton(
                              onPressed: () => print("forget ?? "),
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.black),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 94, 0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
