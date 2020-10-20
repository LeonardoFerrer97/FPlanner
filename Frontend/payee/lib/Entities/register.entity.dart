
import 'package:payee/Entities/user.entity.dart';
import 'package:sqlentity/base-entity/entity.dart';

import 'category.entity.dart';
class RegisterEntity extends Entity {
  int _id;
  String _type;
  CategoryEntity _category;
  UserEntity _userId;
  String _desc;
  String _value;

  RegisterEntity({var id: 0,var type:"",CategoryEntity category, UserEntity userId,var desc: "", var value: ""}) : super('Register') {
    this.id = id;
    this.desc = desc;
    this.category = category;
    this.userId = userId;
    this.value = value;
    this.type = type;
  }


  @override
  Entity map(Map<String, dynamic> map) {
    return new RegisterEntity(
      id: map['ID'],
      value: map['VALUE'],
      category: map['CATEGORY'],
      userId: map['USERID'],
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

  UserEntity get userId => _userId;

  set userId(UserEntity value) {
    _userId = value;
    updateValeu("USERID", value: userId);
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