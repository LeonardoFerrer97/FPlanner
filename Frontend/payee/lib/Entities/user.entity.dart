
import 'package:sqlentity/base-entity/entity.dart';
class UserEntity extends Entity {
  int _id;
  String _email;

  UserEntity({var id: 0,var email:""}) : super('User') {
    this._id = id;
    this.email = email;
  }

  @override
  void configColumn() {
    //O id deve ser sempre o primeiro caso queira usar as operaçoes padroes do DAO
    createColumn("ID", "INTEGER PRIMARY KEY AUTOINCREMENT", 1);

    //nova coluna
    createColumn("EMAIL", "TEXT", 1);
  }

  @override
  Entity map(Map<String, dynamic> map) {
    return new UserEntity(
      id: map['ID'],
      email: map['EMAIL'],
    );
  }

  int get id => _id;

  set id(int value) {
    _id = value;
    updateValeu("ID", value: id);
  }
  
  String get email => email;

  set email(String value) {
    _email = value;
    updateValeu("EMAIL", value: _email);
  }  
}