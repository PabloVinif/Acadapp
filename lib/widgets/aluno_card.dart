import 'package:flutter/material.dart';
import '../models/aluno.dart';

class AlunoCard extends StatelessWidget {
  final Aluno aluno;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  AlunoCard({
    required this.aluno,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          aluno.nome,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Chip(
              label: Text(aluno.plano),
              backgroundColor: Colors.blue.shade200,
            ),
            SizedBox(width: 8),
            Chip(
              label: Text(aluno.ativo ? 'Ativo' : 'Inativo'),
              backgroundColor: aluno.ativo ? Colors.green : Colors.red,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
