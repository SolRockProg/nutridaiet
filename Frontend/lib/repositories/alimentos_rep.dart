import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/model/file.dart';
import 'package:nutridaiet/repositories/i_alimentos_rep.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:http/http.dart' as http;
import 'package:nutridaiet/utils/strings.dart';
import 'package:nutridaiet/utils/tuple.dart';

final alimentosRepositoryProvider =
    Provider<IRecetasRepository>((_) => RecetasRepository());

class RecetasRepositoryMock implements IRecetasRepository {
  @override
  Future<InfoResponse> sendTicket(File file) async {
    await Future.delayed(const Duration(seconds: 2));
    return InfoResponse(statusCode: 200);
  }

  @override
  Future<Pair<List<Alimento>, InfoResponse>> getDespensa() async {
    await Future.delayed(const Duration(seconds: 2));
    return Pair([
      Alimento('Azucar', 1, 1),
      Alimento('Sal', 1, 1),
      Alimento('Manzana', 1, 1)
    ], InfoResponse(statusCode: 200));
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
    var uri = Uri.parse(url + "/pantry?username=1212");

    var response = await http
        .get(uri, headers: {HttpHeaders.accessControlAllowOriginHeader: "*"});
    List<Alimento> despensa = (json.decode(response.body) as List)
        .map((alimento) => Alimento.fromJson(alimento))
        .toList();

    return Pair(despensa, InfoResponse(statusCode: response.statusCode));
  }
}
