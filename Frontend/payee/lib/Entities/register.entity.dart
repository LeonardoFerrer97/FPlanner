
import 'package:sqlentity/base-entity/entity.dart';

import 'category.entity.dart';
class RegisterEntity extends Entity {
  int _id;
  String _type;
  CategoryEntity _category;
  String _desc;
  String _value;

  RegisterEntity({var id: 0,var type:"",CategoryEntity category, var desc: "", var value: ""}) : super('Register') {
    this.id = id;
    this.desc = desc;
    this.category = category;
    this.value = value;
    this.type = type;
  }

  @override
  void configColumn() {
    //O id deve ser sempre o primeiro caso queira usar as operaçoes padroes do DAO
    createColumn("ID", "INTEGER PRIMARY KEY AUTOINCREMENT", 1);

    //nova coluna
    createColumn("DESC", "TEXT", 1);
    createColumn("CATEGORY", "FOREIGN KEY(category_id) REFERENCES CATEGORY(id)", 1);
    createColumn("VALUE", "TEXT", 1);
    createColumn("TYPE", "TEXT", 1);
  }

  @override
  Entity map(Map<String, dynamic> map) {
    return new RegisterEntity(
      id: map['ID'],
      value: map['VALUE'],
      category: map['CATEGORY'],
      desc: map['DESC'],
      type: map['TYPE'],
    );
  }

  int get id => _id;

  set id(int value) {
    _id = value;
    updateValeu("ID", value: id);
  }
  
  CategoryEntity get category => _category;

  set category(CategoryEntity value) {
    _category = value;
    updateValeu("CATEGORY", value: category);
  }
  String get value => _value;

  set value(String values) {
    _value = values;
    updateValeu("NAME", value: _value);
  }
  
  String get desc => desc;

  set desc(String value) {
    _desc = value;
    updateValeu("DESC", value: _desc);
  }  
  String get type => type;

  set type(String value) {
    _type = value;
    updateValeu("TYPE", value: _type);
  }
}