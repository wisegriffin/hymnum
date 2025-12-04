import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/core/domain/repertoire/events/music_added.dart';
import 'package:hymnum/core/domain/repertoire/events/music_removed.dart';
import 'package:hymnum/core/domain/repertoire/repertoire_snapshot.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_id.dart';
import 'package:hymnum/core/domain/repertoire/value_objects/repertoire_name.dart';
import 'package:hymnum/shared/events/domain_event.dart';

class Repertoire {
  final RepertoireId _localId;
  RepertoireName _name;
  final List<Music> _musics;
  final List<DomainEvent> _domainEvents = [];

  Repertoire._(this._localId, this._name, this._musics);

  RepertoireId get localId => _localId;

  static Repertoire create({
    required String name,
    RepertoireId? localId,
    List<Music>? musics,
  }) {
    return Repertoire._(
      localId ?? RepertoireId.generate(),
      RepertoireName.create(name),
      musics ?? [],
    );
  }

  void rename(RepertoireName newName) {
    _name = newName;
  }

  void addMusic(Music music) {
    _musics.add(music);
    _domainEvents.add(MusicAdded(music));
  }

  void removeMusic(Music music) {
    _musics.remove(music);
    _domainEvents.add(MusicRemoved(music));
  }

  RepertoireSnapshot snapshot() {
    return RepertoireSnapshot(
      _localId.value,
      _name.value,
      _musics.map((e) => e.snapshot()).toList(),
    );
  }
}
