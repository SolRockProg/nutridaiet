import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:nutridaiet/utils/tuple.dart';

abstract class IRecetasRepository {
  Future<Pair<List<Receta>, InfoResponse>> getRecetas();
}
