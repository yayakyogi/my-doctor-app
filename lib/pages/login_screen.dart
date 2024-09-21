import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
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
                    label: 'Username',
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 20),
                  TextfieldWidget(
                    label: 'Password',
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 10),
                  ButtonLinkWidget(label: 'Forgot My Password', onClick: () {}),
                  const SizedBox(height: 40),
                  ButtonWidget(
                    label: 'Login',
                    onClick: () {},
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ButtonLinkWidget(
                      label: 'Create New Account',
                      onClick: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
