import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/firebase_options.dart';
import 'package:mgh/pages/Login/creat_acc_page.dart';
import 'package:mgh/pages/Login/forgot_pass_page.dart';
import 'package:mgh/pages/Login/login_page.dart';
import 'package:mgh/pages/admin/admin_add_property.dart';
import 'package:mgh/pages/admin/admin_edit_screen.dart';
import 'package:mgh/pages/admin/admindetails_screen.dart';
import 'package:mgh/pages/home/details_screen.dart';
import 'package:mgh/pages/home/home_screen.dart';
import 'package:mgh/pages/home/theMainHomeScreen.dart';
import 'package:mgh/state/cubit/app_logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppLogic(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? LoginPage()
          : const TheMainHomeScreen(),
      routes: {
        LoginPage.route: (context) => LoginPage(),
        CreatAccPage.route: (context) => CreatAccPage(),
        ForgotPassPage.route: (context) => ForgotPassPage(),
        TheMainHomeScreen.route: (context) => const TheMainHomeScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        DetailsScreen.route: (context) => const DetailsScreen(),
        AdminAddProperty.route: (context) => AdminAddProperty(),
        AdminDetailsScreen.route: (context) => AdminDetailsScreen(),
        AdminEditScreen.route:(context) => AdminEditScreen(),
      },
    );
  }
}
