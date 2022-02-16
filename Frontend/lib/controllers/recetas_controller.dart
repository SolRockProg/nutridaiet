import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/repositories/recetas_rep.dart';
import 'package:shared_preferences/shared_preferences.dart';

final recetasState =
    StateNotifierProvider<RecetasController, AsyncValue<List<Receta>>>(
        (ref) => RecetasController(ref.read)..getRecetas());

class RecetasController extends StateNotifier<AsyncValue<List<Receta>>> {
  final Reader _reader;
  RecetasController(this._reader) : super(const AsyncValue.loading());

  Future<void> getRecetas() async {
    state = const AsyncValue.loading();
    var response = await _reader(recetasRespositoryProvider).getRecetas();
    if (response.second.statusCode == 200) {
      state = AsyncValue.data(response.first);
    } else {
      log("Error: " + response.second.statusCode.toString());
    }
  }

  Future<void> setValoracion(Receta receta) async {
    state.maybeWhen(
        orElse: () {},
        data: (oldReceta) => state = AsyncValue.data(
            oldReceta.map((e) => e.id == receta.id ? receta : e).toList()));
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("nombre") != null) {
      await _reader(recetasRespositoryProvider).setValoracion(receta);
    }
  }
}
