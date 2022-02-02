import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CoinSpinVideoWidgetTemp extends StatefulWidget {
  const CoinSpinVideoWidgetTemp();

  @override
  _CoinSpinVideoWidgetTempState createState() =>
      _CoinSpinVideoWidgetTempState();
}

class _CoinSpinVideoWidgetTempState extends State<CoinSpinVideoWidgetTemp> {
  late VideoPlayerController _controller;
  static const coinSpinVideoUrl =
      'https://res.cloudinary.com/stack-finance/video/upload/v1642675258/app-assets/v2/coin_spin_video_jy1pnt.mp4';

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  void _initVideoPlayer() async {
    _controller = VideoPlayerController.network(coinSpinVideoUrl);
    await _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    print('aspect ratio: ${_controller.value.aspectRatio}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (_, VideoPlayerValue value, __) {
        if (!value.isInitialized) {
          return const SizedBox.shrink();
        }

        return AspectRatio(
          aspectRatio: value.aspectRatio,
          child: VideoPlayer(_controller),
        );
      },
    );
  }
}
/*
    D/MediaCodecInfo(18019): NoSupport [sizeAndRate.support, 720x894x60.0] [c2.android.avc.decoder, video/avc] [capri, moto g(10) power, motorola, 30]

 */
