// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cliente {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? rua;
  String? bairro;
  String? numero;
  String? cep;
  int? idCidade;
  String? nomeCidade;
  int? idEstado;
  String? nomeEstado;
  String? uf;  
  Cliente({
    this.id,
    this.nome,
    this.email,
    this.telefone,
    this.rua,
    this.bairro,
    this.numero,
    this.cep,
    this.idCidade,
    this.nomeCidade,
    this.idEstado,
    this.nomeEstado,
    this.uf,
  });

  Cliente copyWith({
    int? id,
    String? nome,
    String? email,
    String? telefone,
    String? rua,
    String? bairro,
    String? numero,
    String? cep,
    int? idCidade,
    String? nomeCidade,
    int? idEstado,
    String? nomeEstado,
    String? uf,
  }) {
    return Cliente(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      rua: rua ?? this.rua,
      bairro: bairro ?? this.bairro,
      numero: numero ?? this.numero,
      cep: cep ?? this.cep,
      idCidade: idCidade ?? this.idCidade,
      nomeCidade: nomeCidade ?? this.nomeCidade,
      idEstado: idEstado ?? this.idEstado,
      nomeEstado: nomeEstado ?? this.nomeEstado,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'rua': rua,
      'bairro': bairro,
      'numero': numero,
      'cep': cep,
      'idCidade': idCidade,
      'nomeCidade': nomeCidade,
      'idEstado': idEstado,
      'nomeEstado': nomeEstado,
      'uf': uf,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telefone: map['telefone'] != null ? map['telefone'] as String : null,
      rua: map['rua'] != null ? map['rua'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      numero: map['numero'] != null ? map['numero'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      idCidade: map['idCidade'] != null ? map['idCidade'] as int : null,
      nomeCidade: map['nomeCidade'] != null ? map['nomeCidade'] as String : null,
      idEstado: map['idEstado'] != null ? map['idEstado'] as int : null,
      nomeEstado: map['nomeEstado'] != null ? map['nomeEstado'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) => Cliente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cliente(id: $id, nome: $nome, email: $email, telefone: $telefone, rua: $rua, bairro: $bairro, numero: $numero, cep: $cep, idCidade: $idCidade, nomeCidade: $nomeCidade, idEstado: $idEstado, nomeEstado: $nomeEstado, uf: $uf)';
  }

  @override
  bool operator ==(covariant Cliente other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.email == email &&
      other.telefone == telefone &&
      other.rua == rua &&
      other.bairro == bairro &&
      other.numero == numero &&
      other.cep == cep &&
      other.idCidade == idCidade &&
      other.nomeCidade == nomeCidade &&
      other.idEstado == idEstado &&
      other.nomeEstado == nomeEstado &&
      other.uf == uf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      telefone.hashCode ^
      rua.hashCode ^
      bairro.hashCode ^
      numero.hashCode ^
      cep.hashCode ^
      idCidade.hashCode ^
      nomeCidade.hashCode ^
      idEstado.hashCode ^
      nomeEstado.hashCode ^
      uf.hashCode;
  }
}
