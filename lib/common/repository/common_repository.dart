import 'package:eclipse_test/data/models/album_model.dart';
import 'package:eclipse_test/data/models/comment_model.dart';
import 'package:eclipse_test/data/models/photo_model.dart';
import 'package:eclipse_test/data/models/post_model.dart';
import 'package:eclipse_test/data/models/user_model.dart';
import 'package:either_dart/either.dart';

abstract class CommonRepository {
  Future<Either<List<UserModel>, Exception>> getUsers();

  Future<Either<List<PostModel>, Exception>> getPostsByUserID(
      {required int userId});

  Future<Either<List<AlbumModel>, Exception>> getAlbumsByUserID(
      {required int userId});

  Future<Either<List<PhotoModel>, Exception>> getPhotosByAlbumID(
      {required int albumId});

/*  Future<Either<List<PhotoModel>, Exception>> getPhotosByUserID(
      {required int userId});*/

  Future<Either<List<CommentModel>, Exception>> getCommentsByPostID(
      {required int postId});

  Future<Either<CommentModel, Exception>> postComment({
    required CommentModel comment,
  });
}
