import 'package:flutter/material.dart';
import '../models/pet_moment.dart';
import '../models/comment.dart';

class PetMomentProvider extends ChangeNotifier {
  // Lista privada de momentos
  final List<PetMoment> _moments = [
    PetMoment(
      id: '1',
      photoUrl: 'assets/images/perro1.jpg',
      caption:
          'Mi perrito feliz después de su paseo mañanero. ¡Le encanta la naturaleza!',
      petName: 'Max',
      ownerName: 'Ana',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      likes: 15,
      comments: [
        Comment(username: 'Laura', text: '¡Qué lindo!'),
        Comment(username: 'Pedro', text: 'Adoro esa raza.'),
        Comment(username: 'Sofía', text: 'Se ve muy contento.'),
      ],
    ),
    PetMoment(
      id: '2',
      photoUrl: 'assets/images/gato1.png',
      caption:
          'Siesta de domingo. Mi gatito es un experto en dormir en cualquier lugar.',
      petName: 'Luna',
      ownerName: 'Carlos',
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      likes: 22,
      comments: [
        Comment(username: 'Marta', text: '¡Qué paz!'),
        Comment(username: 'Juan', text: 'Tan adorable.'),
        Comment(username: 'Elena', text: 'Quiero dormir así.'),
      ],
    ),
    PetMoment(
      id: '3',
      photoUrl: 'assets/images/loro1.jpg',
      caption: '¡Mi loro Pepito, el mejor copiloto que se puede pedir!',
      petName: 'Pepito',
      ownerName: 'María',
      timestamp: DateTime.now().subtract(const Duration(hours: 10)),
      likes: 8,
      comments: [
        Comment(username: 'Andrés', text: '¡Qué loro tan especial!'),
        Comment(username: 'Luisa', text: 'Me encanta su color.'),
        Comment(username: 'Jorge', text: '¿Habla mucho?'),
      ],
    ),
  ];

  List<PetMoment> get moments => List.unmodifiable(_moments);

  // Añadir un nuevo momento
  void addMoment(PetMoment moment) {
    _moments.add(moment);
    notifyListeners();
  }

  // Agregar like a un momento (incrementar)
  void addLikeToMoment(String momentId) {
    final moment = _moments.firstWhere(
      (m) => m.id == momentId,
      orElse: () => throw Exception('Moment not found'),
    );
    moment.addLike();
    notifyListeners();
  }

  // Quitar like a un momento (decrementar)
  void removeLikeFromMoment(String momentId) {
    final moment = _moments.firstWhere(
      (m) => m.id == momentId,
      orElse: () => throw Exception('Moment not found'),
    );
    moment.removeLike();
    notifyListeners();
  }

  // Añadir comentario a un momento
  void addCommentToMoment(String momentId, Comment comment) {
    final moment = _moments.firstWhere(
      (m) => m.id == momentId,
      orElse: () => throw Exception('Moment not found'),
    );
    moment.comments.add(comment);
    notifyListeners();
  }

  void clearMoments() {
    _moments.clear();
    notifyListeners();
  }
}
