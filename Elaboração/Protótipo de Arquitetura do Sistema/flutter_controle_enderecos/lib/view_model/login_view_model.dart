// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginViewModel {
  String? login;
  String? password;
  LoginViewModel({
    this.login,
    this.password,
  });
  bool validate() {
    if (login == null || password == null) {
      return false;
    }

    if (login!.isEmpty || password!.isEmpty) {
      return false;
    }
    return true;
  }

  void reset() {
    login = '';
    password = '';
  }

  bool validLogin() {
    return (login != null && login!.isNotEmpty);
  }

  bool validPassword() {
    return (password != null && password!.isNotEmpty);
  }

  LoginViewModel copyWith({
    String? login,
    String? password,
  }) {
    return LoginViewModel(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
    };
  }

  factory LoginViewModel.fromMap(Map<String, dynamic> map) {
    return LoginViewModel(
      login: map['login'] != null ? map['login'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginViewModel.fromJson(String source) =>
      LoginViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginViewModel(login: $login, password: $password)';

  @override
  bool operator ==(covariant LoginViewModel other) {
    if (identical(this, other)) return true;

    return other.login == login && other.password == password;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;
}