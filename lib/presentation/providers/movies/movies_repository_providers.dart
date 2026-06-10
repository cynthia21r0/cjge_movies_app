import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cjge_movies_app/infrastructure/infrastructure.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDatasourceImpl() );
});