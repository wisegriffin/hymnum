import 'package:flutter/widgets.dart';
import 'package:hymnum/core/application/ports/in/music_usecases.dart';
import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/core/domain/music/out/music_repository.dart';

class MusicViewmodel with ChangeNotifier {
  final MusicUsecases _musicUsecases;

  MusicViewmodel(this._musicUsecases);


  Future<void> updateMusic(
    int id, {
    String? title,
    String? author,
    String? key,
    String? content,
  }) async {
    await _musicRepo.updateMusic(id, title: title, author: author, key:  key, content: content);
    notifyListeners();
  }

  Future<Music?> findById(String id) async {
    Reperto
    return await _musicRepo.findById(id);
  }
}
