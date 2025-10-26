import 'package:flutter/material.dart';
import '../models/pet_moment.dart';
import '../models/comment.dart';

class PetMomentCard extends StatefulWidget {
  final PetMoment moment;

  const PetMomentCard({Key? key, required this.moment}) : super(key: key);

  @override
  State<PetMomentCard> createState() => _PetMomentCardState();
}

class _PetMomentCardState extends State<PetMomentCard> {
  bool isLiked = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        widget.moment.removeLike();
      } else {
        widget.moment.addLike();
      }
      isLiked = !isLiked;
    });
  }

  void addComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        widget.moment.comments.add(
          Comment(
            username: 'Tú',
            text: text,
          ), // Puedes cambiar 'Tú' por el nombre real
        );
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final moment = widget.moment;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto de la mascota
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(moment.photoUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),

            // Botón Like y contador
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey[600],
                  ),
                  onPressed: toggleLike,
                ),
                Text('${moment.likes} likes'),
              ],
            ),

            // Caption
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '${moment.petName} - ${moment.caption}',
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const Divider(),

            // Lista de comentarios
            ...moment.comments.map(
              (comment) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${comment.username}: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: comment.text,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Campo para añadir nuevo comentario
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Añade un comentario...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: addComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
