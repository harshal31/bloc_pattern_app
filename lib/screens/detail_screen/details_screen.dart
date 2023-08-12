import 'package:bloc_pattern_app/screens/home_screen/new_user_bloc/new_user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<NewUserBloc, NewUserState>(
        bloc: context.read<NewUserBloc>(),
        builder: (ctx, state) =>
            Text("users size is ${context.read<NewUserBloc>().users.length}"),
      ),
    );
  }
}
