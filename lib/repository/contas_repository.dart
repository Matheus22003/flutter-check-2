import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    final supabase = Supabase.instance.client;
    final data =
        await supabase.from('conta').select<List<Map<String, dynamic>>>();

    final contas = data.map((e) => Conta.fromMap(e)).toList();
    return contas;
  }

  Future<void> addConta(String descricao, String bancoId, int tipoConta) async {
    final response = await Supabase.instance.client.from('conta').insert([
      {'descricao': descricao, 'banco': bancoId, "tipo_conta": tipoConta}
    ]).select();
  }
}
