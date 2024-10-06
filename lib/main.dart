import 'package:bhavesh_lingopanda/controller/auth_controller.dart';
import 'package:bhavesh_lingopanda/controller/comment_controller.dart';

import 'package:bhavesh_lingopanda/routes/custom_route.dart';
import 'package:bhavesh_lingopanda/routes/route_name.dart';
import 'package:bhavesh_lingopanda/utils/app_color.dart';
import 'package:bhavesh_lingopanda/utils/firebase_config_service.dart';
import 'package:bhavesh_lingopanda/view/sign_up_view.dart';
import 'package:bhavesh_lingopanda/view/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBVjc61jE-LwBmtzn1tBhuKzn08NHTBae0",
            authDomain: "lingopanda-bhavesh.firebaseapp.com",
            projectId: "lingopanda-bhavesh",
            storageBucket: "lingopanda-bhavesh.appspot.com",
            messagingSenderId: "1096975857103",
            appId: "1:1096975857103:web:13e957e95632ed2dc00eba",
            measurementId: "G-JTFK635CRE"));
  } else {
    await Firebase.initializeApp();
  }

  final configService = await FirebaseConfigService.init();

  runApp(MyApp(configService: configService));
}

class MyApp extends StatelessWidget {
  final FirebaseConfigService configService;
  const MyApp({super.key, required this.configService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(
          create: (_) => CommentController(configService),
        ),
      ],
      child: MaterialApp(
        title: 'LingoPanda_Bhavesh',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splash,
        onGenerateRoute: CustomRoute.allRoutes,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
          useMaterial3: true,
        ),
        home: kIsWeb ? const SignUpView() : const SplashView(),
      ),
    );
  }
}
