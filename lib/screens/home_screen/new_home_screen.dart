import 'package:bloc_pattern_app/models/user_profile.dart';
import 'package:bloc_pattern_app/screens/home_screen/home_screen_list_item.dart';
import 'package:bloc_pattern_app/screens/home_screen/new_user_bloc/new_user_bloc.dart';
import 'package:bloc_pattern_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewHomeScreen extends StatelessWidget {
  NewHomeScreen({super.key});

  final List<DataBean> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profiles"),
        actions: [
          IconButton(
            onPressed: () => context.read<NewUserBloc>()..add(OnDeleteEvent(users[0])),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<NewUserBloc, NewUserState>(
        bloc: context.read<NewUserBloc>()..add(OnFetchUsers()),
        builder: (context, state) {
          if (state is NoItemPresentEvent) {
            return Center(
              child: Text(
                "No users present!..",
                style: context.textTheme().titleLarge,
              ),
            );
          }

          if (state is OnLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is OnFailure) {
            return Center(
              child: Text(
                state.failureReason,
                style: context.textTheme().titleMedium,
              ),
            );
          }
          if (state is OnSuccess) {
            users.addAll(state.users);
          }
          if (state is OnDeleted) {
            users.remove(state.user);
          }

          if (users.isEmpty) {
            return Center(
              child: Text(
                "No users present!..",
                style: context.textTheme().titleLarge,
              ),
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, index) => HomeScreenListItem(
              user: users[index],
              index: index,
            ),
          );
        },
      ),
    );
  }
}
