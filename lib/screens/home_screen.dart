import 'package:flutter/material.dart'; // Importa Material Design para los widgets de la UI.
import 'package:pet_pal_dyary/screens/add_moments.dart';
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import '../../providers/pet_moment_provider.dart'; // Importa el proveedor de momentos de mascotas.
import '../../widgets/pet_moment_card.dart'; // Importa el widget para mostrar cada momento.

/// `HomeScreen` es un widget sin estado (`StatelessWidget`)
/// ya que su estado (la lista de momentos) es gestionado por `PetMomentProvider`
/// y notifica a la UI de los cambios.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accede a la instancia de `PetMomentProvider` usando `Provider.of`.
    // Esto permite que el widget "escuche" los cambios en el proveedor.
    final petMomentProvider = Provider.of<PetMomentProvider>(context);
    // Obtiene la lista actual de momentos desde el proveedor.
    final moments = petMomentProvider.moments;

    // `Scaffold` proporciona la estructura visual básica de la pantalla.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Pal Diary', // Título de la barra de aplicación.
          style: TextStyle(color: Colors.white), // Estilo del texto del título.
        ),
        centerTitle: true, // Centra el título en la barra.
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary, // Color de la AppBar.
      ),
      // El cuerpo de la pantalla verifica si hay momentos.
      body: moments.isEmpty
          ? const Center(
              // Si no hay momentos, muestra un mensaje central.
              child: Text(
                '¡Aún no hay momentos! Añade el primero.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              // Si hay momentos, usa un `ListView.builder` para construir
              // la lista de manera eficiente.
              itemCount: moments.length, // Número total de momentos.
              itemBuilder: (context, index) {
                // Para cada momento en la lista, crea un `PetMomentCard`.
                return PetMomentCard(moment: moments[index]);
              },
            ),
      // Botón de acción flotante para añadir nuevos momentos.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddMomentScreen()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
