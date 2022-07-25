import 'package:eclipse_test/common/repository/common_repository.dart';
import 'package:eclipse_test/data/local/hive_helper.dart';
import 'package:eclipse_test/data/models/album_model.dart';
import 'package:eclipse_test/data/models/comment_model.dart';
import 'package:eclipse_test/data/models/photo_model.dart';
import 'package:eclipse_test/data/models/post_model.dart';
import 'package:eclipse_test/data/models/user_model.dart';
import 'package:eclipse_test/data/remote/rest/common_api.dart';
import 'package:either_dart/src/either.dart';

class CommonRepositoryImpl extends CommonRepository {
  final CommonApi _commonApi;

  CommonRepositoryImpl({
    required CommonApi commonApi,
  }) : _commonApi = commonApi;

  @override
  Future<Either<List<AlbumModel>, Exception>> getAlbumsByUserID(
      {required int userId}) async {
    try {
      final albums = await HiveHelper.getAlbums(userId);
      if (albums != null && albums.isNotEmpty) {
        return Left(albums);
      } else {
        final resp = await _commonApi.getAlbumsByUserID(userId);
        if (resp != null) {
          await HiveHelper.setAlbums(resp);
          return Left(resp);
        }
        return Right(Exception());
      }
    } catch (e) {
      return Right(Exception());
    }
  }

  @override
  Future<Either<List<CommentModel>, Exception>> getCommentsByPostID(
      {required int postId}) async {
    try {
      final comments = await HiveHelper.getComments(postId);
      if (comments != null && comments.isNotEmpty) {
        return Left(comments);
      } else {
        final resp = await _commonApi.getCommentsByPostID(postId);
        if (resp != null) {
          await HiveHelper.setComments(resp);
          return Left(resp);
        }
        return Right(Exception());
      }
    } catch (e) {
      return Right(Exception());
    }
  }

  @override
  Future<Either<List<PostModel>, Exception>> getPostsByUserID(
      {required int userId}) async {
    try {
      final posts = await HiveHelper.getPosts(userId);
      if (posts != null && posts.isNotEmpty) {
        return Left(posts);
      } else {
        final resp = await _commonApi.getPostsByUserID(userId);
        if (resp != null) {
          await HiveHelper.setPosts(resp);
          return Left(resp);
        }
        return Right(Exception());
      }
    } catch (e) {
      return Right(Exception());
    }
  }

  @override
  Future<Either<List<UserModel>, Exception>> getUsers() async {
    try {
      final users = await HiveHelper.getUsers();
      if (users != null && users.isNotEmpty) {
        return Left(users);
      } else {
        final resp = await _commonApi.getUsers();
        if (resp != null) {
          await HiveHelper.setUsers(resp);
          return Left(resp);
        }
        return Right(Exception());
      }
    } catch (e) {
      return Right(Exception());
    }
  }

  @override
  Future<Either<CommentModel, Exception>> postComment(
      {required CommentModel comment}) async {
    try {
      final resp = await _commonApi.postComment(comment);
      if (resp != null) {
        await HiveHelper.updateComments(resp);
        return Left(resp);
      }
      return Right(Exception());
    } catch (e) {
      return Right(Exception());
    }
  }

  /*@override
  Future<Either<List<PhotoModel>, Exception>> getPhotosByUserID(
      {required int userId}) async {
    try {
      final users = await HiveHelper.getPhotos(userId);
      if (users != null && users.isNotEmpty) {
        return Left(users);
      } else {
        final resp = await _commonApi.getPhotosByUserID(userId);
        if (resp != null) {
          await HiveHelper.setPhotos(photos: resp, userId: userId);
          return Left(resp);
        }
        return Right(Exception());
      }
    } catch (e) {
      return Right(Exception());
    }
  }*/

  @override
  Future<Either<List<PhotoModel>, Exception>> getPhotosByAlbumID(
      {required int albumId}) async {
    try {
      final users = await HiveHelper.getPhotos(albumId);
      if (users != null && users.isNotEmpty) {
        return Left(users);
      } else {
        final resp = await _commonApi.getPhotosByAlbumID(albumId);
        if (resp != null) {
          await HiveHelper.setPhotos(resp);
          return Left(resp);
        }
        return Right(Exception());
      }
    } catch (e) {
      return Right(Exception());
    }
  }
}
