part of 'residents_page_bloc.dart';

@immutable
class ResidentsPageState extends Equatable {
  final List<ResidentItemDto> residents;

  const ResidentsPageState._({required this.residents});

  factory ResidentsPageState.initial() => const ResidentsPageState._(residents: []);

  ResidentsPageState copyWith({
    List<ResidentItemDto>? residents,
  }) {
    return ResidentsPageState._(
      residents: residents ?? this.residents,
    );
  }

  @override
  List<Object?> get props => [residents];
}
