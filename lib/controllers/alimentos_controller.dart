import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/repositories/alimentos_rep.dart';

final alimentosState =
    StateNotifierProvider<AlimentosController, AsyncValue<List<Alimento>>>(
        (ref) => AlimentosController(ref.read));

class AlimentosController extends StateNotifier<AsyncValue<List<Alimento>>> {
  final Reader _reader;
  AlimentosController(this._reader) : super(const AsyncValue.loading());

  Future<void> getDespensa() async {
    var response = await _reader(alimentosRepositoryProvider).getDespensa();
    if (response.second.statusCode == 200) {
      state = AsyncValue.data(response.first);
    } else {
      print("Error: " + response.second.statusCode.toString());
    }
  }
}
