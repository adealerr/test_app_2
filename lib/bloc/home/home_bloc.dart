import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:eclipse_test/common/repository/common_repository.dart';
import 'package:eclipse_test/data/models/album_model.dart';
import 'package:eclipse_test/data/models/comment_model.dart';
import 'package:eclipse_test/data/models/photo_model.dart';
import 'package:eclipse_test/data/models/post_model.dart';
import 'package:eclipse_test/data/models/user_model.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:either_dart/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CommonRepository _commonRepository;

  HomeBloc({
    required CommonRepository commonRepository,
  })  : _commonRepository = commonRepository,
        super(const HomeState()) {
    on<_Init>(_init);
    on<_UserCardClicked>(_userCardClicked);
    on<_ViewAllPostsClicked>(_viewAllPostsClicked);
    on<_ViewAllAlbumsClicked>(_viewAllAlbumsClicked);
    on<_PostClicked>(_postClicked);
    on<_AlbumClicked>(_albumClicked);
    on<_PhotoClicked>(_photoClicked);
    on<_AddCommentClicked>(_addCommentClicked);
    on<_TextChanged>(_textChanged);
    on<_EmailChanged>(_emailChanged);
    on<_NameChanged>(_nameChanged);
    on<_SendComment>(_sendComment);
  }

  Future<void> _init(_Init event, Emitter emit) async {
    final users = <UserModel>[];

    await _commonRepository.getUsers().fold(
      (left) => users.addAll(left),
      (right) {
        /// TODO
      },
    );

    emit(state.copyWith(users: users));
  }

  Future<void> _userCardClicked(_UserCardClicked event, Emitter emit) async {
    final selectedUser = state.users[event.index];

    List<PostModel> postsBySelectedUser = [];
    List<AlbumModel> albumsBySelectedUser = [];
    Map<int, List<PhotoModel>> photosByAlbumId = {};

    await _commonRepository.getPostsByUserID(userId: selectedUser.id).fold(
          (left) => postsBySelectedUser.addAll(left),

          /// TODO
          (right) => null,
        );

    await _commonRepository.getAlbumsByUserID(userId: selectedUser.id).fold(
          (left) => albumsBySelectedUser.addAll(left),

          /// TODO
          (right) => null,
        );

    photosByAlbumId =
        Map.from(await _getPhotosForPreview(albumsBySelectedUser));

    emit(
      state.copyWith(
        action: NavigateToUserDetails(),
        selectedUser: selectedUser,
        postsBySelectedUser: postsBySelectedUser,
        albumsBySelectedUser: albumsBySelectedUser,
        photosByAlbumId: photosByAlbumId,
      ),
    );
  }

  Future<Map<int, List<PhotoModel>>> _getPhotosForPreview(
      List<AlbumModel> albumsBySelectedUser) async {
    Map<int, List<PhotoModel>> photosByAlbumIdToSet = {};

    for (var i = 0; i < 3; i++) {
      await _commonRepository
          .getPhotosByAlbumID(albumId: albumsBySelectedUser[i].id)
          .fold(
            (left) =>
                photosByAlbumIdToSet.addAll({albumsBySelectedUser[i].id: left}),

            /// TODO
            (right) => null,
          );
    }

    return photosByAlbumIdToSet;
  }

  Future<void> _viewAllPostsClicked(
      _ViewAllPostsClicked event, Emitter emit) async {
    emit(state.copyWith(action: NavigateToUserPosts()));
  }

  Future<void> _viewAllAlbumsClicked(
      _ViewAllAlbumsClicked event, Emitter emit) async {
    Map<int, List<PhotoModel>> photosByAlbumIdToSet = {};

    for (var i = 0; i < state.albumsBySelectedUser.length; i++) {
      await _commonRepository
          .getPhotosByAlbumID(albumId: state.albumsBySelectedUser[i].id)
          .fold(
            (left) => photosByAlbumIdToSet
                .addAll({state.albumsBySelectedUser[i].id: left}),

            /// TODO
            (right) => null,
          );
    }

    emit(state.copyWith(
        action: NavigateToUserAlbums(), photosByAlbumId: photosByAlbumIdToSet));
  }

  Future<void> _postClicked(_PostClicked event, Emitter emit) async {
    final selectedPost = state.postsBySelectedUser[event.index];
    List<CommentModel> comments = [];

    if (selectedPost.id != null) {
      await _commonRepository
          .getCommentsByPostID(postId: selectedPost.id!)
          .fold((left) => comments.addAll(left), (right) => null);
    }

    emit(state.copyWith(
        selectedPost: selectedPost,
        commentsBySelectedPost: comments,
        action: NavigateToPost()));
  }

  Future<void> _photoClicked(_PhotoClicked event, Emitter emit) async {
    emit(state.copyWith(selectedPhotoIndex: event.index, action: ShowPhoto()));
    emit(state.copyWith(action: null));
  }

  Future<void> _albumClicked(_AlbumClicked event, Emitter emit) async {
    final selectedAlbum = state.albumsBySelectedUser[event.index];

    emit(state.copyWith(
        selectedAlbum: selectedAlbum, action: NavigateToAlbum()));
  }

  Future<void> _addCommentClicked(
      _AddCommentClicked event, Emitter emit) async {
    emit(state.copyWith(action: ShowCommentBottomSheet()));
    emit(state.copyWith(action: null));
  }

  Future<void> _nameChanged(_NameChanged event, Emitter emit) async {
    emit(state.copyWith(enteredName: event.value));
  }

  Future<void> _emailChanged(_EmailChanged event, Emitter emit) async {
    emit(state.copyWith(enteredEmail: event.value));
  }

  Future<void> _textChanged(_TextChanged event, Emitter emit) async {
    emit(state.copyWith(enteredText: event.value));
  }

  Future<void> _sendComment(_SendComment event, Emitter emit) async {
    /// TODO: тут должна быть валидация

    List<CommentModel> comments = [];

    final comment = CommentModel(
        postId: state.selectedPost!.id!,
        body: state.enteredText ?? '',
        name: state.enteredName ?? '',
        email: state.enteredEmail ?? '');

    if (await _commonRepository.postComment(comment: comment).isLeft) {
      await _commonRepository
          .getCommentsByPostID(postId: state.selectedPost!.id!)
          .fold((left) => comments.addAll(left), (right) => null);
    }
    emit(state.copyWith(commentsBySelectedPost: comments));
  }
}
