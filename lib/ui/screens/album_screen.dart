import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/screens/photo_screen.dart';
import 'package:eclipse_test/ui/widgets/photo_view_item.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends BaseBlocState<AlbumScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: const Text('Photos'),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          final BlocAction? action = state.action;
          if (action is ShowLoader) {
            /// TODO
          }
          if (action is ShowPhoto) {
            Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (_) => const PhotoScreen(),
              ),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            radius: const Radius.circular(10),
            thickness: 3,
  child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 3,
            ),
            itemCount: state.photosByAlbumId[state.selectedAlbum?.id]?.length,
            itemBuilder: (_, index) => _buildPhotoItem(
                index: index,
                image:
                    state.photosByAlbumId[state.selectedAlbum!.id]![index].url),
          ),
),
        ),
      );

  Widget _buildPhotoItem({required int index, required String image}) =>
      GestureDetector(
        onTap: () => getBloc.add(HomeEvent.photoClicked(index)),
        child: CachedNetworkImage(
          width: MediaQuery.of(context).size.width * 0.3,
          fit: BoxFit.cover,
          imageUrl: image,
        ),
      );
}
