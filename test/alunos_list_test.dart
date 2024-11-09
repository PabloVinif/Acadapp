import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplicativoacad/main.dart';

void main() {
  testWidgets('Deve adicionar um aluno à lista', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());


    expect(find.text('Lista de Alunos'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();


    await tester.enterText(find.byType(TextField), 'Lucas Santos');
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Anual').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Lucas Santos'), findsOneWidget);
  });

  testWidgets('Deve editar um aluno na lista', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());


    expect(find.text('Lista de Alunos'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit).first);
    await tester.pumpAndSettle();


    await tester.enterText(find.byType(TextField), 'João Silva Editado');
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Semanal').last);
    await tester.pumpAndSettle();


    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('João Silva Editado'), findsOneWidget);
  });

  testWidgets('Deve remover um aluno da lista', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());


    expect(find.text('Lista de Alunos'), findsOneWidget);


    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();


    expect(find.text('João Silva'), findsNothing);
  });

  testWidgets('Verifica se a tela inicial carrega corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Lista de Alunos'), findsOneWidget);
  });
}