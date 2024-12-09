import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:woodscenter/core/domain/repository/authentication_repository.dart';
import 'package:woodscenter/core/utils/network/api_wrapper.dart';

import '../../../../core/sources/woodscenter/response/login_dto.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInPageState> {
  SignInBloc(this._authenticationRepository) : super(SignInPageState.initial()) {
    on<SignIn>((event, emit) async {
      final response = await _authenticationRepository.login(email: event.email, password: event.password, rememberMe: true, gRecaptchaResponse: "eveeeeerrvervevveveverreveververv");
      switch (response) {
        case Success<LoginDto>():
          {}
        case Error error:
          {
            emit(state.copyWith(message: error.toString()));
          }
        case NetworkError networkError:
          {
            emit(state.copyWith(message: "no internet connection"));
          }
        case UnknownError unknownError:
          {
            emit(state.copyWith(message: unknownError.error.toString()));
          }
      }
    });
  }

  final AuthenticationRepository _authenticationRepository;

// final _sideEffectsController = StreamController<Effect>.broadcast();
}
