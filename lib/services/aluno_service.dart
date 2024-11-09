import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/aluno.dart';

class AlunoService {
  final String baseUrl = 'http://localhost:3000/alunos';

  Future<List<Aluno>> fetchAlunos() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Aluno.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load alunos');
    }
  }

  Future<void> addAluno(Aluno aluno) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(aluno.toJson()),
    );
  }

  Future<void> updateAluno(int id, Aluno aluno) async {
    await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(aluno.toJson()),
    );
  }

  Future<void> deleteAluno(int id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}
