import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sewamitra/firebase_options.dart';
import 'package:sewamitra/screens/home_screen.dart';
import 'package:sewamitra/screens/login_email_password_screen.dart';
import 'package:sewamitra/screens/login_screen.dart';
import 'package:sewamitra/screens/phone_screen.dart';
import 'package:sewamitra/screens/signup_email_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewamitra/services/firebase_auth_methods.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Firebase Auth Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto'
          ),

          home: const AuthWrapper(),
          routes: {
            EmailPasswordSignup.routeName: (context) =>
            const EmailPasswordSignup(),
            EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
            PhoneScreen.routeName: (context) => const PhoneScreen(),
          },
        ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key}); 

  @override
  Widget build(BuildContext context) {
      return const HomeScreen();
  }
}

