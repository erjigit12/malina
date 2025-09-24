import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int index;
  final TabController controller;

  const TabButton({
    super.key,
    required this.text,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = controller.index == index;

    return Container(
      height: 40,
      width: 167,
      alignment: Alignment.center,
      decoration:
          selected
              ? null
              : BoxDecoration(
                border: Border.all(color: AppColors.tabColor),
                borderRadius: BorderRadius.circular(20),
              ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
