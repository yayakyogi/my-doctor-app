import 'package:flutter/material.dart';
import 'package:my_doctor/theme.dart';
import 'package:my_doctor/widgets/button/button.dart';
import 'package:my_doctor/widgets/textfield/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateField(String value, String field) {
    if (value.isEmpty) {
      return '$field is required';
    }

    return null;
  }

  String? validatePassword(String value) {
    RegExp regexMinCaracter = RegExp(r'^.{8,}$');
    RegExp regextUpperCase = RegExp(r'(?=.*[A-Z])');
    RegExp regextLowerCase = RegExp(r'(?=.*[a-z])');
    RegExp regexDigit = RegExp(r'(?=.*?[0-9])');
    RegExp regexCaracter = RegExp(r'(?=.*?[!@#\$&*~])');

    if (value.isEmpty) {
      return 'Please enter password';
    }

    if (!regexMinCaracter.hasMatch(value)) {
      return 'Must be at least 8 characters in length';
    }

    if (!regextUpperCase.hasMatch(value)) {
      return 'Should contain at least one upper case ';
    }

    if (!regextLowerCase.hasMatch(value)) {
      return 'Should contain at least one lower case';
    }

    if (!regexDigit.hasMatch(value)) {
      return 'Should contain at least one digit';
    }

    if (!regexCaracter.hasMatch(value)) {
      return 'Should contain at least one Special character';
    }

    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }

    bool validEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    if (!validEmail) {
      return "Email is not valid";
    }

    return null;
  }

  void onContinue() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: primaryColor,
          content: Text(
            'Processing Data',
            style: font_semibold.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textPrimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Daftar Akun',
          style: font_semibold.copyWith(fontSize: 20, color: textPrimaryColor),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextfieldWidget(
                      controller: _fullnameController,
                      label: 'Full Name',
                      validator: (value) => validateField(value!, 'Full name'),
                    ),
                    const SizedBox(height: 24),
                    TextfieldWidget(
                      controller: _workController,
                      label: 'Work',
                      validator: (value) => validateField(value!, 'Password'),
                    ),
                    const SizedBox(height: 24),
                    TextfieldWidget(
                      controller: _emailController,
                      label: 'Email Address',
                      type: "email",
                      validator: (value) => validateEmail(value!),
                    ),
                    const SizedBox(height: 24),
                    TextfieldWidget(
                      controller: _passwordController,
                      label: 'Password',
                      type: "password",
                      validator: (value) => validatePassword(value!),
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(label: "Continue", onClick: onContinue),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
