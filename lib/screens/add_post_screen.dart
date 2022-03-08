import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instragram_clone/providers/user_provider.dart';
import 'package:instragram_clone/utils/colors.dart';
import 'package:instragram_clone/utils/utis.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage( String uid, String username, String profImage) async{
     try{

     }
     catch(e){

     }


  }


  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose(){
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context)
  {

    final User user = Provider.of<UserProvider>(context).getUser;

    return  _file == null? Center(
      child: IconButton(
        icon: Icon(Icons.upload),
        onPressed: () => _selectImage(context),
      ),
    ): Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
        ),
        title: Text('Post to'),
        centerTitle: false,
        actions: [
         TextButton(onPressed: postImage, child: Text('Post',style: TextStyle(
           color: Colors.blueAccent,
           fontWeight: FontWeight.bold,
           fontSize: 16,
         ),))
        ],

      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.45,
                child:  TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration:  BoxDecoration(
                     image: DecorationImage(
                       image: MemoryImage(_file!),
                       fit: BoxFit.fill,
                       alignment: FractionalOffset.topCenter,
                     )
                    ),
                  ),
                ),

              ),
              Divider(),
            ],
          )
        ],
      ),
    );
  }
}
