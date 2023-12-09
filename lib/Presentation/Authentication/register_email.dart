
import 'package:desiree/Presentation/Authentication/register_number.dart';
import 'package:desiree/Presentation/Authentication/register_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Controllers/authentication_controller.dart';
import '../Components/background.dart';
import '../Components/buttons.dart';
import '../Components/text_inputs.dart';
import '../TextConfig/text_config.dart';
import 'login.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({super.key});

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {

  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double pixH = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: pixH * 0.08,left: 38,right: 38),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AppText.header('Talky'),
                  ),
                  SizedBox(height: pixH * 0.13,),
                  Center(
                    child: AppText.screenHeader('sign Up with google ',color: Colors.black),
                  ),


                 Obx(() =>  MainInput(
                   text: '',
                   label: "Enter your gmail address",
                   onChanged:(val){
                     // _authController.setEmail(val);
                     // _authController.validateForTwoEmails(_authController.email.value,
                     //     _authController.secondEmail.value);
                   } ,
                   errorMessage: _authController.emailError.value,
                 ),),

                  SizedBox(height: 18,),
                  Obx(() => MainInput(
                    text: '',
                    label: "Enter password",
                    onChanged: (val){
                      // _authController.setSecondEmail(val);
                      // _authController.validateForTwoEmails(_authController.email.value,
                      //     _authController.secondEmail.value);
                    },
                    errorMessage: _authController.emailError.value,
                  ),),

                  SizedBox(height: 48,),
                  PrimaryButton(text: 'Login',
                    onTap: () {
                      Get.to(RegisterPhoneNumber());
                    },),

                  ///old code here
                  // Row(
                 //   children: [
                 //     Expanded(
                 //       child: PrimaryButton(
                 //         buttonColor:  Color(0x0C1D1D1F),
                 //         textColor: Colors.black,
                 //
                 //         text: 'back',
                 //         onTap: () {
                 //           Get.to(RegisterScreen());
                 //
                 //         },),
                 //     ),
                 //     SizedBox(width: 10,),
                 //     Expanded(
                 //       child: PrimaryButton(
                 //         text: 'Next',
                 //         onTap: () {
                 //           // _authController.validateForTwoEmails(_authController.email.value,
                 //           //     _authController.secondEmail.value);
                 //           // if(_authController.emailError.value == ""
                 //           //     && _authController.email.value != ""){
                 //             Get.to(RegisterPassword());
                 //           // }
                 //
                 //         },),
                 //     ),
                 //   ],
                 // ),


                    SizedBox(height: MediaQuery.of(context).size.height * 0.18,),

                     bottomBox("Already have account?","Login",(){
                      Get.to(Login());
                    }),


                ],
              ),
            ),


        ),
      ),
    );
  }
}
