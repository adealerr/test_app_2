part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;

  const factory HomeEvent.userCardClicked(int index) = _UserCardClicked;

  const factory HomeEvent.viewAllPostsClicked() = _ViewAllPostsClicked;

  const factory HomeEvent.viewAllAlbumsClicked() = _ViewAllAlbumsClicked;

  const factory HomeEvent.postClicked(int index) = _PostClicked;

  const factory HomeEvent.albumClicked(int index) = _AlbumClicked;

  const factory HomeEvent.photoClicked(int index) = _PhotoClicked;

  const factory HomeEvent.nameChanged(String value) = _NameChanged;

  const factory HomeEvent.emailChanged(String value) = _EmailChanged;

  const factory HomeEvent.textChanged(String value) = _TextChanged;

  const factory HomeEvent.addCommentClicked() = _AddCommentClicked;

  const factory HomeEvent.sendComment() = _SendComment;
}
