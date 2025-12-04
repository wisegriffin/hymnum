import 'package:hymnum/core/application/ports/in/music_usecases.dart';
import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/core/domain/music/out/music_repository.dart';

class MusicService implements MusicUsecases {
  final MusicRepository _repository;

  MusicService(this._repository);
  
  @override
  Future<void> delete(Music music) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> save(Music music) {
    // TODO: implement save
    throw UnimplementedError();
  }
  
  @override
  Future<List<Music>> fetchAll() {
    // TODO: implement fetchAll
    throw UnimplementedError();
  }
  
  @override
  Future<List<Music>> find(criteria) {
    // TODO: implement find
    throw UnimplementedError();
  }

  
}