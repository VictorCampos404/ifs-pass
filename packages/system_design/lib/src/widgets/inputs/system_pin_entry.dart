import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class SystemPinEntry extends StatefulWidget {
  int length;
  final Function(String) onChanged;
  SystemPinEntry({
    required this.length,
    required this.onChanged,
    super.key,
  });

  @override
  State<SystemPinEntry> createState() => _SystemPinEntryState();
}

class _SystemPinEntryState extends State<SystemPinEntry> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _pinController.addListener(_onPinChanged);
  }

  @override
  void dispose() {
    _pinController.removeListener(_onPinChanged);
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onPinChanged() {
    widget.onChanged(_pinController.text);
    setState(() {});
  }

  Widget _buildCircle(int index) {
    bool isFilled = index < _pinController.text.length;
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: SystemColors.neutral800.value,
        ),
        shape: BoxShape.circle,
        color:
            isFilled ? SystemColors.neutral800.value : SystemColors.white.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(widget.length, (index) => _buildCircle(index)),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              left: 104,
              right: 104,
            ),
            child: TextField(
              controller: _pinController,
              focusNode: _focusNode,
              maxLength: widget.length,
              keyboardType: TextInputType.number,
              obscureText: true,
              style: const TextStyle(
                color: Colors.transparent, // Make the text transparent
                fontSize: 1, // Set font size to 0 to hide the cursor
              ),
              cursorColor: Colors.transparent,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: "", // Hide the counter text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
