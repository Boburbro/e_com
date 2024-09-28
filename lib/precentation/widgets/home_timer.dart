import 'dart:async';

import 'package:flutter/material.dart';

class HomeTimer extends StatefulWidget {
  const HomeTimer({super.key});

  @override
  State<HomeTimer> createState() => _HomeTimerState();
}

class _HomeTimerState extends State<HomeTimer> {
  Duration _time = const Duration(
    days: 2,
    hours: 4,
    minutes: 32,
  );
  Timer? timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => addTime(),
    );
  }

  void addTime() {
    setState(() {
      final second = _time.inSeconds - 1;

      _time = Duration(seconds: second);
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final String day = twoDigits(_time.inDays.remainder(364));
    final String houre = twoDigits(_time.inHours.remainder(24));
    final String minut = twoDigits(_time.inMinutes.remainder(60));
    final String second = twoDigits(_time.inSeconds.remainder(60));
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(day),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(houre),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(minut),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(second),
        ),
      ],
    );
  }
}
