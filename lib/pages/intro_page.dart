import 'package:flutter/material.dart';

import 'home_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            //  logo
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset('lib/proflutter/avocado.png'),
            ),

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'We deliver groceries at your doorstep',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            //Fresh items everyday
            Text(
              "Fresh items everyday",
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // get started button
      GestureDetector(
        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            },
        )),

            child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(24),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white),
                  ),
                ),
      ),

            const Spacer(),
],
        ),
      ),
    );
  }
}
