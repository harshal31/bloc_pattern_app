part of 'new_user_bloc.dart';

abstract class NewUserState extends Equatable {
  const NewUserState();
}

class OnLoading extends NewUserState {
  @override
  List<Object> get props => [];
}

class OnSuccess extends NewUserState {
  final List<DataBean> users;

  const OnSuccess(this.users);

  @override
  List<Object?> get props => [users];
}

class OnFailure extends NewUserState {
  final String failureReason;

  const OnFailure(this.failureReason);

  @override
  List<Object?> get props => [failureReason];
}

class OnDeleted extends NewUserState {
  final DataBean user;

  const OnDeleted(this.user);

  @override
  List<Object?> get props => [user];
}

class NoItemPresentEvent extends NewUserState {
  @override
  List<Object?> get props => [];
}
