import 'package:equatable/equatable.dart';

class Receta extends Equatable {
  final int id;
  final String name;
  final int tiempo;
  final String descripcion;
  final List<String> steps;
  final double calorias;
  final double valoracion;

  const Receta(this.id, this.name, this.tiempo, this.descripcion, this.steps,
      this.calorias, this.valoracion);

  @override
  List<Object?> get props => [id, name, tiempo, descripcion, steps];

  Receta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['nombre'],
        tiempo = json['minutes'],
        descripcion = json['description'],
        steps = (json['steps'] as List).map((item) => item as String).toList(),
        calorias = json['calorias'],
        valoracion = 0;

  Receta copyWith({
    int? id,
    String? name,
    int? tiempo,
    String? descripcion,
    List<String>? steps,
    double? calorias,
    double? valoracion,
  }) {
    return Receta(
      id ?? this.id,
      name ?? this.name,
      tiempo ?? this.tiempo,
      descripcion ?? this.descripcion,
      steps ?? this.steps,
      calorias ?? this.calorias,
      valoracion ?? this.valoracion,
    );
  }
}
