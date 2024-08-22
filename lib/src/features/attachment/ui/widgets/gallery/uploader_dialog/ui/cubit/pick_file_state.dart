part of 'pick_file_cubit.dart';

@freezed
class PickFileState with _$PickFileState {
  const factory PickFileState.initial() = _Initial;
  const factory PickFileState.loading() = _Loading;
  const factory PickFileState.loaded(List<PlatformFile> files) = _Loaded;
  const factory PickFileState.error(String message) = _Error;
}
