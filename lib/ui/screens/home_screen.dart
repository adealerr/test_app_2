import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/screens/user_details_screen.dart';
import 'package:eclipse_test/ui/widgets/user_card_item.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseBlocState<HomeScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) {
          final BlocAction? action = state.action;
          if (action is ShowLoader) {
            /// TODO
          }
          if (action is NavigateToUserDetails) {
            Navigator.push<dynamic>(
              context,
              SwipeablePageRoute<dynamic>(
                builder: (_) => const UserDetailsScreen(),
              ),
            );
          }
        },
        /// BlocConsumer в некоторых прослушывает action дважды
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            itemCount: state.users.length,
            itemBuilder: (_, index) => UserCardItem(
              name: state.users[index].name,
              username: state.users[index].username,
              onPressed: () => getBloc.add(HomeEvent.userCardClicked(index)),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          ),
        ),
      );
}
