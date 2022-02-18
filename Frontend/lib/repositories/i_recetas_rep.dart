import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/utils/error_response.dart';
import 'package:nutridaiet/utils/tuple.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

abstract class IRecetasRepository {
  Future<Pair<List<Receta>, InfoResponse>> getRecetas(
      {SfRangeValues? calorias});
  Future<InfoResponse> setValoracion(Receta receta);
}
