import 'package:flutter_mockup_discord/channel.dart';

List<Channel> channels = [
  Channel(name: "TEXT CHANNELS", groups: [
    ChannelGroup(name: "general-coding-talk"),
    ChannelGroup(name: "fcc-meetups"),
    ChannelGroup(name: "iot-love"),
    ChannelGroup(name: "random"),
    ChannelGroup(name: "coding-resources"),
    ChannelGroup(name: "startup-scene"),
    ChannelGroup(name: "hackathon-scene"),
    ChannelGroup(name: "job-board"),
  ]),
  Channel(name: "TIME WASTERS",groups: [
    ChannelGroup(name: "chat-games"),
  ]),
  Channel(name: "VOICE CHANNELS",groups: [
    ChannelGroup(name: "General Coding Discussion"),
    ChannelGroup(name: "fccManila Radio"),
  ]),
];
