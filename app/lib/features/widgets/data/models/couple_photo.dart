import 'package:equatable/equatable.dart';

/// The photo a couple chose for the couple-photos widget.
final class const CouplePhoto({
  required final String coupleId,
  required final String storagePath,
  required final String uploadedBy,
  required final DateTime updatedAt,
  final String? url,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => CouplePhoto(
    coupleId: '00000000-0000-0000-0000-000000000000',
    storagePath: '00000000-0000-0000-0000-000000000000/fake.jpg',
    uploadedBy: '00000000-0000-0000-0000-000000000000',
    updatedAt: DateTime(2026, 11, 11),
  );

  CouplePhoto copyWith({String? url}) => CouplePhoto(
    coupleId: coupleId,
    storagePath: storagePath,
    uploadedBy: uploadedBy,
    updatedAt: updatedAt,
    url: url ?? this.url,
  );

  @override
  List<Object?> get props => [coupleId, storagePath, uploadedBy, updatedAt, url];
}
