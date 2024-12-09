part of 'residents_page_bloc.dart';

@immutable
sealed class ResidentsPageEvent extends Equatable {
  const ResidentsPageEvent();

  factory ResidentsPageEvent.filterResidents({required ResidentType type}) => FilterResidents._(type: type);

  factory ResidentsPageEvent.updateResidents({required List<ResidentItemDto> residents}) => UpdateResidents._(residents: residents);
}

@immutable
class FilterResidents extends ResidentsPageEvent {
  final ResidentType type;

  const FilterResidents._({required this.type});

  @override
  List<Object?> get props => [type];
}

@immutable
class UpdateResidents extends ResidentsPageEvent {
  final List<ResidentItemDto> residents;

  const UpdateResidents._({required this.residents});

  @override
  List<Object?> get props => [residents];
}
