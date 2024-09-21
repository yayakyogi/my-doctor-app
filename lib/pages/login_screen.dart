import 'package:flutter/material.dart';
import 'package:my_doctor/pages/register_screen.dart';
import 'package:my_doctor/theme.dart';
import 'package:my_doctor/widgets/button/button.dart';
import 'package:my_doctor/widgets/button/button_link.dart';
import 'package:my_doctor/widgets/logo_icon.dart';
import 'package:my_doctor/widgets/textfield/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateField(String value, String field) {
    if (value.isEmpty) {
      return '$field is required';
    }

    return null;
  }

  void onLogin() {
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
                    const LogoIcon(),
                    const SizedBox(height: 40),
                    Text(
                      'Masuk dan mulai\nberkonsultasi',
                      style: font_semibold.copyWith(
                        fontSize: 20,
                        color: textPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextfieldWidget(
                      controller: _usernameController,
                      label: 'Username',
                      validator: (value) => validateField(value!, "Username"),
                    ),
                    const SizedBox(height: 20),
                    TextfieldWidget(
                      controller: _passwordController,
                      label: 'Password',
                      type: "password",
                      validator: (value) => validateField(value!, "Password"),
                    ),
                    const SizedBox(height: 20),
                    ButtonLinkWidget(
                      label: 'Forgot My Password',
                      onClick: () {},
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(
                      label: 'Login',
                      onClick: () => onLogin(),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ButtonLinkWidget(
                        label: 'Create New Account',
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
