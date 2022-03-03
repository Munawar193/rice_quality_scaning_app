import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_quality_scaning_app/cubit/auth_cubit.dart';
import 'package:rice_quality_scaning_app/screens/main_page.dart';
import 'package:rice_quality_scaning_app/screens/scaning_page.dart';
import 'package:rice_quality_scaning_app/screens/signUp_page.dart';
import 'package:rice_quality_scaning_app/screens/spalsh_page.dart';
import 'package:rice_quality_scaning_app/screens/tutorial_page.dart';
import 'package:rice_quality_scaning_app/screens/upload_page.dart';
import 'screens/signIn_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rice Quality Scaning App',
        routes: {
          '/': (context) => const SplashPage(),
          '/signIn-page': (context) => SignInPage(),
          '/signUp-page': (context) => SignUpPage(),
          '/main': (context) => const MainPage(),
          '/tutoriap-page': (context) => const TutorialPage(),
          '/scaning-page': (context) => const ScaningPage(),
          '/upload-page': (context) => const UploadPage(),
        },
      ),
    );
  }
}
