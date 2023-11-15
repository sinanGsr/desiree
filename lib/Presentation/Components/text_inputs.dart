import 'package:flutter/material.dart';

import '../TextConfig/text_config.dart';

class MainInput extends StatelessWidget {
  final String text;
  final String? label;
  final bool? enabled;
  final String? errorMessage;
  final Function(String)? onChanged;
  const MainInput({
    super.key,
    required this.text,
     this.label, this.enabled,  this.onChanged,  this.errorMessage,
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
                side:  BorderSide(
                  width: 1.50,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: errorMessage != "" && errorMessage != null ?Colors.red:Color(0x161D1D1F),
                ),
                borderRadius: BorderRadius.circular(7),
              )),
          child: Center(
            child: TextFormField(
              onChanged: (val){
                onChanged!(val);
              },
                enabled: enabled,
                decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: label,

                    fillColor: Color(0x051D1D1F),
                    border: InputBorder.none
                )),
          ),
          
        ),
        if(errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 5),
            child: Text(errorMessage!,textAlign: TextAlign.start,
                style:
                const TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontFamily: 'Krub',
                  fontWeight: FontWeight.w500,
                )
            ),
          )
      ],
    );
  }
}
