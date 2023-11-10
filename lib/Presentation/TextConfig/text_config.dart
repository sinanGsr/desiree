import 'package:flutter/material.dart';

class CustomTextStyle{
  static const TextStyle label = TextStyle(
    fontSize: 26,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,

  );

  static const TextStyle small = TextStyle(
    fontSize: 18,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle smallBold = TextStyle(
    fontSize: 12,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle micro = TextStyle(
    fontSize: 12,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );
}

class AppText {
  static Widget label(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign textAlign = TextAlign.start,
    Color color = Colors.black, // Specify the default color as black
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: CustomTextStyle.label.copyWith(color: color),
    );
  }

  static Widget small(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign textAlign = TextAlign.start,
    Color color = Colors.black, // Specify the default color as black
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: CustomTextStyle.small.copyWith(color: color),
    );
  }

  static Widget smallBold(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign textAlign = TextAlign.start,
    Color color = Colors.black, // Specify the default color as black
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: CustomTextStyle.smallBold.copyWith(color: color),
    );
  }
  static Widget micro(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign textAlign = TextAlign.start,
    Color color = Colors.black, // Specify the default color as black
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: CustomTextStyle.micro.copyWith(color: color),
    );
  }


}