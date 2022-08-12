import 'package:flutter/material.dart';

extension TextToDropDownItem on String {
  DropdownMenuItem<String> toDropDownItem() {
    return DropdownMenuItem(
      value: this,
      child: Text(
        this,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
      ),
    );
  }
}
