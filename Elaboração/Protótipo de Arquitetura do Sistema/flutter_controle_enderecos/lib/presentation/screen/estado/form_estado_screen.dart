import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';

class FormEstadoScreen extends StatefulWidget {
  const FormEstadoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormEstadoScreenState();
}

class _FormEstadoScreenState extends State<FormEstadoScreen> {
  final _formStatekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Title'),
            ),
            body: _body()));
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AppForm(
        formKey: _formStatekey,
        focusNode: FocusScopeNode(),
        children: [],
      ),
    );
  }
}
