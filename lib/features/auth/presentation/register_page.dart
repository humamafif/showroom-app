import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/features/auth/bloc/auth_bloc.dart';
import 'package:showroom/features/auth/bloc/auth_event.dart';
import 'package:showroom/features/auth/bloc/auth_state.dart';
import 'package:showroom/features/auth/presentation/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            CircularProgressIndicator();
          } else if (state is AuthErrorState) {
            // Jika terjadi error, tampilkan Snackbar error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message + "error state")),
            );
          } else if (state is AuthRegisteredState) {
            // Jika registrasi berhasil, tampilkan Snackbar sukses
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );

            // Tampilkan loading indicator
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
            // );
            context.pop();

            // Delay sebelum pindah ke halaman lain
            // Future.delayed(Duration(seconds: 2), () {
            //   Navigator.pop(context); // Tutup loading indicator
            //   // Navigator.pop(context);
            //   // Navigator.pushReplacement(context,
            //   //     MaterialPageRoute(builder: (context) => LoginPage()));
            // });
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
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

                  // Trigger event registrasi
                  context.read<AuthBloc>().add(AuthRegisterEvent(
                        username: username,
                        password: password,
                      ));
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
