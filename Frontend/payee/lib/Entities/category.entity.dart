
import 'package:sqlentity/base-entity/entity.dart';
class CategoryEntity extends Entity {
  int _id;
  String _name;

  CategoryEntity({var id: 0,var name:""}) : super('Category') {
    this._id = id;
    this.name = name;
  }

  @override
  void configColumn() {
    //O id deve ser sempre o primeiro caso queira usar as operaçoes padroes do DAO
    createColumn("ID", "INTEGER PRIMARY KEY AUTOINCREMENT", 1);

    //nova coluna
    createColumn("name", "TEXT", 1);
  }

  @override
  Entity map(Map<String, dynamic> map) {
    return new CategoryEntity(
      id: map['ID'],
      name: map['NAME'],
    );
  }

  int get id => _id;

  set id(int value) {
    _id = value;
    updateValeu("ID", value: id);
  }
  
  String get name => name;

  set name(String value) {
    _name = value;
    updateValeu("NAME", value: _name);
  }  
}