



import 'package:desiree/Presentation/Authentication/register_birthday.dart';
import 'package:desiree/Presentation/Authentication/register_email.dart';
import 'package:desiree/Presentation/Authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../Controllers/authentication_controller.dart';
import '../Components/background.dart';
import '../Components/buttons.dart';
import '../Components/text_inputs.dart';
import '../TextConfig/text_config.dart';
import 'login.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({super.key});

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
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
            AppText.label('Enter your password',color: Colors.black),
            const SizedBox(height: 10,),
            AppText.small('It’ll be used only for verification and logging in.',color: Color(0xFF727272)),
            SizedBox(height: 48,),
            Obx(() => MainInput(text: 'Password',
              onChanged: (val){
                _authController.setPassword(val);
              },
              errorMessage: _authController.emailError.value,
            ),),

            SizedBox(height: 18,),

             Obx(() => MainInput(text: 'Re-enter password',
               onChanged: (val){
                 _authController.setSecondPassword(val);
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
                      Get.to(RegisterEmail());

                    },),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: PrimaryButton(
                    text: 'Next',
                    onTap: () {
                      _authController.validateForTwoEmails(_authController.password.value,
                          _authController.secondPassword.value);
                      if(_authController.emailError.value == ""
                          && _authController.password.value != ""){
                        Get.to(RegisterBirthday());
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
