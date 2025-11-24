import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class MoviePlayerScreen extends StatefulWidget {
  final String title;
  final List<String> episodes;

  const MoviePlayerScreen({
    super.key,
    required this.title,
    required this.episodes,
  });

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late VideoPlayerController controller;
  bool isFullscreen = false;
  bool showControls = true;
  int selectedEpisode = 0;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset("assets/videoplayback.mp4")
      ..initialize().then((_) {
        setState(() {});
        controller.play();
      });
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void toggleFullscreen() async {
    setState(() => isFullscreen = !isFullscreen);

    if (isFullscreen) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }
  }

  Widget _buildEpisode(String text, bool selected, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedEpisode = index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF5569A3) : const Color(0xFF2E3A59),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.play_arrow, color: Colors.white),
            const SizedBox(width: 10),
            Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final videoHeight =
    isFullscreen ? MediaQuery.of(context).size.height : 350.0;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1723),
      body: Column(
        children: [
          // --------------------------
          // VIDEO AREA
          // --------------------------
          Container(
            color: Colors.black,
            height: videoHeight,
            child: Stack(
              children: [
                // VIDEO + play/pause toggle
                controller.value.isInitialized
                    ? GestureDetector(
                  onTap: () {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                    showControls = !showControls;
                    setState(() {});
                  },
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  ),
                )
                    : const Center(
                    child:
                    CircularProgressIndicator(color: Colors.white)),

                // --------------------------
                // TOP BAR
                // --------------------------
                if (showControls)
                  Positioned(
                    top: 25,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (isFullscreen) {
                                  toggleFullscreen();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.white, size: 28),
                            ),
                            const SizedBox(width: 10),
                            Text(widget.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        GestureDetector(
                          onTap: toggleFullscreen,
                          child: Icon(
                            isFullscreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),

                // --------------------------
                // CENTER CONTROLS
                // --------------------------
                if (showControls)
                  Positioned(
                    bottom: isFullscreen ? 130 : 130,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // BACK 10 SECONDS
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            final pos = controller.value.position -
                                const Duration(seconds: 10);
                            controller.seekTo(
                                pos < Duration.zero ? Duration.zero : pos);
                          },
                          child: const Icon(Icons.replay_10,
                              color: Colors.white, size: 38),
                        ),

                        // STOP (pause only)
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            controller.pause();
                            setState(() {});
                          },
                          child: const Icon(Icons.stop_circle,
                              color: Colors.redAccent, size: 55),
                        ),

                        // FORWARD 10 SECONDS
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            final pos = controller.value.position +
                                const Duration(seconds: 10);
                            final d = controller.value.duration;
                            controller.seekTo(pos < d ? pos : d);
                          },
                          child: const Icon(Icons.forward_10,
                              color: Colors.white, size: 38),
                        ),
                      ],
                    ),
                  ),

                // --------------------------
                // PROGRESS BAR
                // --------------------------
                if (showControls)
                  Positioned(
                    bottom: isFullscreen ? 40 : 40,
                    left: 12,
                    right: 12,
                    child: VideoProgressIndicator(
                      controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Colors.redAccent,
                        backgroundColor: Colors.white30,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // --------------------------
          // EPISODE LIST
          // --------------------------
          if (!isFullscreen)
            Expanded(
              child: Container(
                color: const Color(0xFF162238),
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ListView.builder(
                  itemCount: widget.episodes.length,
                  itemBuilder: (context, index) {
                    return _buildEpisode(widget.episodes[index],
                        index == selectedEpisode, index);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
