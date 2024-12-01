import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/routes/my_router.dart';
import 'package:showroom/features/auth/presentation/login_page.dart';
import 'package:showroom/features/auth/presentation/update_profile_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;

    if (authState is AuthAuthenticatedState) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // GANTIIII
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateProfilePage()),
                );
                // Navigator.pushNamed(context, '/updateProfile');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Username: ${authState.username}'),
              Text('ID: ${authState.id}'),
            ],
          ),
        ),
      );
    } else {
      // return Scaffold(
      //   appBar: AppBar(title: Text("Profile")),
      //   body: const Center(child: Text("User not authenticated")),
      // );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        // );
        context.go('/login');
      });
      return Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: const Center(
            child:
                CircularProgressIndicator()), // Menampilkan loading indicator
      );
    }
  }
}
