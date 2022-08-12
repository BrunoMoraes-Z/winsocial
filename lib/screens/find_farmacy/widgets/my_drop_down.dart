// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:skynexui_responsive_stylesheet/breakpoints/breakpoints.dart';
import 'package:skynexui_responsive_stylesheet/responsive/responsive.dart';
import 'package:winsocial/shared/constants.dart';

class MyDropDown extends StatefulWidget {
  MyDropDown({
    Key? key,
    required this.label,
    required this.filledLabel,
    required this.itens,
    required this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  final String label;
  final String filledLabel;
  final List<String> itens;
  final Function(String) onChanged;
  late bool enabled;

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  late String selectedValue = widget.itens.isEmpty ? '.' : widget.itens.first;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      constraints: BoxConstraints(
        maxWidth: responsive.value({
          Breakpoints.xs: breakpoints.sm + 50,
          Breakpoints.md: 255,
        }),
      ),
      // height: 140,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: responsive.value({
          Breakpoints.xs: 32,
          Breakpoints.md: 0,
        }),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 80),
        // color: Colors.redAccent,
        child: DropdownButtonFormField<String>(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: constants.primary,
            size: 32,
          ),
          onChanged: widget.enabled
              ? (String? newValue) {
                  widget.onChanged(newValue!);
                  setState(() => selectedValue = newValue);
                }
              : null,
          value: selectedValue,
          focusColor: Colors.transparent,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: responsive.value({
                Breakpoints.xs: 0,
                Breakpoints.md: (widget.itens.isNotEmpty ? 10 : 0),
              }),
            ),
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            fillColor: Colors.transparent,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelText: widget.itens.isEmpty
                ? widget.label
                : widget.filledLabel.toUpperCase(),
            labelStyle: TextStyle(
              color: widget.itens.isEmpty ? Colors.grey : constants.primary,
              fontSize: widget.itens.isEmpty ? 14 : 12,
            ),
          ),
          items: widget.itens.map((e) => e.toDropDownItem()).toList(),
        ),
      ),
    );
  }
}