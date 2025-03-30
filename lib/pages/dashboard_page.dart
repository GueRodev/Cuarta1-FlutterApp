import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black87),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con el título de la aplicación
      appBar: AppBar(
        title: const Text('Stock Management System'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      // Fondo degradado para mantener la estética
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            // Ejemplo de menú con tarjetas color pastel
            _buildMenuItem(
              title: 'Dashboard',
              icon: Icons.dashboard,
              color: Colors.tealAccent.shade100,
              onTap: () {
                // Aquí puedes navegar a otra pantalla
                // o mostrar algo específico del dashboard
              },
            ),
            _buildMenuItem(
              title: 'Products',
              icon: Icons.shopping_bag,
              color: Colors.blue.shade100,
              onTap: () {
                // Navegar a la sección de productos
              },
            ),
            _buildMenuItem(
              title: 'Low Stock',
              icon: Icons.warning,
              color: Colors.yellow.shade100,
              onTap: () {
                // Navegar a la sección de stock bajo
              },
            ),
            _buildMenuItem(
              title: 'All Transactions',
              icon: Icons.receipt_long,
              color: Colors.pink.shade100,
              onTap: () {
                // Navegar a la sección de transacciones
              },
            ),
            _buildMenuItem(
              title: 'Setting',
              icon: Icons.settings,
              color: Colors.grey.shade200,
              onTap: () {
                // Navegar a la sección de configuraciones
              },
            ),
            // Botón de cerrar sesión
            _buildMenuItem(
              title: 'Cerrar Sesión',
              icon: Icons.logout,
              color: Colors.red.shade100,
              onTap: () {
                // Redirige al Login y limpia la pila de rutas
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
