import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/repositories/i_recetas_rep.dart';
import 'package:nutridaiet/utils/tuple.dart';
import 'package:nutridaiet/utils/error_response.dart';

final recetasRespositoryProvider =
    Provider<IRecetasRepository>((_) => RecetasRepositoryMock());

class RecetasRepositoryMock extends IRecetasRepository {
  @override
  Future<Pair<List<Receta>, InfoResponse>> getRecetas() async {
    await Future.delayed(const Duration(seconds: 2));
    return Pair([
      const Receta("1", "Pollo al horno", 45, "Prueba de descripcion",
          ["Hola", "como", "estas"]),
      const Receta("2", "Macarrones", 20, "Prueba de descripcion",
          ["Hola", "como", "estas"]),
      const Receta("3", "Risotto", 20, "Prueba de descripcion",
          ["Hola", "como", "estas"]),
      const Receta("4", "Ensalada", 45, "Prueba de descripcion",
          ["Hola", "como", "estas"]),
      const Receta("5", "Carrillera", 45, "Prueba de descripcion",
          ["Hola", "como", "estas"])
    ], InfoResponse(statusCode: 200));
  }
}
