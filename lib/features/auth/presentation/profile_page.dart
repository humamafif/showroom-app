import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/core/constant/color.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ShowroomColors.accentGrey,
        ),
        body: Center(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    height: 120,
                    decoration: const BoxDecoration(
                      color: ShowroomColors.accentGrey,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(25)),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          backgroundColor: ShowroomColors.textWhiteColor,
                          child: CircleAvatar(
                            radius: 73,
                            backgroundImage:
                                AssetImage("assets/images/person.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              authState.username,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Text(
                            //   'username@gmail.com',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 14,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              // Text('ID: ${authState.id}'),
              Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdateProfilePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ShowroomColors.backgroundLightGray,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ShowroomColors.backgroundLightGray,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                        Text(
                          'Help & Info',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        )
                      ],
                    )),
              ),
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
        appBar: AppBar(title: const Text("Profile")),
        body: const Center(
            child:
                CircularProgressIndicator()), // Menampilkan loading indicator
      );
    }
  }
}
