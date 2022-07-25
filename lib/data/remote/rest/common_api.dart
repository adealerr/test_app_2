import 'package:eclipse_test/data/models/album_model.dart';
import 'package:eclipse_test/data/models/comment_model.dart';
import 'package:eclipse_test/data/models/photo_model.dart';
import 'package:eclipse_test/data/models/post_model.dart';
import 'package:eclipse_test/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'common_api.g.dart';

@RestApi()
abstract class CommonApi {
  factory CommonApi(Dio dio, {String baseUrl}) = _CommonApi;

  @GET('users')
  Future<List<UserModel>?> getUsers();

  @GET('posts')
  Future<List<PostModel>?> getPostsByUserID(@Query('userId') int userId);

  @GET('albums')
  Future<List<AlbumModel>?> getAlbumsByUserID(@Query('userId') int userId);

  @GET('photos')
  Future<List<PhotoModel>?> getPhotosByAlbumID(@Query('albumId') int albumId);

  // @GET('photos')
  // Future<List<PhotoModel>?> getPhotosByUserID(@Query('userId') int userId);

  @GET('comments')
  Future<List<CommentModel>?> getCommentsByPostID(@Query('postId') int postId);

  @POST('posts')
  Future<CommentModel?> postComment(@Body() CommentModel comment);
}
