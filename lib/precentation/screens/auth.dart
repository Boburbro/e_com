import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/auth/auth_bloc.dart';
import '../widgets/auth_elevated_button.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/or_line.dart';
import 'home.dart';
import 'register.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwd = TextEditingController();

  final _form = GlobalKey<FormState>();

  void _save(BuildContext ctx) {
    if (_form.currentState!.validate()) {
      if (_email.text.isNotEmpty && _passwd.text.isNotEmpty) {
        ctx.read<AuthBloc>().add(
              LogInEvent(
                email: _email.text,
                password: _passwd.text,
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
          Padding(
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
                      'Welcome to E-com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Sign in to continue',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      AuthTextField(
                        icon: Icons.mail_outline_rounded,
                        lableText: "Your email",
                        controller: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Must not be empty";
                          }
                          if (!value.contains("@") || !value.contains(".")) {
                            return "Enter email";
                          }
                          return null;
                        },
                      ),
                      AuthTextField(
                          icon: Icons.lock_outline_rounded,
                          lableText: "Password",
                          controller: _passwd,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Must not be empty";
                            } else if (value.length <= 5) {
                              return "Password should be at least 6 characters";
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLogInLoading) {
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
                      onPressed: () => _save(context),
                      child: const Text('Sign in'),
                    );
                  },
                  listener: (context, state) {
                    if (state is AuthAuthed) {
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                        (_) => false,
                      );
                    }
                    if (state is AuthLogInFailed) {
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
                ),
                const SizedBox(height: 6),
                const OrLine(),
                const SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthElevatedButton(
                      imagePath: "assets/logos/google.png",
                      title: "Login with Google",
                      onPressed: () {
                        context.read<AuthBloc>().add(LogInGoogleEvent());
                      },
                    ),
                    const SizedBox(height: 6),
                    AuthElevatedButton(
                      imagePath: 'assets/logos/github.png',
                      title: "Login with GitHub",
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue[400]),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have a account?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                  builder: (_) => RegisterScreen()),
                              (_) => false,
                            );
                          },
                          child: Text(
                            "Register",
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
        ],
      ),
    );
  }
}
