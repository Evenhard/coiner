import 'package:crypto_app/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_notification/in_app_notification.dart';

import '../widgets/message.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF6cddbd),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/logo.gif'),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: const [
                    Text(
                      'COINER',
                      style: TextStyle(
                        color: Color(0xFFffdb8a),
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.white),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.white),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Узнай больше о криптовалютах и',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'смотри в будущее вместе с нами',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBar(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFffdb8a),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Ворваться',
                          style: TextStyle(
                            // color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RotationTransition(
                          turns: AlwaysStoppedAnimation(310 / 360),
                          child: Icon(Icons.arrow_forward_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
