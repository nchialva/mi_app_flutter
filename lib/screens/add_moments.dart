import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/pet_moment.dart';
import '../providers/pet_moment_provider.dart';

class AddMomentScreen extends StatefulWidget {
  const AddMomentScreen({Key? key}) : super(key: key);

  @override
  State<AddMomentScreen> createState() => _AddMomentScreenState();
}

class _AddMomentScreenState extends State<AddMomentScreen> {
  final _captionController = TextEditingController();
  final _petNameController = TextEditingController();
  final _ownerNameController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Puedes usar ImageSource.camera para cámara
      maxWidth: 800,
      maxHeight: 800,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_imageFile == null ||
        _captionController.text.isEmpty ||
        _petNameController.text.isEmpty ||
        _ownerNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor completa todos los campos y selecciona una imagen',
          ),
        ),
      );
      return;
    }

    // Crear un PetMoment nuevo
    final newMoment = PetMoment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      photoUrl: _imageFile!.path, // Usamos la ruta local temporal
      caption: _captionController.text,
      petName: _petNameController.text,
      ownerName: _ownerNameController.text,
      timestamp: DateTime.now(),
      likes: 0,
      comments: [],
    );

    // Agregar el momento al provider
    Provider.of<PetMomentProvider>(context, listen: false).addMoment(newMoment);

    Navigator.of(context).pop(); // Volver a la pantalla anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir Momento')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: _imageFile == null
                  ? Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text('Toca para seleccionar una imagen'),
                      ),
                    )
                  : Image.file(_imageFile!, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(labelText: 'Comentario'),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _petNameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la mascota',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _ownerNameController,
              decoration: const InputDecoration(labelText: 'Nombre del dueño'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Guardar Momento'),
            ),
          ],
        ),
      ),
    );
  }
}
