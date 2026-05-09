import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:ulang_http/login_response/login_response.dart';

void main() {
  runApp(const MyApp());
}

// create future Function to send data to http://10.0.2.2:1337/api/auth/local to get login response

Future<LoginResponse> doLogin(String identifier, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:1337/api/auth/local'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'identifier': identifier, 'password': password}),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return LoginResponse.fromMap(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to login');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // create future variable to store login response
  Future<LoginResponse>? _loginResponse;

  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _paaswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //create future builder to get data from login repomse
            FutureBuilder<LoginResponse>(
              future: _loginResponse,

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Text(snapshot.data!.jwt.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const SizedBox();
              },
            ),
            // crete text field to identifier
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'identifier',
              ),
              controller: _identifierController,
            ),
            const SizedBox(height: 20),
            // crete text field to password
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              ),
              controller: _paaswordController,
              obscureText: true,
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // when nutton is pressed , call  dologin function and set state usjing data from text controller
                  setState(() {
                    _loginResponse = doLogin(
                      _identifierController.text,
                      _paaswordController.text,
                    );
                  });
                },
                child: Text('login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
