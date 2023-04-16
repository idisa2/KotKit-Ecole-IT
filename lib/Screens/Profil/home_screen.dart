<<<<<<< HEAD
// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profil/video_play_screen.dart';
import 'package:flutter_auth/services/web_services.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/KotKit.dart';
import 'components/profil_menu.dart';
import 'new_kotki.dart';


class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
bool _loading = true;
  List<KotKit> _listKitKot = [];

  Future<void>_loadData()async{
    List<KotKit> l = await WebService().getKotKit();
    setState(() {
      _listKitKot = l;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        // _listKitKot.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          ProfileMenu(),
  
            ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewKotKit(),
            ),
          );
          },
        label: const Text('Add Kotkit'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      body: _loading?

      Center(
        child: CircularProgressIndicator(),
      )
          :
      _listKitKot.isEmpty?
          Center(
            child: Text("Aucune video trouvee"),
          )
      :
      ListView.builder(
        itemCount: _listKitKot.length,
        itemBuilder: (context, index) {
          /*
          if (index == 0) {
            return ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Video'),
              onTap: _pickVideo,
            );
          }
*/


          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Container(
                width: 90,
                height: 90,
                child: Image.network(
                  _listKitKot.elementAt(index).image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(_listKitKot.elementAt(index).title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(toktik: _listKitKot.elementAt(index)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
=======
// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profil/video_play_screen.dart';
import 'package:flutter_auth/services/web_services.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/KotKit.dart';
import 'components/profil_menu.dart';
import 'new_kotki.dart';


class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
bool _loading = true;
  List<KotKit> _listKitKot = [];

  Future<void>_loadData()async{
    List<KotKit> l = await WebService().getKotKit();
    setState(() {
      _listKitKot = l;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        // _listKitKot.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          ProfileMenu(),
  
            ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewKotKit(),
            ),
          );
          },
        label: const Text('Add Kotkit'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      body: _loading?

      Center(
        child: CircularProgressIndicator(),
      )
          :
      _listKitKot.isEmpty?
          Center(
            child: Text("Aucune video trouvee"),
          )
      :
      ListView.builder(
        itemCount: _listKitKot.length,
        itemBuilder: (context, index) {
          /*
          if (index == 0) {
            return ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Video'),
              onTap: _pickVideo,
            );
          }
*/


          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Container(
                width: 90,
                height: 90,
                child: Image.network(
                  _listKitKot.elementAt(index).image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(_listKitKot.elementAt(index).title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(toktik: _listKitKot.elementAt(index)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
>>>>>>> main
