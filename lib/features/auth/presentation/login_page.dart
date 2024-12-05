import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/auth/presentation/register_page.dart';
import 'package:showroom/features/common/widgets/blue_line.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 55),
            ),
            const SizedBox(
              height: 8,
            ),
            const BlueLineWidget(),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    cursorColor: ShowroomColors.accentBlue,
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: ShowroomColors.accentBlue),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ShowroomColors.accentBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    cursorColor: ShowroomColors.accentBlue,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: ShowroomColors.accentBlue),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ShowroomColors.accentBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ShowroomColors.accentBlue),
                      onPressed: () {
                        final username = _usernameController.text;
                        final password = _passwordController.text;

                        // Mengirimkan AuthLoginEvent ke BLoC
                        context.read<AuthBloc>().add(AuthLoginEvent(
                            username: username, password: password));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account yet? "),
                      TextButton(
                        onPressed: () {
                          // Navigasi ke halaman registrasi
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                  context.go("/profile");

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
