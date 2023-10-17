import 'package:expense_tracker/components/user_drawer.dart';
import 'package:expense_tracker/models/transacao.dart';
import 'package:expense_tracker/repository/transacoes_repository.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final transacoesRepo = TransacoesReepository();
  User? user;

  Future<String> getMeuTexto2() async {
    user = Supabase.instance.client.auth.currentUser;
    var futureTransacoes =
        await transacoesRepo.listarTransacoes(userId: user?.id ?? '');
    var teste = 0.00;
    futureTransacoes.forEach((e) => teste += e.valor);
    return teste.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      drawer: const UserDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder<String>(
              future: getMeuTexto2(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return Text('Valor Total Gasto: R\$' + snapshot.data!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
