import 'package:doctor/veiw/login.dart';
import 'package:doctor/veiw/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Image.asset(
                "assets/welcome.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => Signup());
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 80, 145),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size(0, 50.0),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                          onPressed: () {
                            Get.to(() => Login());
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 80, 145),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
