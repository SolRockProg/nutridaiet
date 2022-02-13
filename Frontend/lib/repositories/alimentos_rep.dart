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
import 'package:shared_preferences/shared_preferences.dart';

final alimentosRepositoryProvider =
    Provider<IRecetasRepository>((_) => RecetasRepository());

class RecetasRepository implements IRecetasRepository {
  @override
  Future<Pair<List<Alimento>, InfoResponse>> sendTicket(File file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri =
        Uri.parse(url + "/pantry/ticket?user=" + prefs.getString('nombre')!);
    var img = await http.MultipartFile.fromPath("file", file.url);

    var request = http.MultipartRequest("POST", uri);
    request.files.add(img);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    List<Alimento> despensa = parseDespensa(response);

    return Pair(despensa, InfoResponse(statusCode: response.statusCode));
  }

  @override
  Future<Pair<List<Alimento>, InfoResponse>> getDespensa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri = Uri.parse(url + "/pantry?username=" + prefs.getString('nombre')!);

    var response = await http
        .get(uri, headers: {HttpHeaders.accessControlAllowOriginHeader: "*"});
    List<Alimento> despensa = parseDespensa(response);

    return Pair(despensa, InfoResponse(statusCode: response.statusCode));
  }

  List<Alimento> parseDespensa(http.Response response) {
    List<Alimento> despensa = (json.decode(response.body) as List)
        .map((alimento) => Alimento.fromJson(alimento))
        .toList();
    return despensa;
  }
}
