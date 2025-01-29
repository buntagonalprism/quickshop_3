import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';

// ignore: subtype_of_sealed_class
class MockCollectionReference extends Mock implements CollectionReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockDocumentReference extends Mock implements DocumentReference<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock implements QuerySnapshot<Map<String, dynamic>> {
  MockQuerySnapshot(this.mockSnapshotDocs) {
    when(() => docs).thenReturn(mockSnapshotDocs);
  }

  final List<MockDocumentSnapshot> mockSnapshotDocs;
}

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements QueryDocumentSnapshot<Map<String, dynamic>> {
  MockDocumentSnapshot(this.mockId, this.mockData) {
    when(() => id).thenReturn(mockId);
    when(() => data()).thenReturn(mockData);
  }

  final String mockId;
  final Map<String, dynamic> mockData;
}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockBatch extends Mock implements WriteBatch {}
