import 'package:flutter/material.dart';
import '../models/aluno.dart';

class AdicionarAlunoPage extends StatefulWidget {
  final Function(Aluno) onAlunoAdicionado;
  final Aluno? aluno;

  AdicionarAlunoPage({required this.onAlunoAdicionado, this.aluno});

  @override
  _AdicionarAlunoPageState createState() => _AdicionarAlunoPageState();
}

class _AdicionarAlunoPageState extends State<AdicionarAlunoPage> {
  final _nomeController = TextEditingController();
  bool _ativo = true;
  String _plano = 'Mensal';

  @override
  void initState() {
    super.initState();
    if (widget.aluno != null) {
      _nomeController.text = widget.aluno!.nome;
      _ativo = widget.aluno!.ativo;
      _plano = widget.aluno!.plano;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.aluno == null ? 'Adicionar Aluno' : 'Editar Aluno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
            SizedBox(height: 12),
            SwitchListTile(
              title: Text('Ativo'),
              value: _ativo,
              onChanged: (value) {
                setState(() {
                  _ativo = value;
                });
              },
            ),
            SizedBox(height: 12),
            DropdownButton<String>(
              value: _plano,
              onChanged: (String? newValue) {
                setState(() {
                  _plano = newValue!;
                });
              },
              items: <String>['Mensal', 'Anual', 'Semanal']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Selecione o plano'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nomeController.text.isNotEmpty) {
                  final aluno = Aluno(
                    nome: _nomeController.text,
                    ativo: _ativo,
                    plano: _plano,
                  );
                  widget.onAlunoAdicionado(aluno);
                  Navigator.pop(context);
                }
              },
              child: Text(widget.aluno == null ? 'Adicionar' : 'Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
