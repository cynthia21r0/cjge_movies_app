import 'package:cjge_movies_app/domain/domain.dart';
import 'package:cjge_movies_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosFromMovie extends ConsumerWidget {
  final String movieId;

  const VideosFromMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final moviesFromVideo = ref.watch(videosFromMovieProvider(movieId));

    return moviesFromVideo.when(
      data: (videos) => _VideoList(videos: videos),
      error: (_, _) => Center(child: Text('No se pudo cargar el video')),
      loading: () => Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _VideoList extends StatelessWidget {
  final List<Video> videos;
  const _VideoList({required this.videos});

  @override
  Widget build(BuildContext context) {
    // Si no existen videos
    if (videos.isEmpty) return SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _YouTubeVideoPlayer(
          youtubeId: videos.first.youtubeKey,
          name: videos.first.name,
        ),
      ],
    );
  }
}

class _YouTubeVideoPlayer extends StatefulWidget {
  final String youtubeId;
  final String name;
  const _YouTubeVideoPlayer({required this.youtubeId, required this.name});

  @override
  State<_YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<_YouTubeVideoPlayer> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.youtubeId,
      autoPlay: false,
      params: YoutubePlayerParams(
        enableCaption: true,
        showFullscreenButton: false,
        mute: true,
        showControls: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          YoutubePlayer(
            controller: _controller,
            autoFullScreen: false,
          ),
        ],
      ),
    );
  }
}
