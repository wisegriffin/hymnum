import 'package:hymnum/core/domain/music/music.dart';
import 'package:hymnum/shared/events/domain_event.dart';

class MusicRemoved extends DomainEvent {
  final Music music;

  MusicRemoved(this.music, {DateTime? occurredAt})
    : super(occurredAt ?? DateTime.now());

  @override
  String get eventType => "music.removed";
}
