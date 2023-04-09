import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class VideoData {
  final List<String> tags;
  final String description;

  VideoData({required this.tags, required this.description});

  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
      'description': description,
    };
  }
}

class SaveVideos {
  static Future<void> saveVideo(File video, VideoData videoData) async {
    final videoDir = await getVideosDirectory();
    final videoPath = '${videoDir.path}/${DateTime.now().toString()}.mp4';
    final videoFile = await video.copy(videoPath);

    final videoDataDir = await getVideoDataDirectory();
    final videoDataPath =
        '${videoDataDir.path}/${DateTime.now().toString()}.json';
    final videoDataFile = await File(videoDataPath).create();

    final jsonMap = videoData.toJson();
    final jsonString = json.encode(jsonMap);
    await videoDataFile.writeAsString(jsonString);

    print('Video saved to: ${videoFile.path}');
    print('Video data saved to: ${videoDataFile.path}');
  }

  static Future<Directory> getVideosDirectory() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final videosDir = Directory('${appDocDir.path}/videos');
    if (!await videosDir.exists()) {
      await videosDir.create(recursive: true);
    }
    return videosDir;
  }

  static Future<Directory> getVideoDataDirectory() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final videoDataDir = Directory('${appDocDir.path}/video_data');
    if (!await videoDataDir.exists()) {
      await videoDataDir.create(recursive: true);
    }
    return videoDataDir;
  }
}
