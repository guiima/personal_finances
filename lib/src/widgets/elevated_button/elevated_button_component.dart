import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const ElevatedButtonComponent({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF242F66),
        minimumSize: const Size(
          double.infinity,
          40,
        ), // define a altura mínima do botão
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white, // define a cor do texto
        ),
      ),
    );
  }
}
