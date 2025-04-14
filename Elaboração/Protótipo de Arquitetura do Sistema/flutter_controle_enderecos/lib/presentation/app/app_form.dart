import 'package:flutter/material.dart';

class AppForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget>? children;
  final Widget? child;
  final FocusScopeNode? focusNode;

  const AppForm({
    super.key,
    this.children,
    this.child,
    required this.formKey,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return FocusScope(
        node: focusNode, child: Form(key: formKey, child: _formBody()));
  }

  Widget _formBody() {
    return child ??
        ListView(padding: const EdgeInsets.all(16), children: children ?? []);
  }
}
