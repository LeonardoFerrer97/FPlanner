import 'package:i18n_extension/i18n_extension.dart';
extension Localization on String {
String get i18n => localize(this, t);
static var t = Translations("pt_br") +
   {
     "en_us": "register a record type",
     "pt_br": "Cadastrar um tipo de registro",
   }+
      {
        "en_us": "Make a register",
        "pt_br": "Fazer um registro",
      } ;
}
