import 'package:flutter/material.dart';
import '../main.dart'; // Para acceder a registeredUsers

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Simple validación de email usando expresión regular
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu correo electrónico';
    }
    // Expresión regular muy básica para emails
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Formato de correo inválido';
    }
    return null;
  }

  // Validación de contraseña
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Validamos contra nuestro "mapa" de usuarios registrados
      if (registeredUsers.containsKey(email) &&
          registeredUsers[email] == password) {
        // Si coincide, navegamos a la página de bienvenida
        Navigator.pushNamed(
          context,
          '/welcome',
          arguments: email, // pasamos el email como argumento
        );
      } else {
        // Mostramos un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    }
  }

  void _recoverPassword() {
    // Muestra un simple SnackBar simulando la recuperación
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidad de recuperación no implementada'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Un fondo con color degradado similar
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Título
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo de email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 10),
                      // Campo de contraseña
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 10),
                      // Enlace para recuperar contraseña
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _recoverPassword,
                          child: const Text('¿Olvidaste tu contraseña?'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón de inicio de sesión
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        child: const Text('Iniciar Sesión'),
                      ),
                      const SizedBox(height: 10),
                      // Botón para ir a Register
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text('¿No tienes cuenta? Regístrate'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
