import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/repositories/i_recetas_rep.dart';
import 'package:nutridaiet/utils/strings.dart';
import 'package:nutridaiet/utils/tuple.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:http/http.dart' as http;

final recetasRespositoryProvider =
    Provider<IRecetasRepository>((_) => RecetasRepository());

class RecetasRepositoryMock extends IRecetasRepository {
  @override
  Future<Pair<List<Receta>, InfoResponse>> getRecetas() async {
    await Future.delayed(const Duration(seconds: 2));
    return Pair([
      const Receta(
          1,
          "Pollo al horno",
          45,
          "Prueba de descripcion ipeuwqgwdi urgesduyg ewiudgew08ug ewfp9u9ghew8yg c8uweguwd e9uye9",
          ["Hola", "como", "estas"]),
      const Receta(2, "Macarrones", 20, "Prueba de descripcion",
          ["Hola", "como", "estas"]),
      const Receta(
          3, "Risotto", 20, "Prueba de descripcion", ["Hola", "como", "estas"]),
      const Receta(4, "Ensalada", 45, "Prueba de descripcion",
          ["Hola", "como", "estas"]),
      const Receta(5, "Carrillera", 45, "Prueba de descripcion",
          ["Hola", "como", "estas"])
    ], InfoResponse(statusCode: 200));
  }
}

class RecetasRepository extends IRecetasRepository {
  @override
  Future<Pair<List<Receta>, InfoResponse>> getRecetas() async {
    var uri = Uri.parse(url + "/recetas");

    var response = await http
        .get(uri, headers: {HttpHeaders.accessControlAllowOriginHeader: "*"});
    print(response.body);
    List<Receta> recetas = (json.decode(response.body) as List)
        .map((receta) => Receta.fromJson(receta))
        .toList();

    return Pair(recetas, InfoResponse(statusCode: response.statusCode));
  }
}
