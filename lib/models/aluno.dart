class Aluno {
  int? id;
  String nome;
  bool ativo;
  String plano;

  Aluno({this.id, required this.nome, required this.ativo, required this.plano});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'], 
      nome: json['nome'],
      ativo: json['ativo'],
      plano: json['plano'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'nome': nome,
      'ativo': ativo,
      'plano': plano,
    };
  }
}
