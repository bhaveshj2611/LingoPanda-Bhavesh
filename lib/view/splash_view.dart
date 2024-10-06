import 'package:bhavesh_lingopanda/routes/route_name.dart';
// import 'package:bhavesh_lingopanda/utils/app_color.dart';
import 'package:bhavesh_lingopanda/utils/app_constants.dart';
import 'package:bhavesh_lingopanda/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> gotoNextScreen() async {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    await Future.delayed(const Duration(seconds: 3));

    {
      if (!isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(RouteName.signUp);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteName.comments);
      }
    }
  }

  @override
  void initState() {
    gotoNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLogo(120),
                const SizedBox(height: 20), 
                const Text(
                  "bhavesh@lingopanda.app",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

        
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                ImagePath.banner, 
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
