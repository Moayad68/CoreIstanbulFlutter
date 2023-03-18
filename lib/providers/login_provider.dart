import 'package:/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  _LoginState state = LoginState.initial;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  var email = "";
  var errorMessage = "";
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginBloc>(context);
    state = provider.state;
    return Scaffold(
      body: buildBody(),
    );
  }

  Form buildLoginForm() {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              buildLogo(),
              buildWelcomeText(),
              buildEmailInput(),
              buildPasswordInput(),
              buildLoginButton(),
              buildErrorMessage(),
            ],
          ),
        ),
      ),
    );
  }

  buildWelcomeText() {
    return Column(
      children: const [
        Text(
          'Welcome Again!',
          style: TextStyle(
            color: Color(0xFF742B83), // set the text color
            fontSize: 35, // set the font size
            fontWeight: FontWeight.bold, // set the font weight
          ),
          textAlign: TextAlign.center, // set the text alignment
        ),
        SizedBox(width: 30, height: 20),
        Text(
          'We are happy to see you again!',
          style: TextStyle(
            color: Color(0xFFb8b8b8), // set the text color
            fontSize: 15, // set the font size
          ),
          textAlign: TextAlign.center, // set the text alignment
        ),
        SizedBox(width: 30, height: 20),
      ],
    );
  }

  SizedBox buildLogo() {
    return SizedBox(
      height: 200,
      child: Text('logo.png'),
    );
  }

  String? validateEmail(String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (email != null && regExp.hasMatch(email)) {
      return null;
    } else {
      const String errorText = 'Please enter a valid email';
      return errorText;
    }
  }

  buildEmailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email', // add the goal text above the input box
          style: TextStyle(
            fontSize: 13, // customize the style of the goal text
          ),
        ),
        TextFormField(
          controller: emailController,
          validator: validateEmail,
          decoration: InputDecoration(
            labelText: 'Add Email Here',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 10, height: 50),
      ],
    );
  }

  buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF742B83),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        //_formKey.currentState!.validate();
        LoginBloc().login(emailController.text, "password");
      },
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  buildPasswordInput() {
    return Column(
      children: [
        const Text(
          'Password', // add the goal text above the input box
          style: TextStyle(
            fontSize: 13, // customize the style of the goal text
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            return null;
          },
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: IconButton(
              icon:
              Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          heightFactor: 02,
          child: GestureDetector(
            onTap: () {
              // Do something when the text is clicked
            },
            child: const Text(
              'Forgot Password?',
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  buildBody() {
    switch (state) {
      case LoginState.initial:
        return buildLoginForm();
      case LoginState.loading:
        return const Center(child: CircularProgressIndicator());
      case LoginState.failed:
        return buildLoginForm();
      case LoginState.succeeded:
        return const Center(child: Text('Login succeeded'));
    }
  }

  buildErrorMessage() {
    return  Text(
      errorMessage,
      style: const TextStyle(color: Colors.red),
    );
  }
}

