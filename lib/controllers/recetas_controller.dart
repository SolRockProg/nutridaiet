import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/repositories/recetas_rep.dart';

final recetasState =
    StateNotifierProvider<RecetasController, AsyncValue<List<Receta>>>(
        (ref) => RecetasController(ref.read));

class RecetasController extends StateNotifier<AsyncValue<List<Receta>>> {
  final Reader _reader;
  RecetasController(this._reader) : super(const AsyncValue.loading());

  Future<void> getRecetas() async {
    var response = await _reader(recetasRespositoryProvider).getRecetas();
    if (response.second.statusCode == 200) {
      state = AsyncValue.data(response.first);
    } else {
      print("Error: " + response.second.statusCode.toString());
    }
  }
}
