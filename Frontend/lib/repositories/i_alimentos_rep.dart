import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/model/file.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:nutridaiet/utils/tuple.dart';

abstract class IAlimentosRepository {
  Future<Pair<List<Alimento>, InfoResponse>> sendTicket(LocalFile file);
  Future<Pair<List<Alimento>, InfoResponse>> getDespensa();
}
