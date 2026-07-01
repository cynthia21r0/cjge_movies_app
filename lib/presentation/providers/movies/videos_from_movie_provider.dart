import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cjge_movies_app/presentation/providers/providers.dart';

final videosFromMovieProvider 
  = FutureProvider.family((ref, String movieId) async {
    final movierepositoryProvider = ref.watch(movieRepositoryProvider);
    return movierepositoryProvider.getYoutubeVideoById(movieId);
});
