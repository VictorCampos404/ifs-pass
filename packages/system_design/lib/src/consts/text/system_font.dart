import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

extension SystemFont on Text {
  Text display1({SystemColors? color}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 72,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text display2({SystemColors? color}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 52,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text display3({SystemColors? color}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 40,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text heading1({SystemColors? color}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: SystemFontWeight.semiBold.value,
      fontSize: 32,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text heading2({SystemColors? color, SystemFontWeight? fontWeight}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 28,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text heading3({SystemColors? color, SystemFontWeight? fontWeight}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 24,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text heading4({SystemColors? color, SystemFontWeight? fontWeight}) {
    final defaultStyle = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 20,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text body1(
      {SystemColors? color,
      SystemFontWeight? fontWeight,
      SystemTextDecoration? decoration}) {
    assert(fontWeight != SystemFontWeight.semiBold,
        "Esse estilo de fonte não suporta o SystemFontWeight.semiBold");

    final defaultStyle = TextStyle(
      decoration: decoration?.value ?? SystemTextDecoration.none.value,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text body2(
      {SystemColors? color,
      SystemFontWeight? fontWeight,
      SystemTextDecoration? decoration}) {
    assert(fontWeight != SystemFontWeight.semiBold,
        "Esse estilo de fonte não suporta o SystemFontWeight.semiBold");

    final defaultStyle = TextStyle(
      decoration: decoration?.value ?? SystemTextDecoration.none.value,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }

  Text caption(
      {SystemColors? color,
      SystemFontWeight? fontWeight,
      SystemTextDecoration? decoration}) {
    final defaultStyle = TextStyle(
      decoration: decoration?.value ?? SystemTextDecoration.none.value,
      fontFamily: 'Inter',
      fontWeight: fontWeight?.value ?? SystemFontWeight.regular.value,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      color: color?.value ?? SystemColors.neutral800.value,
    );
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (defaultStyle));
  }
}
