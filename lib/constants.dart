import 'package:flutter/material.dart';

InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: 'Enter the value',
  hintStyle: TextStyle(color: Colors.grey.shade500),
  fillColor: Colors.grey.shade200,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: Colors.grey.shade300),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
);

ScrollPhysics keyboardDependentScrollPhysics(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom == 0) {
    return const NeverScrollableScrollPhysics();
  } else {
    return const AlwaysScrollableScrollPhysics();
  }
}
