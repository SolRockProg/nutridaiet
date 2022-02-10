import 'package:equatable/equatable.dart';

class Alimento extends Equatable {
  final String nombre;

  const Alimento(this.nombre);

  @override
  List<Object?> get props => throw UnimplementedError();
}
