import 'package:flutter/material.dart';

import '../TextConfig/text_config.dart';

class MainInput extends StatelessWidget {
  final String text;
  final String? label;
  const MainInput({
    super.key,
    required this.text,
     this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: AppText.smallBold(text),
        ),
        SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 45,
          decoration: ShapeDecoration(
              color: Color(0x051D1D1F),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1.50,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0x161D1D1F),
                ),
                borderRadius: BorderRadius.circular(7),
              )),
          child: TextFormField(
              decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: label,
                  fillColor: Color(0x051D1D1F),
                  border: InputBorder.none
              )),
        )
      ],
    );
  }
}
