import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA4rR5hQnw5dhs1-3DDRVHICiJ_pZmNbCo",
            authDomain: "parque-nacional-app.firebaseapp.com",
            projectId: "parque-nacional-app",
            storageBucket: "parque-nacional-app.appspot.com",
            messagingSenderId: "134050687918",
            appId: "1:134050687918:web:679834ed04151955d7763f"));
  } else {
    await Firebase.initializeApp();
  }
}
