import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:retrofit/retrofit.dart';

part 'gallery_repository.g.dart';

@RestApi()
abstract class GalleryRepository {
  factory GalleryRepository(Dio dio, {String baseUrl}) = _GalleryRepository;

  @GET('/admin/fetchImages')
  Future<List<ImageModel>> fetchImages(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @POST('/admin/uploadImage')
  @MultiPart()
  Future<ImageModel> uploadImage(
    @Part() File file,
    @Part() String name,
    @Part() String description,
    @Part() String alt,
  );

  @PUT('/admin/updateImage/{id}')
  Future<ImageModel> updateImage(
    @Path('id') int id,
    @Part() String name,
    @Part() String description,
    @Part() String alt,
  );

  @DELETE('/admin/deleteImage/{id}')
  Future<void> removeImage(@Path('id') int id);
}
