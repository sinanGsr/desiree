
import 'package:desiree/Presentation/Authentication/register_password.dart';
import 'package:desiree/Presentation/Authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
            MainInput(text: 'Email'),
            SizedBox(height: 18,),
            MainInput(text: 'Re-enter email'),

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
                     Get.to(RegisterPassword());

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
