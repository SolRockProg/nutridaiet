import 'package:equatable/equatable.dart';

class Receta extends Equatable {
  final int id;
  final String name;
  final int tiempo;
  final String descripcion;
  final List<String> steps;

  const Receta(this.id, this.name, this.tiempo, this.descripcion, this.steps);

  @override
  List<Object?> get props => [id, name, tiempo, descripcion, steps];

  Receta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['nombre'],
        tiempo = json['minutes'],
        descripcion = json['description'],
        steps = (json['steps'] as List).map((item) => item as String).toList();
}
