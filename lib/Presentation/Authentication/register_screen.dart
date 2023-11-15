

import 'package:desiree/Presentation/Authentication/login.dart';
import 'package:desiree/Presentation/Authentication/register_email.dart';
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
    return BackgroundWidget(
        header: "Register",
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.label('Enter Your Name',color: Colors.black),
            const SizedBox(height: 10,),
            AppText.small('You can Change it Later',color: Color(0xFF727272)),
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
                SocialButtons("Google",path: 'assets/svgs/google.svg'),
                SizedBox(width: 30,),
                SocialButtons("Facebook",path: 'assets/svgs/twitter.svg'),
                SizedBox(width: 30,),
                SocialButtons("Apple",path: 'assets/svgs/logos_apple.svg'),
                SizedBox(width: 30,),

              ],
            ),

            SizedBox(height: 30,),

            Align(
              alignment: Alignment.bottomCenter,
              child: bottomBox("Already have account?","Login",(){
                Get.to(Login());
              }),
            )

          ],
        ),
      ),

    );
  }
}
