import 'package:hymnum/core/domain/music/value_objects/music_content.dart';

import 'value_objects/music_author.dart';
import 'value_objects/music_id.dart';
import 'value_objects/music_key.dart';
import 'value_objects/music_title.dart';

class Music {
  final MusicId _localId;
  MusicId? _remoteId;
  MusicTitle _title;
  MusicAuthor _author;
  MusicContent _content;
  MusicKey _key;

  Music._(this._localId, this._title, this._author, this._content, this._key);

  MusicId get localId => _localId;

  static Music create({
    required String title,
    String? author,
    String? content,
    String? key,
  }) {
    return Music._(
      MusicId.generate(),
      MusicTitle.create(title),
      MusicAuthor.create(author),
      MusicContent.create(content),
      MusicKey.create(key: key),
    );
  }

  MusicSnapshot snapshot() {
    return MusicSnapshot(_localId.value, _remoteId?.value, _title.value, _author.value, _content.value, _key.value);
  }

  Music rename(MusicTitle title) {
    _title = title;
    return this;
  }

  Music changeAuthor(MusicAuthor author) {
    _author = author;
    return this;
  }

  Music changeKey(MusicKey key) {
    _key = key;
    return this;
  }

  Music setRemoteId(MusicId id) {
    _remoteId ??= id;
    return this;
  }
}

class MusicSnapshot {
  final String localId;
  final String? remoteId;
  final String title;
  final String? author;
  final String? content;
  final String key;

  MusicSnapshot(
    this.localId,
    this.remoteId,
    this.title,
    this.author,
    this.content,
    this.key,
  );
}
