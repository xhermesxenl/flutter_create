import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'signup_page.dart';
import 'signin_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/accueil.PNG', // Ton image de fond
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Ombre légère
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'SPORT TIMER',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Login With',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(MdiIcons.facebook),
                    onPressed: () {
                      // Action pour Facebook
                    },
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(MdiIcons.google),
                    onPressed: () {
                      // Action pour Google
                    },
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.email),
                    onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInPage()),
                          );
                        },
 // Email est dans le package de base

                    color: Colors.white,
                    iconSize: 30,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Or', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              ElevatedButton(
                 onPressed: () {
    // Navigation vers la page Signup
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Create a New Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialButton(String iconPath, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Image.asset(
            iconPath,
            height: 30,
          ),
        ),
      ),
    );
  }
}
