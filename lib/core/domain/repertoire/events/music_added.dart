import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/shared/events/domain_event.dart';

class MusicAdded extends DomainEvent {
  final Music music;

  MusicAdded(this.music, {DateTime? occurredAt})
    : super(occurredAt ?? DateTime.now());

  @override
  String get eventType => "music.added";
}
