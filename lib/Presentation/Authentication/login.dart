

import 'package:desiree/Presentation/Authentication/register_screen.dart';
import 'package:desiree/Presentation/TextConfig/text_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/authentication_controller.dart';
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
    double pixH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding:  EdgeInsets.only(top: pixH * 0.08,left: 38,right: 38),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Center(
                    child: AppText.header('Talky'),
                  ),
                  SizedBox(height: pixH * 0.06,),
                  AppText.screenHeader('Welcome Back',color: Colors.black),
                 SizedBox(height: 10,),
                  AppText.micro('Enter your credentials to continue.',color: Color(0xFF727272)),
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

                  SizedBox(height: 40,),

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.micro('Don\'t have an account'),
                        TextButton(onPressed: (){
                          Get.to(const RegisterScreen());
                        },
                            child: AppText.micro('Register',color: Color(0xff377DFF)))

                      ],
                    ),
                  )

                  // bottomBox("Don’t have account?","register",(){
                  //   Get.to(const RegisterScreen());
                  // })






                ],
              ),
            ),
          ),
      ),
    );
  }




}






