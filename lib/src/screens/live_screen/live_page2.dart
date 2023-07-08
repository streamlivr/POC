import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivePage2 extends StatefulWidget {
  final bool isHost;
  final String userId;
  final String liveID;
  final String userName;
  const LivePage2(
      {Key? key,
      required this.isHost,
      required this.userId,
      required this.liveID,
      required this.userName})
      : super(key: key);

  @override
  State<LivePage2> createState() => _LivePage2State();
}

class _LivePage2State extends State<LivePage2> {
  var controller = ZegoUIKitPrebuiltLiveStreamingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(
          //     'assets/images/pexels.png',
          //   ),
          //   fit: BoxFit.fill,
          // ),
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ZegoUIKitPrebuiltLiveStreaming(
            controller: controller,
            appID:
                1720095975, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
            appSign:
                '90dbade8b2bb4155feec5f0d2ffdd5b8ad6742386fea19ccd62d419e8784dbff', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
            userID: widget.userId,

            userName: widget.userName,
            liveID: widget.liveID,
            config: widget.isHost
                ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
                : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
          ),
        ),
      ),
    );
  }
}
