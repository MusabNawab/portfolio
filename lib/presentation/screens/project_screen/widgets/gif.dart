import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:video_player/video_player.dart';

class Giif extends StatefulWidget {
  const Giif({super.key, required this.assetName});

  final String assetName;

  @override
  State<Giif> createState() => _GiifState();
}

class _GiifState extends State<Giif> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetName);
    _controller.initialize().then((value) {
      _controller.setVolume(0);
      _controller.play();

      _controller.setLooping(true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: Devices.android.samsungGalaxyA50,
      screen: VideoPlayer(_controller),
    );
  }
}
