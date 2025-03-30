import 'package:flutter/material.dart';
import '../main.dart'; // Para acceder a registeredUsers

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu correo electrónico';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Formato de correo inválido';
    }
    // También podríamos verificar si el usuario ya existe
    if (registeredUsers.containsKey(value)) {
      return 'Este correo ya está registrado';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu número de teléfono';
    }
    // Ejemplo simple: verificar longitud mínima
    if (value.length < 7) {
      return 'El número de teléfono es muy corto';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Guardamos el nuevo usuario en nuestro mapa local
      registeredUsers[email] = password;

      // Podrías guardar también el teléfono en otra estructura si deseas.

      // Mostramos mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario $email registrado con éxito')),
      );

      // Después de registrar, podríamos navegar al Login
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      const Text(
                        'Register',
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
                      // Campo de teléfono (opcional)
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: _validatePhone,
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
                      const SizedBox(height: 20),
                      // Botón de registro
                      ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        child: const Text('Registrarse'),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('¿Ya tienes cuenta? Inicia sesión'),
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
