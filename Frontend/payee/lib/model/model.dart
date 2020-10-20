
import 'package:sqfentity_gen/sqfentity_gen.dart';
part 'model.g.dart';

// Define the 'tableCategory' constant as SqfEntityTable for the category table.
const tableCategory = SqfEntityTable(
  tableName: 'category',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  modelName: null,
  fields: [
    SqfEntityField('name', DbType.text),
  ]
);
// Define the 'tableCategory' constant as SqfEntityTable for the category table.
const tableUser = SqfEntityTable(
  tableName: 'user',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  modelName: null,
  fields: [
    SqfEntityField('email', DbType.text),
  ]
);
// Define the 'tableProduct' constant as SqfEntityTable for the product table.
const tableRegister = SqfEntityTable(
  tableName: 'register',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('type', DbType.text),
    SqfEntityField('desc', DbType.real, defaultValue: 0),
    SqfEntityField('value', DbType.bool, defaultValue: true),
    SqfEntityFieldRelationship(
        parentTable: tableCategory,
        deleteRule: DeleteRule.CASCADE,
        defaultValue: 0), // Relationship column for CategoryId of Product
    SqfEntityFieldRelationship(
        parentTable: tableUser,
        deleteRule: DeleteRule.CASCADE,
        defaultValue: 0),
]);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'Payee', // optional
    databaseName: 'Payee.db',
    password: null,

    // put defined tables into the tables list.
    databaseTables: [tableCategory, tableUser, tableRegister],
     // You can define tables to generate add/edit view forms if you want to use Form Generator property
    formTables: [tableCategory, tableUser, tableRegister],
    // put defined sequences into the sequences list.
    bundledDatabasePath:
        null // 'assets/sample.db' // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
);