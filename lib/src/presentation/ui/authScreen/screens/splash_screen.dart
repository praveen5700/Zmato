import 'package:flutter/material.dart';
import 'package:zomato/src/utils/contants/app_constants.dart';

import '../../../../core/utility/app_string.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE23744),
      body: Stack(
        children:[ 
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppString.logo1,
                width: 200,
              ),
              const SizedBox(height: 20),
              Text(
                AppString.carbon,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(179, 248, 248, 248),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
        
               const SizedBox(height: 30),
               Image.asset(AppString.logo2,width: 150,)
            ],
          ),
        ),
         Positioned(
            bottom: 0,
            left:50,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                AppString.spalshBirds,
                width: 200,
              ),
            ),
          ),
      ]),
    );
  }
}
