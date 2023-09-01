import 'package:flutter/material.dart';
import 'package:system_design_package/src/enuns/system_font_weight.dart';
import 'package:system_design_package/system_design.dart';

extension SystemFont on Text{
  Text display1({TextStyle? style}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 72,
      fontStyle: FontStyle.normal,
      wordSpacing: -10,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text display2({TextStyle? style}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 52,
      fontStyle: FontStyle.normal,
      wordSpacing: -10,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text display3({TextStyle? style}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 40,
      fontStyle: FontStyle.normal,
      wordSpacing: -10,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text heading1({TextStyle? style}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 32,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text heading2({TextStyle? style, SystemFontWeight? fontWeight}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 28,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text heading3({TextStyle? style, SystemFontWeight? fontWeight}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 24,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text heading4({TextStyle? style, SystemFontWeight? fontWeight}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 20,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text body1({TextStyle? style, SystemFontWeight? fontWeight, SystemTextDecoration? decoration}) {
    //Body1 não pode ser semiBold
    assert(fontWeight != SystemFontWeight.semiBold);

    final defaultStyle = TextStyle(
      decoration: decoration?.value ?? SystemTextDecoration.none.value,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      wordSpacing: -10,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text body2({TextStyle? style, SystemFontWeight? fontWeight, SystemTextDecoration? decoration}) {
    //Body1 não pode ser semiBold
    assert(fontWeight != SystemFontWeight.semiBold);

    final defaultStyle = TextStyle(
      decoration: decoration?.value ?? SystemTextDecoration.none.value,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      wordSpacing: -10,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text caption({TextStyle? style, SystemFontWeight? fontWeight, SystemTextDecoration? decoration}) {
    final defaultStyle = TextStyle(
      decoration: decoration?.value ?? SystemTextDecoration.none.value,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      wordSpacing: -20,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

}