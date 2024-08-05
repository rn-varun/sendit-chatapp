import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(25),
        child: Center(child: Text(text, style: const TextStyle(
          fontWeight: FontWeight.bold
        ),)),
      )
    );
  }
}