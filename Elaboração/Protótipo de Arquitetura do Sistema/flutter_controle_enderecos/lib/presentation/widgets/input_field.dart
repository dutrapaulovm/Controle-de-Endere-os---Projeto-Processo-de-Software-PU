import 'package:flutter/material.dart';

///
/// Um componente TextField customizado para formulários
///
class InputFormField extends StatelessWidget {
  final String? labelText;
  final String? forceErrorText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? errorText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  const InputFormField(
      {this.labelText,
      this.forceErrorText,
      this.controller,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.errorText,
      this.hintText,
      this.keyboardType,
      this.textInputAction,
      this.autoFocus = false,
      this.obscureText = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      forceErrorText: forceErrorText,
      autofocus: autoFocus,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        /*border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),*/
      ),
    );
  }
}
