

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_text_field.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
   final void Function()?onTap;
   const LoginPage({super.key,required this.onTap});

   @override
   State<LoginPage> createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage> {
   //text controllers
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
  
  //sign in button
   void signIn() async {
    final authService = Provider.of<AuthService>(context , listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            ),
          ),
        );
    }
  }
  
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height:50),


              //logo
                  
              Icon(Icons.message,
              size: 100,
              color:Colors.grey[800],
              ),
               
              const SizedBox(height:50),
    
              //welcome back message
              Text(
                "welcome back you have been missed!",
                 style:TextStyle(
                fontSize: 16,
               ),
              ),
              const SizedBox(height:25),
                  
              //email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email', 
                obscureText: false,
                ),

              const SizedBox(height:10),
             

              // password textfield
                MyTextField(
                controller: passwordController,
                hintText: 'Password', 
                obscureText: true,
                ),  
                
                const SizedBox(height:25),

                  
              //sign in buttton
               MyButton(onTap: signIn, text: "sign in"),

              const SizedBox(height:50),
               
              //not a member? register noe
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text("not a member?"),
                 const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
                  
            ],
            ),
          ),
        ),
      ),
    );
  }
}