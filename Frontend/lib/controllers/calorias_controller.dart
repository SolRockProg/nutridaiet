import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

final caloriasProvider = StateProvider((ref) {
  return const SfRangeValues(1000, 4000);
});
