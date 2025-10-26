import 'package:flutter/material.dart'; // Importa Material Design para los widgets de la UI.
import 'package:pet_pal_dyary/screens/user_welcome_screen.dart'; // Importa la pantalla a la que navegaremos.

/// `WelcomeScreen` es un widget con estado (`StatefulWidget`)
/// porque gestiona el texto ingresado por el usuario en el campo.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

/// El estado asociado a `WelcomeScreen`.
class _WelcomeScreenState extends State<WelcomeScreen> {
  // `_usernameController` se usa para controlar el campo de texto
  // y obtener el nombre de usuario ingresado.
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // Es crucial liberar los recursos del controlador cuando el widget se elimina
    // para prevenir fugas de memoria.
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // `Scaffold` proporciona la estructura visual básica de la pantalla.
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          // Permite que el contenido sea desplazable, útil si el teclado lo cubre.
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Icono representativo de la aplicación.
              Icon(Icons.pets, size: 100.0, color: Colors.deepOrange),
              const SizedBox(height: 30),

              // Título principal de bienvenida.
              const Text(
                '¡Bienvenido a Pet Moments!',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Instrucción para el usuario.
              const Text(
                'Por favor, ingresa tu nombre para comenzar:',
                style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Campo de texto (`TextField`) para que el usuario ingrese su nombre.
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller:
                      _usernameController, // Vincula el controlador al campo de texto.
                  decoration: const InputDecoration(
                    hintText: 'Tu nombre de usuario',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),

              // Botón "Empecemos".
              ElevatedButton(
                onPressed: () {
                  // Cuando se presiona el botón:
                  final String username = _usernameController.text
                      .trim(); // Obtiene el texto y limpia espacios.
                  if (username.isNotEmpty) {
                    // Si el nombre no está vacío, navega a `UserWelcomeScreen`,
                    // pasando el nombre de usuario como argumento.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserWelcomeScreen(username: username),
                      ),
                    );
                  } else {
                    // Si el campo está vacío, muestra un mensaje (SnackBar).
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, ingresa tu nombre.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 18,
                  ),
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 8,
                ),
                child: const Text(
                  '¡Empecemos!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
