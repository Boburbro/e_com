import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/auth/auth_bloc.dart';
import '../widgets/auth_text_field.dart';
import 'auth.dart';
import 'home.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _form = GlobalKey<FormState>();

  final TextEditingController _passwd1 = TextEditingController();
  final TextEditingController _passwd2 = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  static final _userData = {
    "name": "",
    "email": "",
    "password": "",
  };

  void _submit(BuildContext ctx) {
    FocusScope.of(ctx).unfocus();
    if (_form.currentState!.validate()) {
      if (_userData['name'] != "" &&
          _userData['email'] != "" &&
          _userData['password'] != "") {
        ctx.read<AuthBloc>().add(
              RegisterEvent(
                fullname: _userData['name']!,
                email: _userData['email']!,
                password: _userData['password']!,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logos/logo2.png',
                        height: 100,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Let’s Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Create an new account',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      AuthTextField(
                        controller: _name,
                        icon: Icons.person_outline_rounded,
                        lableText: "Full name",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Must not be empty";
                          }
                          _userData['name'] = value;
                          return null;
                        },
                      ),
                      AuthTextField(
                        controller: _email,
                        icon: Icons.mail_outline_rounded,
                        lableText: "Your email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Must not be empty";
                          }
                          if (!value.contains("@") || !value.contains(".")) {
                            return "Enter email";
                          }
                          _userData['email'] = value;
                          return null;
                        },
                      ),
                      AuthTextField(
                        controller: _passwd1,
                        icon: Icons.lock_outline_rounded,
                        lableText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Must not be empty";
                          } else if (value.length <= 5) {
                            return "Password should be at least 6 characters";
                          }

                          return null;
                        },
                      ),
                      AuthTextField(
                        controller: _passwd2,
                        icon: Icons.lock_outline_rounded,
                        lableText: "Password again",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Must not be empty";
                          }
                          if (_passwd1.text != value) {
                            return "Password don't much";
                          }
                          _userData['password'] = value;
                          return null;
                        },
                      ),
                    ],
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthAuthed) {
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                          (_) => false,
                        );
                      }
                      if (state is AuthRegFailed) {
                        showCupertinoDialog(
                          context: context,
                          builder: (ctx) => CupertinoAlertDialog(
                            content: Text(state.msg),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthRegLoading) {
                        return const FilledButton(
                          onPressed: null,
                          child: Center(
                            child: CupertinoActivityIndicator(
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                        );
                      }

                      return FilledButton(
                        onPressed: () => _submit(context),
                        child: const Text('Sign up'),
                      );
                    },
                  ),
                  const SizedBox(height: 6),
                  Column(
                    children: [
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Have a account?",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                    builder: (_) => AuthScreen()),
                                (_) => false,
                              );
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(color: Colors.blue[400]),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
