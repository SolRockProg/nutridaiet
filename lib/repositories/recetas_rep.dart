import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/model/file.dart';
import 'package:nutridaiet/repositories/i_recetas_rep.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:http/http.dart' as http;
import 'package:nutridaiet/utils/tuple.dart';

final recetasCheckRepositoryProvider =
    Provider<IRecetasRepository>((_) => RecetasRepositoryMock());

class RecetasRepositoryMock implements IRecetasRepository {
  @override
  Future<InfoResponse> sendTicket(File file) async {
    await Future.delayed(const Duration(seconds: 2));
    throw InfoResponse(statusCode: 200);
  }

  @override
  Future<Pair<List<Alimento>, InfoResponse>> getDespensa() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Pair(['Azucar', 'Sal', 'Manzana'], InfoResponse(statusCode: 200));
  }
}

class RecetasRepository implements IRecetasRepository {
  @override
  Future<InfoResponse> sendTicket(File file) async {
    var uri = Uri.parse("");
    var img = await http.MultipartFile.fromPath("file", file.url);

    var request = http.MultipartRequest("POST", uri);
    request.files.add(img);
    var response = await request.send();

    return InfoResponse(statusCode: response.statusCode);
  }

  @override
  Future<Pair<List<Alimento>, InfoResponse>> getDespensa() async {
    var uri = Uri.parse("");

    Pair<List<Alimento>, InfoResponse> responseDespensa  = Pair([], InfoResponse(statusCode: 200));

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //List<Alimento> despensa = (json.decode(response.body) as List).map((alimento) => Alimento.fromJson(alimento))
    }
    return responseDespensa;
  }
}
