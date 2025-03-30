import 'package:flutter/material.dart';
import 'pages/starter_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/welcome_page.dart';

// Simularemos un "backend" con un mapa de usuarios registrados.
Map<String, String> registeredUsers = {
  // Por defecto un usuario de ejemplo
  'admin@admin.com': 'admin123',
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Puedes ajustar tus colores aquí, por ejemplo un tema naranja
        primarySwatch: Colors.orange,
      ),
      // La pantalla inicial será la StarterPage
      initialRoute: '/',
      // Definimos las rutas de navegación
      routes: {
        '/': (context) => const StarterPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/welcome': (context) => const WelcomePage(),
      },
    );
  }
}
