import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/routes/my_router.dart';
import 'package:showroom/features/auth/presentation/profile_page.dart';
import 'package:showroom/features/auth/presentation/register_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;

                // Mengirimkan AuthLoginEvent ke BLoC
                context.read<AuthBloc>().add(
                    AuthLoginEvent(username: username, password: password));
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman registrasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Don\'t have an account? Register here'),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is AuthAuthenticatedState) {
                  // showDialog(
                  //   context: context,
                  //   builder: (_) => AlertDialog(
                  //     content: Row(
                  //       children: [
                  //         CircularProgressIndicator(),
                  //         SizedBox(width: 20),
                  //         Text('Loading...'),
                  //       ],
                  //     ),
                  //   ),
                  // // );
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()));
                  // Navigator.pop(context);
                  context.pushReplacement("/profile");

                  // Delay sebelum pindah ke halaman lain
                  // Future.delayed(Duration(seconds: 2), () {
                  //   //Navigator.pop(context); // Tutup loading indicator
                  //   Navigator.pushReplacement(context,
                  //       MaterialPageRoute(builder: (context) => ProfilePage()));
                  // });
                  //Navigator.pushReplacementNamed(context, '/profile');
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
