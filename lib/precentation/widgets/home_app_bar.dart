import '../../logic/bloc/auth/auth_bloc.dart';
import '../screens/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: non_constant_identifier_names
AppBar HomeAppBar = AppBar(
  title: Container(
    padding: const EdgeInsets.all(8),
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: const Row(
      children: [
        Icon(
          Icons.search_rounded,
          color: Colors.blue,
        ),
        SizedBox(width: 4),
        Text(
          "Search Product",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    ),
  ),
  actions: [
    BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(
                  LoggedOutEvent(
                    isLogOut: true,
                  ),
                ),
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      listener: (context, state) {
        if (state is AuthUnauthed) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (_) => AuthScreen(),
            ),
            (_) => false,
          );
        }
      },
    ),
  ],
);
