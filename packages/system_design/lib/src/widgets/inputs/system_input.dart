import 'package:flutter/material.dart';
//import 'package:system_design_package/src/consts/sizes/widgets_size.dart';
import 'package:system_design_package/system_design.dart';

class SystemInput extends StatelessWidget {
  final String text;
  //final Function() onTap;
  final SystemSize? size;
  final SystemColors? textColor;
  final bool? expanded;
  final bool? enable;
  final bool? loading;
  final bool? isPassword;
  const SystemInput({
    super.key,
    required this.text,
    //required this.onTap,
    this.size,
    this.textColor,
    this.enable,
    this.loading,
    this.expanded,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !(enable ?? true) || (loading ?? false),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        opacity: (enable ?? true) ? 1 : 0.12,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: (expanded ?? false) ? MediaQuery.of(context).size.width : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: SystemSpacing.x0_5.value,
                  left: SystemSpacing.x0_25.value,
                ),
                child: Text(
                  this.text,
                ),
              ),
              Container(
                //MUDAR PARA SYSTEMSIZE DEPOIS
                height: 68,
                width: 326,
                child: TextFormField(
                  obscureText: ((isPassword ?? false) ? true : false),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      hintText:
                          ((isPassword ?? false) ? "............" : "0000000"),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: SystemColors.neutral400.value,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
