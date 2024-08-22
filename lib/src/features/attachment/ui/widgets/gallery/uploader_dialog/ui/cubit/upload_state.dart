part of 'upload_cubit.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.initial() = _Initial;
  const factory UploadState.uploading({
    required int totalParts,
    required int currentPart,
  }) = _Uploading;
  const factory UploadState.uploaded() = _Uploaded;
  const factory UploadState.error(String message) = _Error;
}
