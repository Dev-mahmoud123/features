
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class LanguageDropDownMenu extends StatefulWidget {
  const  LanguageDropDownMenu({Key? key}) : super(key: key);

  @override
  State<LanguageDropDownMenu> createState() => _LanguageDropDownMenuState();
}

class _LanguageDropDownMenuState extends State<LanguageDropDownMenu> {
  String dropValue = 'English_US';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          // border: Border.all(color: Colors.black, width: 1.0)
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: DropdownButton(
          elevation: 1,
          value: dropValue,
          style: const TextStyle(color: Colors.black),
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              if (newValue == 'English_US') {
                setState(() {
                  dropValue = 'English_US';
                  context.setLocale(const Locale('en', 'US'));
                });
              } else  {
                setState(() {
                  dropValue = 'Arabic_EG';
                  context.setLocale(const Locale('ar', 'EG'));
                });
              }
            });
          },
          items: <String>['English_US', 'Arabic_EG']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
