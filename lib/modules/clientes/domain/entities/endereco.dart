import 'package:license/modules/clientes/domain/entities/cidade.dart';

class Endereco {
  String logradouro;
  String bairro;
  String cep;
  Cidade cidade;
  Endereco({
    required this.logradouro,
    required this.bairro,
    required this.cep,
    required this.cidade,
  });
}
