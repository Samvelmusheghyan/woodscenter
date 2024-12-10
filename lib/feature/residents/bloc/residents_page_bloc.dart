import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodscenter/core/domain/repository/content_repository.dart';
import 'package:woodscenter/core/utils/network/api_wrapper.dart';

import '../../../core/sources/woodscenter/response/resident_dto.dart';

part 'residents_page_event.dart';

part 'residents_page_state.dart';

class ResidentsPageBloc extends Bloc<ResidentsPageEvent, ResidentsPageState> {
  ResidentsPageBloc(this._contentRepository) : super(ResidentsPageState.initial()) {
    _getResidents();
    on<FilterResidents>(_filterResidents);
    on<UpdateResidents>(_updateResidents);
  }

  final ContentRepository _contentRepository;

  FutureOr<void> _filterResidents(FilterResidents event, Emitter<ResidentsPageState> emit) async {
    final filteredResidents = switch (event.type) {
      ResidentType.all => state.residents,
      _ => state.residents.where((resident) => resident.type == event.type).toList(),
    };
    emit(state.copyWith(filteredResidents: filteredResidents));
  }

  FutureOr<void> _updateResidents(UpdateResidents event, Emitter<ResidentsPageState> emit) async {
    emit(state.copyWith(residents: event.residents, filteredResidents: event.residents));
  }

  Future<void> _getResidents() async {
    final response = await _contentRepository.getResidents();
    switch (response) {
      case Success<ResidentDto>():
        {
          final residents = response.value?.residents;
          if (residents != null) {
            add(ResidentsPageEvent.updateResidents(residents: residents));
          }
        }
      case Error():
      case NetworkError():
      case UnknownError():
    }
  }
}
