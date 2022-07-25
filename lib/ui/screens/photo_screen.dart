import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/widgets/photo_view_item.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends BaseBlocState<PhotoScreen, HomeBloc> {
  late final _pageController;

  @override
  void initState() {
    super.initState();
    _setUpController();
  }

  void _setUpController() {
    _pageController = PageController(initialPage:
    getBloc.state.selectedPhotoIndex ?? 0);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: const Text('Photos'),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() =>
      BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return PageView.builder(
            controller: _pageController,
            itemCount: state.photosByAlbumId[state.selectedAlbum?.id]?.length,
            itemBuilder: (_, index) =>
                OpenedPhotoItem(
                  image: state.photosByAlbumId[state.selectedAlbum!.id]![index]
                      .url,
                  text:
                  state.photosByAlbumId[state.selectedAlbum!.id]![index].title,
                ),
          );
        },
      );
}