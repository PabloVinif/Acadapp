import 'package:flutter/material.dart';
import '../models/aluno.dart';
import 'adicionar_aluno_page.dart';
import '../widgets/aluno_card.dart';
import '../services/aluno_service.dart';

class AlunosListPage extends StatefulWidget {
  @override
  _AlunosListPageState createState() => _AlunosListPageState();
}

class _AlunosListPageState extends State<AlunosListPage> {
  final AlunoService _alunoService = AlunoService();
  List<Aluno> alunos = [];

  @override
  void initState() {
    super.initState();
    _loadAlunos();
  }

  Future<void> _loadAlunos() async {
    try {
      List<Aluno> fetchedAlunos = await _alunoService.fetchAlunos();
      setState(() {
        alunos = fetchedAlunos;
      });
    } catch (e) {
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Alunos'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdicionarAlunoPage(
                    onAlunoAdicionado: _adicionarAluno,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: alunos.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: alunos.length,
                itemBuilder: (context, index) {
                  final aluno = alunos[index];
                  return AlunoCard(
                    aluno: aluno,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdicionarAlunoPage(
                            onAlunoAdicionado: (alunoEditado) {
                              _editarAluno(index, alunoEditado);
                            },
                            aluno: aluno,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      _removerAluno(index);
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarAlunoPage(onAlunoAdicionado: _adicionarAluno),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarAluno(Aluno aluno) async {
    await _alunoService.addAluno(aluno);
    _loadAlunos();  
  }

  void _editarAluno(int index, Aluno alunoEditado) async {
    await _alunoService.updateAluno(alunos[index].id!, alunoEditado);
    _loadAlunos(); 

  void _removerAluno(int index) async {
    await _alunoService.deleteAluno(alunos[index].id!);
    _loadAlunos();  
  }
}
