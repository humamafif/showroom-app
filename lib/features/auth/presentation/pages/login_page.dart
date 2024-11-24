import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/injection.dart';
import 'package:showroom/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:showroom/features/auth/presentation/pages/profile_page.dart';
import 'package:showroom/features/common/widgets/bottom_navbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // masih error
          if (state is Authenticated) {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => const ProfilePage()),
            // );
            context.go('/profile');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) => Center(
          child: TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    LoggedInEvent(username: "tes", password: "tes"),
                  );
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
