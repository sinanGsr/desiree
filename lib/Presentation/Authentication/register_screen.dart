

import 'package:desiree/Presentation/Authentication/login.dart';
import 'package:desiree/Presentation/Authentication/register_email.dart';
import 'package:desiree/Presentation/Authentication/register_summary.dart';
import 'package:desiree/Presentation/Components/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/authentication_controller.dart';
import '../Components/buttons.dart';
import '../Components/text_inputs.dart';
import '../TextConfig/text_config.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double pixH = MediaQuery.of(context).size.height;

    return  Scaffold(
      body:  Padding(
          padding:  EdgeInsets.only(top: pixH * 0.08,left: 36,right: 36),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AppText.header('Talky'),
                  ),
                  SizedBox(height: pixH * 0.06,),
                  AppText.screenHeader('Enter Your Name',color: Colors.black),
                  const SizedBox(height: 10,),
                  AppText.micro('You can Change it Later',color: Color(0xFF727272)),
                  SizedBox(height: 48,),
                  Obx(() => MainInput(text: 'Name',
                    onChanged: (val){
                      _authController.setName(val);
                    },
                    errorMessage: _authController.nameError.value,
                  ),),
                  SizedBox(height: 18,),
                  Obx(() => MainInput(text: 'Surname',
                    onChanged: (val){
                      _authController.setSurName(val);
                    },
                    errorMessage: _authController.surnameError.value,
                  ),),

                  SizedBox(height: 10,),

                  SizedBox(height: 48,),

                  PrimaryButton(text: 'Next',
                    onTap: () {
                    _authController.validateNameAndSurname();

                    },),

                  SizedBox(height: 18,),

                  Center(
                    child: AppText.micro('- or register via -',color:Color(0xFF727272),),
                  ),
                  SizedBox(height: 18,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButtons("Google",path: 'assets/svgs/google.svg',onPress: (){
                        _authController.signUpWithGoogle().then((value) => {
                          if(value){
                           Get.to(RegisterSummary())
                          }
                          else{
                            Get.snackbar('Auth Message',
                                "SignUp with Google Failed")
                        }
                        });
                      }),
                      SizedBox(width: 30,),
                      SocialButtons("Facebook",path: 'assets/svgs/twitter.svg'),
                      SizedBox(width: 30,),
                      SocialButtons("Apple",path: 'assets/svgs/logos_apple.svg'),
                      SizedBox(width: 30,),

                    ],
                  ),

                  SizedBox(height: 60,),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.micro('Already have an account'),
                        TextButton(onPressed: (){
                          Get.to(Login());
                        },
                            child: AppText.micro('Login',color: Color(0xff377DFF)))

                      ],
                    ),
                  )

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: bottomBox("Already have account?","Login",(){
                  //     Get.to(Login());
                  //   }),
                  // )

                ],
              ),
            ),),

    );
  }
}
