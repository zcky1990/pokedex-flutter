import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String type;
  final String btnText;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomRoundedButton(
      {super.key,
      required this.type,
      required this.btnText,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    EdgeInsets btnPadding;

    switch (type) {
      case "primary":
        backgroundColor = Theme.of(context).primaryColor;
        textColor = Colors.white;
        btnPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
        break;
      case "secondary":
        backgroundColor = Colors.grey.shade300;
        textColor = Colors.black;
        btnPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
        break;
      default:
        backgroundColor = Colors.grey.shade300;
        textColor = Colors.black;
        btnPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
        break;
    }

    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              padding: btnPadding),
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? LinearProgressIndicator() : Text(btnText),
        ));
  }
}
