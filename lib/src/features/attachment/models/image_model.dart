import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  factory ImageModel({
    required int id,
    required String url,
    required String name,
    required String fileName,
    required String description,
    required String createdAt,
    required String updatedAt,
    required String thumbnailUrl,
    ImageSeo? seo,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

@freezed
class ImageSeo with _$ImageSeo {
  factory ImageSeo({
    String? alt,
    String? title,
    String? description,
  }) = _ImageSeo;

  factory ImageSeo.fromJson(Map<String, dynamic> json) =>
      _$ImageSeoFromJson(json);
}
