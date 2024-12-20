import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/auth/bloc/auth_bloc.dart';
import 'package:showroom/features/auth/bloc/auth_event.dart';
import 'package:showroom/features/auth/bloc/auth_state.dart';
import 'package:showroom/features/common/widgets/blue_line.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            const CircularProgressIndicator();
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${state.message}error state")),
            );
          } else if (state is AuthRegisteredState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );

            context.pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 55),
              ),
              const SizedBox(
                height: 8,
              ),
              const BlueLineWidget(),
              Column(
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

                        context.read<AuthBloc>().add(AuthRegisterEvent(
                              username: username,
                              password: password,
                            ));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
