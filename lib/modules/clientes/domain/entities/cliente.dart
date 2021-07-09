import 'package:license/modules/clientes/domain/entities/endereco.dart';

class Cliente {
  String nome;
  String denome;
  String rg;
  String cgc;
  int idcidade;
  int idempresa;
  Endereco endereco;
  Cliente({
    required this.nome,
    required this.denome,
    required this.rg,
    required this.cgc,
    required this.idcidade,
    required this.idempresa,
    required this.endereco,
  });
}
