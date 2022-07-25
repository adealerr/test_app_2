import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/screens/post_details_screen.dart';
import 'package:eclipse_test/ui/widgets/post_item.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class UserPostsScreen extends StatefulWidget {
  const UserPostsScreen({Key? key}) : super(key: key);

  @override
  State<UserPostsScreen> createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends BaseBlocState<UserPostsScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Posts by ${getBloc.state.selectedUser?.username}'),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) {
          final BlocAction? action = state.action;
          if (action is ShowLoader) {}
          if (action is NavigateToPost) {
            Navigator.push<dynamic>(
              context,
              SwipeablePageRoute<dynamic>(
                builder: (_) => const PostDetailsScreen(),
              ),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            itemCount: state.users.length,
            itemBuilder: (_, index) => PostItem(
              title: state.postsBySelectedUser[index].title,
              body: state.postsBySelectedUser[index].body,
              onMorePressed: () => getBloc.add(HomeEvent.postClicked(index)),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          ),
        ),
      );
}
