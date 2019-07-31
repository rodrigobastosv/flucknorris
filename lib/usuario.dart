
import 'with_label.dart';

class Usuario implements WithLabel {
  Usuario(this._codigo, this._nome, this._login, this._email, this._urlFoto);

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(json['codigo'], json['nome'], json['login'], json['email'], json['urlFoto']);
  }

  factory Usuario.fromDB(Map<String, dynamic> map) {
    return Usuario(map['cd_usuario'], map['nm_usuario'], map['login'], map['email'], map['url_foto']);
  }

  int _codigo;
  String _nome;
  String _login;
  String _email;
  String _urlFoto;

  int get codigo => _codigo;
  String get nome => _nome;
  String get login => _login;
  String get email => _email;
  String get urlFoto => _urlFoto;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['cd_usuario'] = _codigo;
    map['nm_usuario'] = _nome;
    map['login'] = _login;
    map['email'] = _email;
    map['url_foto'] = _urlFoto;

    return map;
  }

  @override
  String toString() {
    return 'Usuario {codigo: $codigo, nome: $nome, login: $login, email: $email, urlFoto: $urlFoto}';
  }

  @override
  String getLabel() {
    return nome;
  }
}