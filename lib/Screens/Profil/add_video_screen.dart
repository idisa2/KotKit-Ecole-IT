// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profil/video_play_screen.dart';
import 'package:image_picker/image_picker.dart';

import 'components/profil_menu.dart';


class AddVideoScreen extends StatefulWidget {
  final List<File>? videos;

  const AddVideoScreen({Key? key, this.videos}) : super(key: key);

  @override
  _AddVideoScreenState createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  final ImagePicker _picker = ImagePicker();

  List<File> _videos = [];

  @override
  void initState() {
    super.initState();
    _videos = widget.videos ?? [];
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videos.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Videos'),
        actions: const [
          ProfileMenu(),
  
            ],
      ),
      body: ListView.builder(
        itemCount: _videos.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Video'),
              onTap: _pickVideo,
            );
          }

          final video = _videos[index - 1];

          return ListTile(
            leading: Image.file(
              video,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text('Video $index'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(video: video),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
