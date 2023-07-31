import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamlivr/src/screens/create_channel/create_channel.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/my_channel_screen.dart';

class ChannelWrapper extends StatelessWidget {
  const ChannelWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('channels')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.exists) {
                return const MyChannelScreen();
              } else {
                return const CreateChannel();
              }
            } else {
              return const CreateChannel();
            }
          }),
    );
  }
}
