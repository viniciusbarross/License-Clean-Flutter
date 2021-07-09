import 'package:dartz/dartz.dart';

import 'package:license/modules/clientes/domain/entities/cliente.dart';
import 'package:license/modules/clientes/domain/errors/errors.dart';
import 'package:license/modules/clientes/domain/repositories/cliente_repository.dart';

abstract class ClienteByText {
  Future<Either<ExceptionCliente, List<Cliente>>> call(String clienteText);
}

class ClienteByTextImpl implements ClienteByText {
  ClienteRepository clienteRepository;

  ClienteByTextImpl(this.clienteRepository);

  @override
  Future<Either<ExceptionCliente, List<Cliente>>> call(
      String clienteText) async {
    if (clienteText == '') {
      return Left(ExceptionCliente('Valor em branco não é válido'));
    }
    if (clienteText.length > 50) {
      return Left(ExceptionCliente('Nome superior ao permitido'));
    }
    return this.clienteRepository.ClienteFind(clienteText);
  }
}
