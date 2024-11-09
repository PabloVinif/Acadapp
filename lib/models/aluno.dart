class Aluno {
  int? id;
  String nome;
  bool ativo;
  String plano;

  Aluno({this.id, required this.nome, required this.ativo, required this.plano});

  // Método para criar um objeto Aluno a partir de um JSON
  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'], // O id vem do JSON do json-server
      nome: json['nome'],
      ativo: json['ativo'],
      plano: json['plano'],
    );
  }

  // Método para converter um objeto Aluno para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id, // O id é opcional, pois o json-server vai gerenciar
      'nome': nome,
      'ativo': ativo,
      'plano': plano,
    };
  }
}
