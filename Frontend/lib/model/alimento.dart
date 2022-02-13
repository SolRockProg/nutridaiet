import 'package:equatable/equatable.dart';

class Alimento extends Equatable {
  final int id;
  final String nombre;
  final int cantidad;

  const Alimento(this.nombre, this.id, this.cantidad);

  @override
  List<Object?> get props => [id, nombre, cantidad];

  Alimento.fromJson(Map<String, dynamic> json)
      : id = json['ingredientesId'],
        nombre = json['Ingrediente']['name'],
        cantidad = json['cantidad'];
}
