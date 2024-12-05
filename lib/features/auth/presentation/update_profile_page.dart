import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AuthErrorState) {
            return Text(state.message);
          }
          if (state is AuthUnauthenticatedState) {
            return const Text("User not authenticated");
          }
          if (state is AuthAuthenticatedState) {
            _usernameController.text = state.username;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    cursorColor: ShowroomColors.accentBlue,
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'New Username:',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ShowroomColors.accentBlue,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ShowroomColors.accentBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ShowroomColors.accentBlue),
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
                            const SnackBar(content: Text('Username cannot be empty')),
                          );
                        }
                      },
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("User not authenticated");
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
              const SnackBar(content: Text('Username updated successfully!')),
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
