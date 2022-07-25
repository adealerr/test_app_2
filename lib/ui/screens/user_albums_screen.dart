import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/screens/album_screen.dart';
import 'package:eclipse_test/ui/widgets/album_item.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class UserAlbumsScreen extends StatefulWidget {
  const UserAlbumsScreen({Key? key}) : super(key: key);

  @override
  State<UserAlbumsScreen> createState() => _UserAlbumsScreenState();
}

class _UserAlbumsScreenState extends BaseBlocState<UserAlbumsScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Albums by ${getBloc.state.selectedUser?.username}'),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) {
          final BlocAction? action = state.action;
          if (action is ShowLoader) {}
          if (action is NavigateToAlbum) {
            Navigator.push<dynamic>(
              context,
              SwipeablePageRoute<dynamic>(
                builder: (_) => const AlbumScreen(),
              ),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            itemCount: state.users.length,
            itemBuilder: (_, index) => AlbumItem(
              title: state.albumsBySelectedUser[index].title,
              imagePreview: state
                  .photosByAlbumId[state.albumsBySelectedUser[index].id]!
                  .first
                  .thumbnailUrl,
              onPressed: () => getBloc.add(HomeEvent.albumClicked(index)),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          ),
        ),
      );
}
