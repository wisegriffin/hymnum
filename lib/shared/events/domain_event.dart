abstract class DomainEvent {
  final DateTime occurredAt;

  DomainEvent(this.occurredAt);

  String get eventType;
  
}