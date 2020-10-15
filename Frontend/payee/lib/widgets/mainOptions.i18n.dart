import 'package:i18n_extension/i18n_extension.dart';
extension Localization on String {
String get i18n => localize(this, t);
static var t = Translations("pt_br") +
   {
     "en_us": "Make a register",
     "pt_br": "Fazer um registro",
   }+
      {
        "en_us": "Consult",
        "pt_br": "Consultar",
      } ;
}
