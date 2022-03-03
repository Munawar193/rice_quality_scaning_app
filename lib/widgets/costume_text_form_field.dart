import 'package:flutter/material.dart';
import 'package:rice_quality_scaning_app/screens/theme.dart';

class CostomTextFromField extends StatelessWidget {
  final IconData icon;
  final String hintext;
  final bool obscureText;
  final TextEditingController controller;

  const CostomTextFromField({
    Key? key,
    required this.hintext,
    this.obscureText = false,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.only(
        top: 3,
        left: 15,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: greyStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
          icon: Icon(icon),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
