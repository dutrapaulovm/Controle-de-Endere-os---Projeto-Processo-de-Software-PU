import 'package:flutter_controle_enderecos/exceptions.dart';

///Método utilizado para validar se o valor é vazio ou nulo para os widgets TextFormField
String? validar(String? value, String info) {
  if (value == null || value.isEmpty) {
    return 'Por favor, digite $info';
  }
  return null;
}

///Verifica se o objeto é do tipo Bundle
///[object] Tipo a ser verificado
bool isBundle(dynamic object) {
  bool result = object is Bundle;
  if (!result) {
    throw ApplicationException(null, message: "Type isn't a Bundle");
  }
  return result;
}

///Enum utilizado para definir os nomes dos parâmetros a serem enviados entre as janelas
enum Argumentos { entidade, origem, id, parent }

///Classe utilizada para armazenar informações sobre os parâmetros enviados entre as janlas
class Bundle {
  final Map<dynamic, dynamic> _arguments = {};

  void put(dynamic key, dynamic value) {
    _arguments[key] = value;
  }

  dynamic get(dynamic key) {
    return _arguments[key];
  }

  bool contaisKey(Object? key) {
    return _arguments.containsKey(key);
  }
}
