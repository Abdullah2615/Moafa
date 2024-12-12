import 'package:doctor/model/used_styles.dart';
import 'package:doctor/view/authentication/login.dart';
import 'package:doctor/view/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mystyles.whiteColor,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset("assets/Asset 10@10x.png"),
          Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/Asset 11@10x.png",
                scale: 2,
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          Column(
            children: [
              const Spacer(),
              ClipRect(
                  child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      heightFactor: 0.95,
                      child: Image.asset("assets/Asset 8@10x.png"))),
            ],
          ),
          Column(
            children: [
              const Spacer(
                flex: 6,
              ),
              Image.asset(
                "assets/Asset 5@10x.png",
                scale: 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _myButton('Sign IN', LogInScreen()),
                  _myButton('Sign UP', SingUpScreen())
                ],
              ),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }

  Widget _myButton(String title, Widget Screen) {
    ButtonStyle _theButtonsStyle = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(0, 50.0),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255));

    return ElevatedButton(
        style: _theButtonsStyle,
        onPressed: () {
          Get.to(Screen);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Mystyles.buttonsize(Mystyles.blueColor),
          ),
        ));
  }
}
