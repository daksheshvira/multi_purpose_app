import 'package:flutter/foundation.dart';
import 'package:multi_purpose_app/data/common_repo.dart';
import 'package:multi_purpose_app/data/models/album.dart';
import 'package:multi_purpose_app/data/models/photo.dart';

class AlbumNotifier extends ChangeNotifier {
  final repo = CommonRepo();
  List<Album> albums = [];

  Future<String> getAlbums() async {
    try {
      albums = await repo.getAlbums();
      notifyListeners();
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Photo>> getAlbumsPhotos(int id) async {
    try {
      var photos = await repo.getAlbumPhotos(id);
      return photos;
    } catch (e) {
      return [];
    }
  }
}
