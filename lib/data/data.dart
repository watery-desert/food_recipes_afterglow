import 'json_data.dart';
import 'dart:async';

class DataLayer {
  StreamController<List<Map<String, dynamic>>> moviesData = StreamController();

  DataLayer() {
    moviesData.add(jsonData);
  }

  Stream<List<Map<String, dynamic>>> getData() => moviesData.stream;
}
