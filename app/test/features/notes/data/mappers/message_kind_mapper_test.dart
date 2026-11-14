import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/notes/data/mappers/message_kind_mapper.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a drawing is a drawing', () {
    expect(EnumPartnerMessageKind.drawing.toModel(), MessageKind.drawing);
  });

  test('every other kind is shown as a note', () {
    expect(EnumPartnerMessageKind.note.toModel(), MessageKind.note);
    expect(EnumPartnerMessageKind.voice.toModel(), MessageKind.note);
    expect(EnumPartnerMessageKind.pack.toModel(), MessageKind.note);
    expect(EnumPartnerMessageKind.$unknown.toModel(), MessageKind.note);
  });
}
