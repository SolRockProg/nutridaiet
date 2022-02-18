import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/repositories/i_recetas_rep.dart';
import 'package:nutridaiet/utils/strings.dart';
import 'package:nutridaiet/utils/tuple.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

final recetasRespositoryProvider =
    Provider<IRecetasRepository>((_) => RecetasRepository());

class RecetasRepository extends IRecetasRepository {
  @override
  Future<Pair<List<Receta>, InfoResponse>> getRecetas(
      {SfRangeValues? calorias}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri uri;
    if (prefs.getString('nombre') != null) {
      uri = Uri.parse(url +
          "/recomendations?username=" +
          prefs.getString('nombre')! +
          "&limitCaloriesMin=${calorias?.start.toInt() ?? 0}&limitCaloriesMax=${calorias?.end.toInt() ?? 10000}&cantidad=9");
    } else {
      uri = Uri.parse(url + "/recetas?cantidad=9");
    }

    var response = await http
        .get(uri, headers: {HttpHeaders.accessControlAllowOriginHeader: "*"});
    List<Receta> recetas = (json.decode(response.body) as List)
        .map((receta) => Receta.fromJson(receta))
        .take(9)
        .toList();

    return Pair(recetas, InfoResponse(statusCode: response.statusCode));
  }

  @override
  Future<InfoResponse> setValoracion(Receta receta) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri = Uri.parse(url +
        "/new_interaction?username=" +
        prefs.getString('nombre')! +
        "&rate=" +
        receta.valoracion.toString() +
        "&recipeId=" +
        receta.id.toString());
    var response = await http
        .post(uri, headers: {HttpHeaders.accessControlAllowOriginHeader: "*"});
    return InfoResponse(statusCode: response.statusCode);
  }
}
