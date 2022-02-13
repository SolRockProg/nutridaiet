import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/model/file.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:nutridaiet/utils/tuple.dart';

abstract class IRecetasRepository {
  Future<Pair<List<Alimento>, InfoResponse>> sendTicket(File file);
  Future<Pair<List<Alimento>, InfoResponse>> getDespensa();
}
