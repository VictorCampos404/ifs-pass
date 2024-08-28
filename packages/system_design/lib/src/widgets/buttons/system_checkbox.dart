import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class SystemCheckbox extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;
  final String? text;
  const SystemCheckbox({
    required this.isChecked,
    required this.onChanged,
    this.text,
    super.key,
  });

  @override
  State<SystemCheckbox> createState() => _SystemCheckboxState();
}

class _SystemCheckboxState extends State<SystemCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!widget.isChecked),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: (widget.isChecked
                      ? SystemColors.primary.value
                      : SystemColors.neutral800.value),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: widget.isChecked
                  ? Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: SystemColors.primary.value,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          if (widget.text != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.text ?? "",
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
              ),
            )
        ],
      ),
    );
  }
}
