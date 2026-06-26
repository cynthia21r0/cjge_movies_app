import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cjge_movies_app/infrastructure/infrastructure.dart';

final actorsRepositoryProvider = Provider((ref) { 
    return MovieRepositoryImpl( MoviedbDatasourceImpl() );
});
