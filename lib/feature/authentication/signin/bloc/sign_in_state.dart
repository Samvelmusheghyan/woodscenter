part of 'sign_in_bloc.dart';

@immutable
class SignInPageState extends Equatable {
  final String? message;

  const SignInPageState._({this.message});

  factory SignInPageState.initial() => const SignInPageState._();

  @override
  List<Object?> get props => [message];

  SignInPageState copyWith({
    String? message,
  }) {
    return SignInPageState._(
      message: message ?? this.message,
    );
  }
}
