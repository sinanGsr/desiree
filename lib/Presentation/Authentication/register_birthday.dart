

import 'package:desiree/Presentation/Authentication/register_password.dart';
import 'package:desiree/Presentation/Authentication/register_screen.dart';
import 'package:desiree/Presentation/Authentication/register_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/background.dart';
import '../Components/buttons.dart';
import '../TextConfig/text_config.dart';
import 'login.dart';

class RegisterBirthday extends StatefulWidget {
  const RegisterBirthday({super.key});

  @override
  State<RegisterBirthday> createState() => _RegisterBirthdayState();
}

class _RegisterBirthdayState extends State<RegisterBirthday> {

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, String dateType) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // You can use _selectedDate to update your model or perform any other actions
        print('$dateType: ${_selectedDate.toLocal()}');
      });
    }
  }

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
            AppText.label('Enter your birthday',color: Colors.black),
            const SizedBox(height: 10,),
            AppText.small('Your birthday will be shown only to people you add.',color: Color(0xFF727272)),
            SizedBox(height: 48,),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context, 'DD');
                    },
                    child: dateBox(_selectedDate.day),
                  ),
                ),
                const Text(
                  ' / ',
                  style: TextStyle(
                    color: Color(0xFF727272),
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context, 'MMM');
                    },
                    child: dateBox(_selectedDate.month),
                  ),
                ),
                const Text(
                  ' / ',
                  style: TextStyle(
                    color: Color(0xFF727272),
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context, 'YYY');
                    },
                    child: dateBox(_selectedDate.year),
                  ),
                ),
              ],
            ),

            SizedBox(height: 48,),

            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    buttonColor:  Color(0x0C1D1D1F),
                    textColor: Colors.black,

                    text: 'back',
                    onTap: () {
                      Get.to(RegisterPassword());

                    },),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: PrimaryButton(
                    text: 'Next',
                    onTap: () {
                      Get.to(RegisterSummary());

                    },),
                ),
              ],
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.3,),

            bottomBox("Already have account?","Login",(){
              Get.to(Login());
            }),


          ],
        ),
      ),

    );
  }

  Container dateBox(var dateToSelect) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 18),
              decoration: ShapeDecoration(
                color: Color(0x051D1D1F),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.50,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0x161D1D1F),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
            ),
            child: Center(child: AppText.small(dateToSelect.toString())),
            );
  }
}
