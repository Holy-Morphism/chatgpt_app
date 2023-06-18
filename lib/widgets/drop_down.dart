import 'package:chatgptapp/constants/constants.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String currentModel = "Model 1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        dropdownColor: scaffoldBackgroundColor,
        items: getModelItems,
        value: currentModel,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString();
          });
        });
  }
}
