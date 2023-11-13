



import 'package:desiree/Presentation/Components/background.dart';
import 'package:desiree/Presentation/Components/buttons.dart';
import 'package:flutter/material.dart';

import '../Components/text_inputs.dart';
import '../TextConfig/text_config.dart';

class RegisterSummary extends StatefulWidget {
  const RegisterSummary({super.key});

  @override
  State<RegisterSummary> createState() => _RegisterSummaryState();
}

class _RegisterSummaryState extends State<RegisterSummary> {
  bool _checkValue = false;
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      header: "Summary",
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainInput(text: 'Name',label: "Jhon",enabled: false,),
            SizedBox(height: 18,),
            MainInput(text: 'surname',label: "Doe",enabled: false,),
            SizedBox(height: 18,),
            MainInput(text: 'email',label: "JDoe@gmail.com",enabled: false,),
            SizedBox(height: 18,),
            MainInput(text: 'password',label: "Doe123456",enabled: false,),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText.smallBold("Date of Birth:"),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: dateBox(DateTime.now().day),
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

                    },
                    child: dateBox(DateTime.now().month),
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

                    },
                    child: dateBox(DateTime.now().year),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18,),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(0xffFFD700),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    ),
                    value: _checkValue,
                    onChanged: (val){
                  setState(() {
                    _checkValue = !_checkValue;
                  });

                }),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: text(),

                )
              ],
            ),
            PrimaryButton(text: 'Create Account',
                onTap: (){

                }),
            PrimaryButton(
                buttonColor: Color(0x0C1D1D1F),
                textColor: Colors.black,
                text: "back",
                onTap: (){

                })


      ],
    ),
        ), );
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

  Widget text(){
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By registering, you are agreeing with our ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          TextSpan(
            text: 'Terms of Use',
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              height: 0,
            ),
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
