import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenemos el email que nos pasaron como argumento
    final String userEmail =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Usuario';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '¡Bienvenido!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Hola, $userEmail',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {
                      // Cerrar sesión: Regresamos a la página de Login
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                        (route) => false,
                      );
                    },
                    child: const Text('Cerrar Sesión'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
