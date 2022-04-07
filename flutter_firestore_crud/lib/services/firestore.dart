// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _collectionReference;

  FirestoreApi(String collectionPath) {
    _collectionReference = _firestore.collection(collectionPath);
  }

  Stream<QuerySnapshot> streamCollection() {
    return _collectionReference.snapshots();
  }

  Future<QuerySnapshot> getCollection() {
    return _collectionReference.get();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return _collectionReference.doc(id).get();
  }

  Future<DocumentReference> addDocument(Map data) {
    return _collectionReference.add(data);
  }

  Future<DocumentReference?> updateDocument(String? id, Map data) {
    return _collectionReference.doc(id).set(data).then((value) => value as DocumentReference<Object>?);
  }

  Future<void> deleteDocument(String? id) {
    return _collectionReference.doc(id).delete();
  }
}
