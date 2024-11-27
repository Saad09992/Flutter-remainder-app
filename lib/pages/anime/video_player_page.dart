import 'dart:async';

import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  AnimeController _animeController = Get.find();
  bool _isFullScreen = false;
  bool _isPlaying = false;
  bool _showControls = false;
  Timer? _controlsTimer;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  // Initialize the video player with the selected quality
  void _initializeVideoPlayer() async {
    String url = _animeController.getUrlForSelectedQuality();

    if (_controller != null) {
      await _controller!.dispose();
    }

    VideoPlayerController controller = VideoPlayerController.network(url);
    try {
      await controller.initialize();
      setState(() {
        _controller = controller;
        _isPlaying = true;
      });
      controller.play();

      // Add listener for video completion
      controller.addListener(_videoPlayerListener);
    } catch (e) {
      print("Error loading video: $e");
    }
  }

  // Video player listener to handle end of video
  void _videoPlayerListener() {
    if (_controller != null && _controller!.value.position >= _controller!.value.duration) {
      setState(() {
        _isPlaying = false;
      });
    }
  }

  // Toggle play/pause
  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller?.pause();
      } else {
        _controller?.play();
      }
      _isPlaying = !_isPlaying;
      _showControlsTemporarily();
    });
  }

  // Show controls temporarily
  void _showControlsTemporarily() {
    setState(() {
      _showControls = true;
    });

    // Cancel previous timer if exists
    _controlsTimer?.cancel();

    // Hide controls after 3 seconds
    _controlsTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  // Toggle fullscreen mode
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    // Handle screen orientation
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _showControlsTemporarily,
        child: Container(
          color: Colors.black,
          child: Center(
            child: AspectRatio(
              aspectRatio: _controller != null ? _controller!.value.aspectRatio : 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Video Player
                  _controller != null && _controller!.value.isInitialized
                      ? VideoPlayer(_controller!)
                      : Center(child: CircularProgressIndicator()),

                  // Overlay Controls
                  if (_showControls || !_isFullScreen)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Quality Dropdown (only in non-fullscreen)
                            if (!_isFullScreen)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black87,
                                  value: _animeController.selectedQuality,
                                  items: ['360p', '480p', '720p']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      _animeController.selectQuality(newValue);
                                      _initializeVideoPlayer();
                                    }
                                  },
                                ),
                              ),

                            // Play/Pause and Fullscreen Controls
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 64,
                                  icon: Icon(
                                    _isPlaying ? Icons.pause_circle : Icons.play_circle,
                                    color: Colors.white,
                                  ),
                                  onPressed: _togglePlayPause,
                                ),
                                IconButton(
                                  iconSize: 64,
                                  icon: Icon(
                                    _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                                    color: Colors.white,
                                  ),
                                  onPressed: _toggleFullScreen,
                                ),
                              ],
                            ),

                            // Video Progress Indicator
                            if (_controller != null)
                              VideoProgressIndicator(
                                _controller!,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  playedColor: Colors.red,
                                  bufferedColor: Colors.grey,
                                  backgroundColor: Colors.white24,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controlsTimer?.cancel();
    _controller?.removeListener(_videoPlayerListener);
    _controller?.dispose();
    // Reset system UI and orientation
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}