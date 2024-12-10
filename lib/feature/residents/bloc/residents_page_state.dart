part of 'residents_page_bloc.dart';

@immutable
class ResidentsPageState extends Equatable {
  final List<ResidentItemDto> residents;
  final List<ResidentItemDto> filteredResidents;

  const ResidentsPageState._({required this.filteredResidents, required this.residents});

  factory ResidentsPageState.initial() => const ResidentsPageState._(residents: [], filteredResidents: []);

  ResidentsPageState copyWith({
    List<ResidentItemDto>? residents,
    List<ResidentItemDto>? filteredResidents,
  }) {
    return ResidentsPageState._(
      residents: residents ?? this.residents,
      filteredResidents: filteredResidents ?? this.filteredResidents,
    );
  }

  @override
  List<Object?> get props => [residents, filteredResidents];
}
