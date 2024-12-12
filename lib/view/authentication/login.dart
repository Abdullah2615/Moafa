import 'package:doctor/model/used_styles.dart';
import 'package:doctor/view/authentication/signup.dart';
import 'package:doctor/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordVisible = false;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      ClipRect(
                        child: Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          heightFactor: 0.4,
                          child: Image.asset(
                            "assets/Asset 7@10x.png",
                            scale: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      ClipRect(
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          heightFactor: 0.58,
                          widthFactor: 0.7,
                          child: Image.asset(
                            "assets/Asset 6@10x.png",
                            scale: 2.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(
                        flex: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Image.asset(
                          "assets/Asset 5@10x.png",
                          scale: 3.8,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: Mystyles.headersize(Mystyles.blueColor),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 800, 0)),
                Text("Please login or Sign up to continue",
                    style: Mystyles.notessize(Mystyles.grey)),
                _myFormField('Email or Phone', false),
                _myFormField('Password', true),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 0, 5, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text("Forget Password",
                          style: Mystyles.notessize(Mystyles.grey))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    child: Text(
                      "Signin",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.84,
                          MediaQuery.of(context).size.height * 0.07),
                      backgroundColor: Mystyles.blueColor,
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Don`t have an account? '),
                  TextButton(
                      onPressed: () {
                        Get.to(SingUpScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      )),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _myFormField(
      String label, /*TextEditingController theController,*/ bool isPassword) {
    bool _isPasswordVisible = false;

    return isPassword
        ? Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFormField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: '   $label',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Mystyles.blueColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Mystyles.blueColor),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // setState(() {
                    //   _isPasswordVisible = !_isPasswordVisible;
                    // });
                  },
                ),
              ),
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '   $label',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Mystyles.blueColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Mystyles.blueColor),
                ),
              ),
            ),
          );
  }
}
