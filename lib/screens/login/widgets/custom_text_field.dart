// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winsocial/shared/constants.dart';

enum TextFieldType { light, stroke }

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.label,
    required this.onChanged,
    this.focusLabel = '',
    this.initialValue = '',
    this.maxSize = 400,
    this.textFieldType = TextFieldType.stroke,
    this.enabled = true,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  final String label;
  final Function(String) onChanged;
  final TextFieldType textFieldType;
  late String focusLabel;
  late bool enabled;
  late String initialValue;
  late double maxSize;
  late List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;
  late bool focused = false;
  late FocusNode focus;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.initialValue;
    focus = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: controller.value.text.isNotEmpty ? 1 : 0,
          child: Text(
            widget.focusLabel.isNotEmpty ? widget.focusLabel : widget.label,
            style: TextStyle(
              color: widget.textFieldType == TextFieldType.stroke
                  ? Colors.white
                  : constants.primary,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          height: 24,
          alignment: Alignment.centerLeft,
          child: Focus(
            onFocusChange: (value) {
              setState(() {
                focused = value;
              });
            },
            child: TextField(
              enabled: widget.enabled,
              focusNode: focus,
              controller: controller,
              maxLines: 1,
              cursorColor: Colors.black,
              cursorWidth: 1,
              cursorHeight: double.infinity,
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {});
              },
              inputFormatters: widget.inputFormatters,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontSize: 0,
                ),
                contentPadding: const EdgeInsets.only(bottom: 16),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: widget.label,
                hintStyle: TextStyle(
                  color: widget.textFieldType == TextFieldType.stroke
                      ? Colors.white.withOpacity(0.6)
                      : Colors.grey.withOpacity(0.6),
                ),
              ),
              style: TextStyle(
                color: widget.textFieldType == TextFieldType.stroke
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: widget.maxSize,
          child: Stack(
            children: [
              Container(
                width: widget.maxSize,
                height:
                    widget.textFieldType == TextFieldType.stroke ? 1.5 : 1,
                color: widget.textFieldType == TextFieldType.stroke
                    ? Colors.white
                    : Colors.grey,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: focused ? widget.maxSize : 0,
                height:
                    widget.textFieldType == TextFieldType.stroke ? 3.5 : 3,
                color: widget.textFieldType == TextFieldType.stroke
                    ? Colors.white
                    : constants.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
