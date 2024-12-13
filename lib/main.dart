import 'package:flutter/material.dart';
import 'package:flutter_social_media_integration/auth_servicies.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SocialMedia Integration',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleServicies googleServicies = GoogleServicies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var account = await googleServicies.handleSignIn();

            if (account != null) {
              var token = await account.authentication;

              print(''' 
              id : ${account.id}
              name : ${account.displayName}
              photoUrl : ${account.photoUrl}
              email : ${account.email}
              TokenId : ${token.idToken}
                 ''');
            }
          },
          child: const Text('Signin With Google'),
        ),
      ),
    );
  }
}
