// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profil/video_play_screen.dart';
import 'package:image_picker/image_picker.dart';

import 'components/profil_menu.dart';
import 'components/save_videos.dart';

class AddVideoScreen extends StatefulWidget {
  final List<File>? videos;

  const AddVideoScreen({Key? key, this.videos}) : super(key: key);

  @override
  _AddVideoScreenState createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  final ImagePicker _picker = ImagePicker();

  List<File> _videos = [];
  final List<String> _tags = [];
  final List<String> _descriptions = [];

  @override
  void initState() {
    super.initState();
    _videos = widget.videos ?? [];
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      final tags = await showDialog<List<String>>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add tags'),
            content: TextField(
              decoration: const InputDecoration(
                hintText: 'Add tags separated by comma',
              ),
              onSubmitted: (value) {
                final tags = value.split(',').map((e) => e.trim()).toList();
                Navigator.of(context).pop(tags);
              },
            ),
          );
        },
      );

      // ignore: use_build_context_synchronously
      final description = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add description'),
            content: TextField(
              decoration: const InputDecoration(
                hintText: 'Add description',
              ),
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          );
        },
      );

      if (tags != null && description != null) {
        setState(() {
          
          _videos.add(File(pickedFile.path));
        });
        final videoData = VideoData(tags: tags, description: description);
        await SaveVideos.saveVideo(File(pickedFile.path), videoData);
      }
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

          return Column(
            children: [
              ListTile(
                leading: Image.file(
                  video,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('Video $index'),
                onTap: () {
                  var _listKitKot;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(toktik: _listKitKot.elementAt(index)),
                    ),
                  );
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tags',
                ),
                onChanged: (value) {
                  _tags[index - 1] = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                onChanged: (value) {
                  _descriptions[index - 1] = value;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
