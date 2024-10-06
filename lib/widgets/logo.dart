import 'package:flutter/material.dart';
import 'package:bhavesh_lingopanda/utils/app_constants.dart';

class AnimatedLogoDialog extends StatelessWidget {
  final double size;

  const AnimatedLogoDialog({super.key, required this.size});

  void _showAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) => Container(),
      transitionBuilder: (context, animation1, animation2, child) {
        var curve = Curves.easeInOut;
        var tween =
            Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: curve));
        return Transform.scale(
          scale: animation1.drive(tween).value,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: const SizedBox(
              height: 200,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(ImagePath.appLogo),
                    radius: 40,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to LingoPanda!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Thanks for the opportunity, Grateful!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '-Bhavesh',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAnimatedDialog(context),
      child: CircleAvatar(
        backgroundImage: const AssetImage(ImagePath.appLogo),
        radius: size,
      ),
    );
  }
}

Widget buildLogo(double size) {
  return AnimatedLogoDialog(size: size);
}
