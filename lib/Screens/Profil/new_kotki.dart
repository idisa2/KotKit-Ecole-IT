import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/models/KotKit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/web_services.dart';
import '../../utils/utils.dart';
import 'home_screen.dart';
class NewKotKit extends StatefulWidget {
  const NewKotKit({Key? key}) : super(key: key);

  @override
  State<NewKotKit> createState() => _NewKotKitState();
}

class _NewKotKitState extends State<NewKotKit> {
  final ImagePicker _picker = ImagePicker();

  TextEditingController  _titleController =TextEditingController();
  TextEditingController  _descriptionController =TextEditingController();
  TextEditingController  _tagsController =TextEditingController();

  File? _pickedImage;
  File? _pickedVideo;

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedVideo = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Container(
                height: 220,
                width: double.infinity,
                // width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        color: Colors.white38,
                        child: InkWell(
                          child: Center(
                            child: Icon(Icons.image),
                          ),
                          onTap: ()async{
                            await _pickImage();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white38,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: InkWell(
                          child: Center(
                            child: Icon(Icons.video_call),
                          ),
                          onTap: ()async{
                            await _pickVideo();
                          },
                        ),
                      ),
                    ),
                  ],
                )
            ),

            Container(
                height: 50,
                width: double.infinity,
                // width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _pickedImage == null? "": _pickedImage!.path.split("/").last,
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        _pickedVideo == null? "": _pickedVideo!.path.split("/").last,
                        style: TextStyle(
                            fontSize: 12
                        ),

                      ),
                    ),
                  ],
                )
            ),


            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: _titleController,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Title",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height: 20,),

            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 6,
              textInputAction: TextInputAction.next,
              controller: _descriptionController,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Description",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _tagsController,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Tags",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height: 20,),

            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () async{
                  if(_pickedImage== null){
                    Fluttertoast.showToast(msg: "Veuillez selectionner l'image");
                    return;
                  }

                  if(_pickedVideo== null){
                    Fluttertoast.showToast(msg: "Veuillez selectionner lavideo");
                    return;
                  }

                  if(_titleController.text.isEmpty){
                    Fluttertoast.showToast(msg: "Veuillez saissir le titre");
                    return;
                  }

                  if(_tagsController.text.isEmpty){
                    Fluttertoast.showToast(msg: "Veuillez saissir les tags");
                    return;
                  }

                  if(_descriptionController.text.isEmpty){
                    Fluttertoast.showToast(msg: "Veuillez saissir la description");
                    return;
                  }

                  KotKit tok = KotKit(description: _descriptionController.text, image: _pickedImage!.path, tags: _tagsController.text, title: _titleController.text, video: _pickedVideo!.path);

                  Utils().loadingDialog(context, msg: "Sauvegarde des donnees en cours!");
                  WebService().createKotKit(tok).then((value) async {
                    Navigator.of(context).pop();
                    if(value == null){
                      Fluttertoast.showToast(msg: "Erreur impossible d'enregistrer les donnees", toastLength: Toast.LENGTH_LONG);
                    }
                    else{

                      Fluttertoast.showToast(msg: "Félicitations, vidéo postée!", toastLength: Toast.LENGTH_LONG);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  HomeScreen()), (Route<dynamic> route) => false);
                    }
                  });

                },
                child: Text(
                  "Save".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );


  }
}
