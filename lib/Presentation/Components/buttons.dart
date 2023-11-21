

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../TextConfig/text_config.dart';

class PrimaryButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key, required this.text, required this.onTap, this.buttonColor, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:buttonColor ?? Color(0xffFFD700),
          elevation: 1,
          shadowColor: buttonColor??Color(0xffFFD700),
          foregroundColor:buttonColor?? Color(0xffFFD700),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        onPressed: (){
          onTap();
        },
        child: Center(
          child: AppText.small(text,color: textColor??Colors.white),
        ));
  }
}

void _defaultOnPress(){
  print("{onPress}");
}
InkWell SocialButtons(String text,{String path = 'assets/svgs/logos_apple.svg',Function onPress = _defaultOnPress}) {
  return InkWell(
    splashColor: Colors.red,
    onTap: (){
      onPress();
    },
    child: Column(
      children: [
        SvgPicture.asset(
          path,
          width: 50,
          height: 50,
          fit: BoxFit.cover,

        ),
        AppText.micro(text,color:Color(0xFF727272),)

      ],
    ),
  );

}



Container bottomBox(String text,String buttonText,Function onTap) {
  return Container(
    height: 60,
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        begin: const Alignment(0.00, -1.00),
        end: Alignment(0, 1),
        colors: [Color(0xB2E8E8E8), Colors.white.withOpacity(0.699999988079071)],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 9,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    ),


    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.small(text),
        TextButton(onPressed: (){
          onTap();
        },
            child: AppText.small(buttonText,color: const Color(0xffFFD700)
            )
        )
      ],
    ),
  );
}