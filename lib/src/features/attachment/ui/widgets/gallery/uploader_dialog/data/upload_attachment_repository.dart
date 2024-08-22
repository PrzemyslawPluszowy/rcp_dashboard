import 'package:dio/dio.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:retrofit/retrofit.dart';

part 'upload_attachment_repository.g.dart';

@RestApi()
// ignore: one_member_abstracts
abstract class UploadAttachmentRepository {
  factory UploadAttachmentRepository(Dio dio, {String baseUrl}) =
      _UploadAttachmentRepository;

  @POST('/admin/uploadImage')
  @MultiPart()
  Future<ImageModel> uploadImage({
    @MultiPart() required MultipartFile file,
    @Part() required String name,
    @Part() required String description,
    @Part() required String alt,
  });
}
