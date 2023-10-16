import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          //if user is logged in
          if(snapshot.hasData){
            return const HomePage();
          }
          //if user is not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}