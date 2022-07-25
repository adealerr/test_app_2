import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/screens/user_albums_screen.dart';
import 'package:eclipse_test/ui/screens/user_posts_screen.dart';
import 'package:eclipse_test/ui/widgets/album_item.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState
    extends BaseBlocState<UserDetailsScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(getBloc.state.selectedUser?.username ?? ''),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (_, state) {
          final BlocAction? action = state.action;
          if (action is ShowLoader) {}
          if (action is NavigateToUserPosts) {
            Navigator.push<dynamic>(
              context,
              SwipeablePageRoute<dynamic>(
                builder: (_) => const UserPostsScreen(),
              ),
            );
          }
          if (action is NavigateToUserAlbums) {
            Navigator.push<dynamic>(
              context,
              SwipeablePageRoute<dynamic>(
                builder: (_) => const UserAlbumsScreen(),
              ),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPersonalInfo(),
                  _buildPostsPreview(),
                  _buildAlbumsPreview(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildPersonalInfo() => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 16),
              child: Text(
                'Personal info',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TODO
                  _buildTitleBodyForm(
                      title: 'Name', text: state.selectedUser?.name),
                  _buildTitleBodyForm(
                      title: 'Email', text: state.selectedUser?.email),
                  _buildTitleBodyForm(
                      title: 'Phone', text: state.selectedUser?.phone),
                  _buildTitleBodyForm(
                      title: 'Website', text: state.selectedUser?.website),
                  _buildTitleBodyForm(
                      title: 'Company', text: state.selectedUser?.company.name),
                  _buildTitleBodyForm(
                      title: 'Bs', text: state.selectedUser?.company.bs),
                  _buildTitleBodyForm(
                      title: 'Catch phrase',
                      text: state.selectedUser?.company.catchPhrase),
                  _buildTitleBodyForm(
                      title: 'Address',
                      isLast: true,
                      text: '${state.selectedUser?.address.city}'
                          ' ${state.selectedUser?.address.street}'
                          ' ${state.selectedUser?.address.suite}'),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildTitleBodyForm(
          {String? title, String? text, bool isLast = false}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text ?? '',
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (!isLast)
            const Divider(
              height: 2,
              thickness: 2,
            ),
        ],
      );

  Widget _buildPostsPreview() => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => /*state.postsBySelectedUser.isNotEmpty ?*/
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12),
              child: Text(
                'Posts preview',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            _buildPostPreview(
                title: state.postsBySelectedUser[0].title,
                text: state.postsBySelectedUser[0].body),
            _buildPostPreview(
                title: state.postsBySelectedUser[1].title,
                text: state.postsBySelectedUser[1].body),
            _buildPostPreview(
                title: state.postsBySelectedUser[2].title,
                text: state.postsBySelectedUser[2].body,
                isLast: true),
            GestureDetector(
              onTap: () => getBloc.add(const HomeEvent.viewAllPostsClicked()),
              child: const Text(
                'view all posts',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ) /*: const SizedBox.shrink()*/,
      );

  Widget _buildPostPreview(
          {String? title, String? text, bool isLast = false}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  text ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (!isLast)
            const Divider(
              height: 2,
              thickness: 2,
            ),
        ],
      );

  Widget _buildAlbumsPreview() =>
      BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        final firstAlbumId = state.albumsBySelectedUser[0].id;
        final secondAlbumId = state.albumsBySelectedUser[1].id;
        final thirdAlbumId = state.albumsBySelectedUser[2].id;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12),
              child: Text(
                'Albums preview',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            AlbumItem(
                title: state.albumsBySelectedUser[0].title,
                imagePreview:
                    state.photosByAlbumId[firstAlbumId]?.first.thumbnailUrl ??
                        ''),
            AlbumItem(
                title: state.albumsBySelectedUser[1].title,
                imagePreview:
                    state.photosByAlbumId[secondAlbumId]?.first.thumbnailUrl ??
                        ''),
            AlbumItem(
                title: state.albumsBySelectedUser[2].title,
                imagePreview:
                    state.photosByAlbumId[thirdAlbumId]?.first.thumbnailUrl ??
                        '',
                isLast: true),
            GestureDetector(
              onTap: () => getBloc.add(const HomeEvent.viewAllAlbumsClicked()),
              child: const Text(
                'view all albums',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      });
}
