import 'package:can_23_teams/views/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController animateCtrl;

  @override
  void initState() {
    super.initState();
    animateCtrl = AnimationController(vsync: this);
    animateCtrl.addListener(() {
      if (animateCtrl.value > 0.96) {
        animateCtrl.stop();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (route) => false,
        );
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animateCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/json/Can23_cup.json',
          controller: animateCtrl,
          onLoaded: (composition) {
            animateCtrl
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
