import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/routes/my_router.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Profile')),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AuthErrorState) {
            return Text(state.message);
          }
          if (state is AuthUnauthenticatedState) {
            return Text("User not authenticated");
          }
          if (state is AuthAuthenticatedState) {
            _usernameController.text = state.username;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'New Username'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final newUsername = _usernameController.text;
                      if (newUsername.isNotEmpty) {
                        // Trigger event untuk update username
                        context.read<AuthBloc>().add(
                              AuthUpdateUserEvent(
                                  id: state.id, newUsername: newUsername),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Username cannot be empty')),
                        );
                      }
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            );
          } else {
            return Text("User not authenticated");
          }
        },
        listener: (context, state) {
          if (state is AuthLoadingState) {
            print(state);
          } else if (state is AuthUpdateSuccessState) {
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
            // Delay sebelum pindah ke halaman lain
            Navigator.pop(context);
            // context.pop();
            // Navigator.pop(context);
            // Future.delayed(Duration(seconds: 2), () {
            //   Navigator.pop(context);
            //   Navigator.pop(context);
            // });

            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Username updated successfully!')),
            );
          } else if (state is AuthUpdateErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
