
import 'package:flutter/material.dart';
import 'package:payee/widgets/login.dart';
import 'package:payee/widgets/mainOptions.dart';
import 'package:payee/widgets/logoutAction.dart';     
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:i18n_extension/i18n_widget.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'main.i18n.dart';
import 'model/model.dart';
 
final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String picture;
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [            
           GlobalMaterialLocalizations.delegate,
           GlobalWidgetsLocalizations.delegate,
           GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', "US"), 
          const Locale('pt', "BR"), 
        ],
      title: 'Payee',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Planejador Financeiro'.i18n),
          actions: [isLoggedIn ? LogoutAction(logoutAction):Text(""),],
          backgroundColor: const Color(0xff724E91),
        ),
        body: 
        Center(
          child: I18n(
            initialLocale: Locale("pt", "BR"),
            child: isBusy
              ? CircularProgressIndicator()
              : isLoggedIn? MainOptions()
                  : Login(loginAction, errorMessage,context),

            )
          ),
        backgroundColor: const Color(0xffdef6ca),
        ),

    );
  }

Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          // promptValues: ['login']
        ),
      );

      final idToken = parseIdToken(result.idToken);
      final profile = await getUserDetails(result.accessToken);
      print(profile);
      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);
      var email =  idToken['email'];
      var userlist = await User().select().toList();
      var contain = userlist.where((element) => element.email == email);
      if (contain.isEmpty){
        await new User(email:email).save();
      }
      setState(() {
        isBusy = false;
        isLoggedIn = true;
        email = email;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }
void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }
  Map<String, dynamic> parseIdToken(String idToken) {
      final parts = idToken.split(r'.');
      assert(parts.length == 3);

      return jsonDecode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }
  Future<Map<String, dynamic>> getUserDetails(String accessToken) async {
    final url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
  @override void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response.idToken);
      final profile = await getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
}
/// -----------------------------------
///           Auth0 Variables
/// -----------------------------------

const AUTH0_DOMAIN = 'dev-d1olx9ru.auth0.com';
const AUTH0_CLIENT_ID = 'dI1oVzxsxepFHv1H5RC7f2ylF5ZX3N4B';

const AUTH0_REDIRECT_URI = 'com.example.payee://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
