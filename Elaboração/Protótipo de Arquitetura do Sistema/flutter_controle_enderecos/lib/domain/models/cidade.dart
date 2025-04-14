// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cidade {
  int? id;
  String? nome;
  String? uf;
  Cidade({
    this.id,
    this.nome,
    this.uf,
  });

  Cidade copyWith({
    int? id,
    String? nome,
    String? uf,
  }) {
    return Cidade(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'uf': uf,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) =>
      Cidade.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cidade(id: $id, nome: $nome, uf: $uf)';

  @override
  bool operator ==(covariant Cidade other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.uf == uf;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ uf.hashCode;
}
