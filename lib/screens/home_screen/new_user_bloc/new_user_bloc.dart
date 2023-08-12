import 'dart:async';
import 'package:bloc_pattern_app/models/user_profile.dart';
import 'package:bloc_pattern_app/screens/home_screen/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_user_event.dart';

part 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  final UserRepository userRepository;
  List<DataBean> users = [];

  NewUserBloc(this.userRepository) : super(OnLoading()) {
    on<OnFetchUsers>(_onFetchUsers);
    on<OnDeleteEvent>(_onDeleteEvent);
  }

  FutureOr<void> _onFetchUsers(event, emit) async {
    emit(OnLoading());
    try {
      var response = await userRepository.getUserProfile();
      users.addAll(response);
      emit(OnSuccess(response));
    } catch (e) {
      emit(OnFailure(e.toString()));
    }
  }

  FutureOr<void> _onDeleteEvent(event, emit) {
    var deleteEvent = (event as OnDeleteEvent);
    if (users.isEmpty) {
      emit(NoItemPresentEvent());
    } else {
      users.remove(deleteEvent.user);
      emit(OnDeleted(deleteEvent.user));
    }
  }
}
