import 'package:dartz/dartz.dart';
import 'package:license/modules/clientes/domain/entities/cliente.dart';
import 'package:license/modules/clientes/domain/errors/errors.dart';

abstract class ClienteRepository {
  Future<Either<ExceptionCliente, List<Cliente>>> ClienteFind(
      String textCliente);
}
