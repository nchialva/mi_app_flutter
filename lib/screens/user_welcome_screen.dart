import 'package:flutter/material.dart'; // Importa Material Design para los widgets de la UI.
import 'package:pet_pal_dyary/screens/home_screen.dart'; // Importa la pantalla principal a la que navegaremos.

/// `UserWelcomeScreen` es un widget sin estado (`StatelessWidget`)
/// porque solo muestra información recibida y no gestiona su propio estado interno.
class UserWelcomeScreen extends StatelessWidget {
  // El nombre de usuario se recibe a través del constructor y es inmutable.
  final String username;

  const UserWelcomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    // `Scaffold` proporciona la estructura visual básica de la pantalla.
    return Scaffold(
      backgroundColor: Colors.teal[50], // Color de fondo suave.
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            24.0,
          ), // Espaciado alrededor del contenido.
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos verticalmente.
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centra los elementos horizontalmente.
            children: <Widget>[
              // Icono decorativo.
              Icon(Icons.favorite_border, size: 80.0, color: Colors.pink),
              const SizedBox(height: 20),

              // Mensaje de bienvenida personalizado que incluye el nombre del usuario.
              Text(
                '¡Bienvenido, $username!',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Descripción de la aplicación.
              const Text(
                'Esta es tu aplicación Pet Moments, el lugar perfecto para guardar y revivir los momentos más adorables y significativos con tus queridas mascotas. Desde sus travesuras diarias hasta sus logros más grandes, cada recuerdo es un tesoro.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueGrey,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Botón para navegar a la pantalla principal.
              ElevatedButton(
                onPressed: () {
                  // `Navigator.pushReplacement` se usa para reemplazar la pantalla actual
                  // con `HomeScreen`, evitando que el usuario pueda volver a esta pantalla
                  // usando el botón de atrás del dispositivo.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  'Explorar mis momentos',
                  style: TextStyle(
                    fontSize: 18.0,
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
