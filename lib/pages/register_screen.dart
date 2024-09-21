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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextfieldWidget(
                    label: 'Full Name',
                    controller: _fullnameController,
                  ),
                  const SizedBox(height: 24),
                  TextfieldWidget(
                    label: 'Pekerjaan',
                    controller: _workController,
                  ),
                  const SizedBox(height: 24),
                  TextfieldWidget(
                    label: 'Email Address',
                    controller: _emailController,
                    type: "email",
                  ),
                  const SizedBox(height: 24),
                  TextfieldWidget(
                    label: 'Password',
                    controller: _passwordController,
                    type: "password",
                  ),
                  const SizedBox(height: 40),
                  ButtonWidget(
                    label: "Continue",
                    onClick: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
