import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_finances/src/widgets/text_form_field/text_form_field_controller.dart';

class TextFormFieldComponent extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final Function(String) onChanged;

  const TextFormFieldComponent({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  final TextFormFieldController _controller = TextFormFieldController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return TextFormField(
          autofocus: false,
          obscureText: widget.obscureText ? !_controller.passwordShown : false,
          enableSuggestions: widget.obscureText,
          autocorrect: widget.obscureText,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            contentPadding: const EdgeInsets.only(left: 16.0),
            suffixIcon: widget.obscureText
                ? GestureDetector(
                    onTap: () {
                      if (_controller.passwordShown) {
                        _controller.hidePassword();
                      } else {
                        _controller.showPassword();
                      }
                    },
                    child: Icon(
                      _controller.passwordShown
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : null,
          ),
          onChanged: (String value) => widget.onChanged(value),
        );
      },
    );
  }
}
