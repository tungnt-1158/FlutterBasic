import 'package:baitap1/app_sig_in/sign_in_button.dart';
import 'package:baitap1/app_sig_in/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.orangeAccent,
              Colors.pink,
            ],
          )),
          child: _viewContent(),
        ),
      ),
    );
  }

  Widget _viewContent() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 68.0),
          Image.file(
            File('/Users/nguyen.thanh.tungf/AndroidStudioProjects/BaiTapFullter/BaiTap1/assets/images/sign-in.png'),
            height: 105,
            width: 65,
          ),

          SizedBox(height: 8.0),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'CONN',
                  style: TextStyle(
                    color: Colors.pink.withOpacity(0.8),
                    fontSize: 38.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'EXION',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 38.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 8.0),
          Text(
            "Find and Meet people around \n you to find LOVE",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 80.0),
          SignInButton(
            text: 'Sign in with Facebook',
            textColor: Colors.deepOrangeAccent,
            color: Colors.white,
            image:
                '/Users/nguyen.thanh.tungf/AndroidStudioProjects/BaiTapFullter/BaiTap1/assets/images/facebook.png',
            onPressed: () {},
          ),

          SizedBox(height: 18.0),
          SignInButton(
            text: 'Sign in with Twitter',
            textColor: Colors.deepOrangeAccent,
            color: Colors.white,
            image:
                '/Users/nguyen.thanh.tungf/AndroidStudioProjects/BaiTapFullter/BaiTap1/assets/images/twitter.png',
            onPressed: () {},
          ),

          SizedBox(height: 18.0),
          SignUpButton(
            text: 'Sign up',
            textColor: Colors.deepOrangeAccent,
            color: Colors.white,
            onPressed: () {},
          ),

          SizedBox(height: 10.0),
          RaisedButton(
            elevation: 0,
            color: Colors.transparent,
            onPressed: () {},
            child: Text(
              'ALREADY REGISTERD? SIGN IN',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
