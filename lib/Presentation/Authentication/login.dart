

import 'package:desiree/Presentation/Authentication/register_screen.dart';
import 'package:desiree/Presentation/TextConfig/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controllers/authentication_controller.dart';
import '../Components/background.dart';
import '../Components/buttons.dart';
import '../Components/text_inputs.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      header: 'Login',
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            AppText.label('Welcome Back',color: Colors.black),
           SizedBox(height: 10,),
            AppText.small('Enter your credentials to continue.',color: Color(0xFF727272)),
            SizedBox(height: 48,),

            Obx(() => MainInput(text: 'Email',
              onChanged: (val){
              _authController.setEmail(val);
              _authController.validateEmail();
            },
              errorMessage: _authController.emailError.value,
            ),),
            SizedBox(height: 18,),
            Obx(() => MainInput(
              text: 'Password',onChanged: (val){
              _authController.setPassword(val);
            },
              errorMessage: _authController.passwordError.value,
            ),),
            SizedBox(height: 10,),

            AppText.micro('Forgot username/password?'),

            SizedBox(height: 48,),

            PrimaryButton(text: 'Login',
              onTap: () {
              _authController.validateEmailPasswordEmpty();
            },),

            SizedBox(height: 18,),

            Center(
              child: AppText.micro('- or login via -',color:Color(0xFF727272),),
            ),
            SizedBox(height: 18,),


           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SocialButtons("Google",path: 'assets/svgs/google.svg',
               onPress: () async {

                await _authController.signInWithGoogle().then((value){
                  if(value){
                    Get.snackbar("Auth Message",
                        "Login Successful");
                  }
                  else{
                    Get.snackbar("Auth Message",
                        "User does not exist");

                  }
                });

               }
               ),
               SizedBox(width: 30,),
               SocialButtons("Facebook",path: 'assets/svgs/twitter.svg'),
               SizedBox(width: 30,),
               SocialButtons("Apple",path: 'assets/svgs/logos_apple.svg'),
               SizedBox(width: 30,),

             ],
           ),

            SizedBox(height: 30,),

            bottomBox("Don’t have account?","register",(){
              Get.to(const RegisterScreen());
            })






          ],
        ),
      ),);
  }




}






