part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    BlocAction? action,
    UserModel? selectedUser,
    PostModel? selectedPost,
    AlbumModel? selectedAlbum,
    int? selectedPhotoIndex,
    String? enteredName,
    String? enteredEmail,
    String? enteredText,
    @Default(<UserModel>[]) List<UserModel> users,
    @Default(<PostModel>[]) List<PostModel> postsBySelectedUser,
    @Default(<AlbumModel>[]) List<AlbumModel> albumsBySelectedUser,
    @Default(<CommentModel>[]) List<CommentModel> commentsBySelectedPost,
    @Default(<int, List<PhotoModel>>{})
        Map<int, List<PhotoModel>> photosByAlbumId,
    // TweetModel? selectedTweet,
    // @Default(<TweetModel>[]) List<TweetModel> tweets,
  }) = _HomeState;

// int get tweetsWEmojiCount {
//   int count = 0;
//
//   for (final TweetModel element in tweets) {
//     if (element.hasEmoji) {
//       count += 1;
//     }
//   }
//
//   return count;
// }
}

class ShowCommentBottomSheet extends BlocAction {}

class NavigateToUserDetails extends BlocAction {}

class NavigateToUserPosts extends BlocAction {}

class NavigateToPost extends BlocAction {}

class NavigateToUserAlbums extends BlocAction {}

class NavigateToAlbum extends BlocAction {}

class ShowPhoto extends BlocAction {}

class ShowLoader extends BlocAction {}
