import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/firebase_api.dart';
import 'package:pedantic/analysis_options.1.0.0.yaml';
import '../page/chats_page.dart';
import '../users.dart';
import 'package:flutter/services.dart';
import '../ads/theme.dart';
import '../ads/game_route.dart';
import '../ads/home_route.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(Users.initUsers);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  

  runApp(
     MaterialApp(
      home: HomeRoute(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomeRoute(),
        '/game': (BuildContext context) => new GameRoute()
        theme: ThemeData(
        primaryColor: AppTheme.primary,
        primaryColorDark: AppTheme.primaryDark,
        accentColor: AppTheme.accent,
        textTheme: GoogleFonts.acmeTextTheme().copyWith(
            button: GoogleFonts.ubuntuMono(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        buttonTheme: ButtonThemeData(
          buttonColor: AppTheme.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textTheme: ButtonTextTheme.primary,
        ),
     ),
    ),
  );
}
 
class MyApp extends StatelessWidget {
  static final String title = 'Firebase Chat';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: ChatsPage(),
      );
}
