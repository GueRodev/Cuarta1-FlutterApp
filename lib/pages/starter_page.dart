import 'package:flutter/material.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Podemos usar un Container con gradiente para simular el fondo naranja
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo o ícono principal
                const Icon(
                  Icons.mobile_friendly,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                // Título
                const Text(
                  'Stock Mang',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Descripción
                const Text(
                  'Bienvenido(a) a esta increíble app para gestionar inventarios.\nInicia sesión o regístrate para continuar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 40),
                // Botón para ir a Login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 10),
                // Botón para ir a Register
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    '¿No tienes cuenta? Regístrate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
