import 'package:eclipse_test/data/models/address_model.dart';
import 'package:eclipse_test/data/models/album_model.dart';
import 'package:eclipse_test/data/models/comment_model.dart';
import 'package:eclipse_test/data/models/company_model.dart';
import 'package:eclipse_test/data/models/geo_model.dart';
import 'package:eclipse_test/data/models/photo_model.dart';
import 'package:eclipse_test/data/models/post_model.dart';
import 'package:eclipse_test/data/models/user_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  /// Keys
  static const _kUsers = 'users';
  static const _kPosts = 'posts';
  static const _kAlbums = 'albums';
  static const _kPhotos = 'photos';
  static const _kComments = 'comments';

  static Future<void> initHive() async {
    Hive
      ..registerAdapter(AddressModelAdapter())
      ..registerAdapter(AlbumModelAdapter())
      ..registerAdapter(CommentModelAdapter())
      ..registerAdapter(CompanyModelAdapter())
      ..registerAdapter(GeoModelAdapter())
      ..registerAdapter(PostModelAdapter())
      ..registerAdapter(PhotoModelAdapter())
      ..registerAdapter(UserModelAdapter());
  }

  static Future<void> setUsers(List<UserModel> users) async {
    await Hive.openBox(_kUsers);
    final box = Hive.box(_kUsers);

    box.putAll(users.asMap());
  }

  static Future<List<UserModel>?> getUsers() async {
    await Hive.openBox(_kUsers);
    final box = Hive.box(_kUsers);

    if (box.isNotEmpty) {
      return box.values.toList().cast<UserModel>();
    }

    return [];
  }

  static Future<void> setAlbums(List<AlbumModel> albums) async {
    await Hive.openBox(_kAlbums);
    final box = Hive.box(_kAlbums);
    final userId = albums.first.userId;

    /*Map<int, List<AlbumModel>> albumsToMap = <int, List<AlbumModel>>{
      userId: albums
    };

    final albumsWrapper = AlbumWrapperModel(userId: userId, albums: albums);
*/
    if (!box.containsKey(userId)) {
      box.put(userId, albums);
    }
  }

  static Future<List<AlbumModel>?> getAlbums(int userId) async {
    await Hive.openBox(_kAlbums);
    final box = Hive.box(_kAlbums);

    return box.get(userId)?.toList().cast<AlbumModel>();
  }

  static Future<void> setPosts(List<PostModel> posts) async {
    await Hive.openBox(_kPosts);
    final box = Hive.box(_kPosts);
    final userId = posts.first.userId;

    if (!box.containsKey(userId)) {
      box.put(userId, posts);
    }
  }

  static Future<List<PostModel>?> getPosts(int userId) async {
    await Hive.openBox(_kPosts);
    final box = Hive.box(_kPosts);

    return box.get(userId)?.toList().cast<PostModel>();
  }

  static Future<void> setPhotos(List<PhotoModel> photos) async {
    await Hive.openBox(_kPhotos);
    final box = Hive.box(_kPhotos);
    final albumId = photos.first.albumId;

    if (!box.containsKey(albumId)) {
      box.put(albumId, photos);
    }
  }

  static Future<List<PhotoModel>?> getPhotos(int albumId) async {
    await Hive.openBox(_kPhotos);
    final box = Hive.box(_kPhotos);

    return box.get(albumId)?.toList().cast<PhotoModel>();
  }

  static Future<void> setComments(List<CommentModel> comments) async {
    await Hive.openBox(_kComments);
    final box = Hive.box(_kComments);
    final postId = comments.first.postId;

    if (!box.containsKey(postId)) {
      box.put(postId, comments);
    }
  }

  static Future<List<CommentModel>?> getComments(int postId) async {
    await Hive.openBox(_kComments);
    final box = Hive.box(_kComments);

    return box.get(postId)?.toList().cast<CommentModel>();
  }

  static Future<void> updateComments(CommentModel? comment) async {
    await Hive.openBox(_kComments);
    final box = Hive.box(_kComments);
    final postId = comment?.postId;

    if (comment != null) {
      List<CommentModel> comments = await getComments(postId!) ?? [];
      comments.add(comment);

      box.put(postId, comments);
    }
  }
}
