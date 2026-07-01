import 'package:cjge_movies_app/domain/domain.dart';
import 'package:cjge_movies_app/infrastructure/models/moviedb/moviedb_videos_response.dart';

class VideoMapper {
  static Video movieDbVideoToEntity ( Result video ) => Video(
    id: video.id,
    name: video.name,
    youtubeKey: video.key,
    publishedAt: video.publishedAt
  );
}