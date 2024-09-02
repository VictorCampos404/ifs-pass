import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/consts/text/system_font.dart';
import 'package:system_design_package/system_design.dart';

class SystemInput extends StatefulWidget {
  final String? hint;
  final String? title;
  final String? errorMessage;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enable;
  final bool? isPassword;
  final bool? multLine;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int maxLines;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final Widget? suffix;
  final Widget? outSuffix;
  final Function()? onTap;
  final bool? readOnly;

  const SystemInput({
    Key? key,
    this.hint,
    this.title,
    this.errorMessage,
    this.textInputType,
    this.onChanged,
    this.enable = true,
    this.isPassword = false,
    this.multLine = false,
    this.maxLines = 6,
    this.maxLength,
    this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.onSubmitted,
    this.focusNode,
    this.fontWeight,
    this.fontSize,
    this.textStyle,
    this.hintTextStyle,
    this.suffix,
    this.outSuffix,
    this.onTap,
    this.readOnly,
  }) : super(key: key);

  @override
  State<SystemInput> createState() => _SystemInputState();
}

class _SystemInputState extends State<SystemInput> {
  late bool obscure;

  @override
  void initState() {
    obscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.enable!,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SystemSpacing.x0_5.value,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.title != null)
                        Expanded(
                          child: Text(widget.title ?? '').body2(),
                        ),
                      if (widget.maxLength != null)
                        Text('${widget.controller?.text.length ?? '0'}/${widget.maxLength}')
                            .body2(),
                    ],
                  ),
                ),
                TextFormField(
                  key: widget.key,
                  onTap: widget.onTap,
                  maxLines: widget.multLine! ? widget.maxLines : 1,
                  focusNode: widget.focusNode,
                  textCapitalization: widget.textCapitalization!,
                  inputFormatters: widget.inputFormatters,
                  controller: widget.controller,
                  autofocus: widget.autofocus!,
                  readOnly: !widget.enable! || (widget.readOnly ?? false),
                  obscuringCharacter: '•',
                  onFieldSubmitted: widget.onSubmitted,
                  maxLength: widget.maxLength,
                  validator: (value) {
                    return widget.errorMessage;
                  },
                  style: widget.textStyle ??
                      TextStyle(
                        fontSize: widget.fontSize ?? 16,
                        letterSpacing: widget.isPassword!
                            ? obscure
                                ? 2
                                : null
                            : null,
                        fontFamily: "Inter",
                        fontWeight: widget.fontWeight ?? FontWeight.w400,
                        color: SystemColors.neutral800.value,
                      ),
                  keyboardType: widget.textInputType,
                  onChanged: widget.onChanged,
                  obscureText: widget.isPassword! && obscure,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SystemSpacing.x2.value,
                    ),
                    counter: const SizedBox(),
                    suffixIcon: widget.isPassword!
                        ? obscure
                            ? IconButton(
                                icon: Icon(
                                  SystemIcons.eye_2_fill.value,
                                  color: SystemColors.neutral800.value,
                                ),
                                onPressed: () => setState(
                                  () {
                                    obscure = !obscure;
                                  },
                                ),
                              )
                            : IconButton(
                                icon: Icon(
                                  SystemIcons.eye_close_line.value,
                                  color: SystemColors.neutral800.value,
                                ),
                                onPressed: () => setState(
                                  () {
                                    obscure = !obscure;
                                  },
                                ),
                              )
                        : widget.suffix,
                    hintText: widget.hint,
                    hintStyle: widget.hintTextStyle ??
                        TextStyle(
                          fontSize: widget.fontSize ?? 16,
                          letterSpacing: 0,
                          fontFamily: "Inter",
                          fontWeight: widget.fontWeight ?? FontWeight.w400,
                          color: SystemColors.neutral400.value,
                        ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: SystemColors.neutral200.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: SystemColors.primary.value,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: SystemColors.primary.value,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: SystemColors.neutral400.value,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: SystemColors.negative.value,
                      ),
                    ),
                  ),
                ),
                if (widget.errorMessage != null)
                  Text(widget.errorMessage ?? '').body2(),
              ],
            ),
          ),
          if (widget.outSuffix != null) widget.outSuffix ?? const SizedBox(),
        ],
      ),
    );
  }
}
