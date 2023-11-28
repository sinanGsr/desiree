
import 'package:desiree/Presentation/Authentication/register_password.dart';
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
    return BackgroundWidget(
      header: "Register",
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.label('Enter Your Email',color: Colors.black),
            const SizedBox(height: 10,),
            AppText.small('It’ll be used only for verification and logging in.',color: Color(0xFF727272)),
            SizedBox(height: 48,),

           Obx(() =>  MainInput(text: 'Email',
             onChanged:(val){
               _authController.setEmail(val);
               _authController.validateForTwoEmails(_authController.email.value,
                   _authController.secondEmail.value);
             } ,
             errorMessage: _authController.emailError.value,
           ),),

            SizedBox(height: 18,),
            Obx(() => MainInput(text: 'Re-enter email',
              onChanged: (val){
                _authController.setSecondEmail(val);
                _authController.validateForTwoEmails(_authController.email.value,
                    _authController.secondEmail.value);
              },
              errorMessage: _authController.emailError.value,
            ),),

            SizedBox(height: 48,),

           Row(
             children: [
               Expanded(
                 child: PrimaryButton(
                   buttonColor:  Color(0x0C1D1D1F),
                   textColor: Colors.black,

                   text: 'back',
                   onTap: () {
                     Get.to(RegisterScreen());

                   },),
               ),
               SizedBox(width: 10,),
               Expanded(
                 child: PrimaryButton(
                   text: 'Next',
                   onTap: () {
                     _authController.validateForTwoEmails(_authController.email.value,
                         _authController.secondEmail.value);
                     if(_authController.emailError.value == ""
                         && _authController.email.value != ""){
                       Get.to(RegisterPassword());
                     }

                   },),
               ),
             ],
           ),


              SizedBox(height: MediaQuery.of(context).size.height * 0.18,),

               bottomBox("Already have account?","Login",(){
                Get.to(Login());
              }),
            

          ],
        ),
      ),

    );
  }
}
