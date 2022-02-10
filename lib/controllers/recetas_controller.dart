import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/repositories/recetas_rep.dart';

final recetasState =
    StateNotifierProvider<RecetasController, AsyncValue<List<Alimento>>>(
        (ref) => RecetasController(ref.read));

class RecetasController extends StateNotifier<AsyncValue<List<Alimento>>> {
  final Reader _reader;
  RecetasController(this._reader) : super(const AsyncValue.loading());

  Future<void> getDespensa() async {
    var response = await _reader(recetasCheckRepositoryProvider).getDespensa();
    if (response.second.statusCode == 200) {
      state = AsyncValue.data(response.first);
    } else {
      print("Error: " + response.second.statusCode.toString());
    }
  }
}
