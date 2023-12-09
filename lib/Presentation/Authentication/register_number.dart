import 'package:desiree/Presentation/Authentication/register_birthday.dart';
import 'package:desiree/Presentation/Authentication/register_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../Controllers/authentication_controller.dart';
import '../Components/background.dart';
import '../Components/buttons.dart';
import '../Components/text_inputs.dart';
import '../TextConfig/text_config.dart';
import 'login.dart';

class RegisterPhoneNumber extends StatefulWidget {
  const RegisterPhoneNumber({super.key});

  @override
  State<RegisterPhoneNumber> createState() => _RegisterPhoneNumberState();
}

class _RegisterPhoneNumberState extends State<RegisterPhoneNumber> {
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double pixH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: pixH * 0.08, left: 38, right: 38),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppText.header('Talky'),
                ),
                SizedBox(
                  height: pixH * 0.06,
                ),
                Center(
                  child: AppText.screenHeader('Enter your password',
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Center(
                        child: Container(
                          width: 24,
                          height: 19,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 100,
                        width: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  isCollapsed: true,
                                  hintStyle: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: "enter number",
                                  fillColor: Color(0x051D1D1F),
                                  border: InputBorder.none)),
                        ),
                      )
                      // TextFormField(
                      //
                      // )
                    ],
                  ),
                ),

                SizedBox(
                  height: pixH * 0.36,
                ),


                     PrimaryButton(
                        text: 'Next',
                        onTap: () {
                          _authController.validateForTwoEmails(
                              _authController.password.value,
                              _authController.secondPassword.value);
                          if (_authController.emailError.value == "" &&
                              _authController.password.value != "") {
                            Get.to(const RegisterBirthday());
                          }
                        },
                      ),


                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                bottomBox("Already have account?", "Login", () {
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
