import 'package:e_learning/data/repository/ApiRepository.dart';
import 'package:e_learning/login/login_bloc.dart';
import 'package:e_learning/pages/authenticated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    //add bloc provider to the app
    BlocProvider(
      create: (context) => LoginBloc(Apirepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/authenticated': (context) => const AuthenticatedPage(),
      },
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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
  final TextEditingController _identifierController = TextEditingController(
    text: 'admin',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '11111111',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginScucces) {
            Navigator.pushNamed(context, '/authenticated');
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                action: SnackBarAction(
                  label: 'close',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Flutter E Learning App',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),

              
              TextField(
                controller: _identifierController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'identifier',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'passowrd',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                    LoginButtonPressed(
                      _identifierController.text,
                      _passwordController.text,
                    ),
                  );
                },
                child: const Text('login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
