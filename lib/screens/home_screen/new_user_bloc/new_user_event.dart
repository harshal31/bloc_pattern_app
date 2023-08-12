part of 'new_user_bloc.dart';

abstract class NewUserEvent extends Equatable {
  const NewUserEvent();
}

class OnFetchUsers extends NewUserEvent {
  @override
  List<Object?> get props => [];
}

class OnDeleteEvent extends NewUserEvent {
  final DataBean user;

  const OnDeleteEvent(this.user);

  @override
  List<Object?> get props => [user];
}
