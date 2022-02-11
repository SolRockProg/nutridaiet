import 'package:equatable/equatable.dart';

class Receta extends Equatable {
  final String id;
  final String name;
  final int tiempo;
  final String descripcion;
  final List<String> steps;

  const Receta(this.id, this.name, this.tiempo, this.descripcion, this.steps);

  @override
  List<Object?> get props => [id, name, tiempo, descripcion, steps];
}
