import 'package:flutter/material.dart';
import '../colors.dart';
class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,

    required this.inputAction,
  }) : super(key: key);
  final IconData icon;
  final String hint;

  final TextInputAction inputAction;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[600]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              border: InputBorder.none,
              hintText: widget.hint,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              hintStyle: kBodyText),
          obscureText: true,
          style: kBodyText,
          textInputAction: widget.inputAction,
        ),
      ),
    );
  }
}
