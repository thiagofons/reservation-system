import 'package:flutter/material.dart';
import 'package:host_app/styles/text.dart';

class TextInput extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? isPassword;

  const TextInput({
    super.key,
    this.label,
    this.placeholder,
    this.isPassword = false,
    this.keyboardType,
    this.maxLength,
    required this.controller,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: AppTextStyles.body1,
      textCapitalization: widget.keyboardType == TextInputType.name
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword!,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextStyles.caption,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.placeholder,
        hintStyle: AppTextStyles.caption.copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
    );
  }
}
