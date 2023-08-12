import 'package:bloc_pattern_app/models/user_profile.dart';
import 'package:bloc_pattern_app/screens/home_screen/new_user_bloc/new_user_bloc.dart';
import 'package:bloc_pattern_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenListItem extends StatelessWidget {
  final DataBean user;
  final int index;

  const HomeScreenListItem({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(user.id),
      onDismissed: (dir) {
        context.read<NewUserBloc>().add(OnDeleteEvent(user));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colorScheme().onPrimaryContainer),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.firstName ?? "",
                      style: context.textTheme().titleLarge,
                    ),
                    Text(
                      user.lastName ?? "",
                      style: context.textTheme().titleMedium,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(user.avatar ?? ""),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
