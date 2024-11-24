import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/injection.dart';
import 'package:showroom/core/routes/my_router.dart';
import 'package:showroom/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:showroom/features/auth/presentation/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.goNamed('login');
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: Center(
              child: Column(
                children: [
                  const Text('Welcome'),
                  const SizedBox(height: 20),
                  Text(state.toString()),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LoggedOut());
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(state.toString()),
          );
        }
      },
    );
  }
}
