import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digilearn/pages/Settings/Settings.dart';
import 'package:digilearn/services/AuthService.dart';
import 'package:digilearn/services/userService.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:digilearn/helpers/SharePref.dart';

class EditProfile extends StatelessWidget {
  static String routeName = "/editProfile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.popAndPushNamed(context, Settings.routeName);
            }),
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
      ),
      body: WillPopScope(
          onWillPop: () async {
            Navigator.popAndPushNamed(context, Settings.routeName);
            return true;
          },
          child: EditProfilePage()),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var _image;
  final picker = ImagePicker();
  bool showPassword = true;
  bool _isUpdating = false;
  String userType = Get.find<UserController>().userModel.value.type;

  final firstname = TextEditingController(
      text: '${Get.find<UserController>().userModel.value.firstname}');
  final lastname = TextEditingController(
      text: '${Get.find<UserController>().userModel.value.lastname}');
  final email = TextEditingController(
      text: '${Get.find<UserController>().userModel.value.email}');
  final details = TextEditingController();
  final String _initials =
      (Get.find<UserController>().userModel.value.firstname[0] +
              Get.find<UserController>().userModel.value.lastname[0])
          .toUpperCase();
  String _avatar = Get.find<UserController>().userModel.value.avatarUrl;
  //final password = TextEditingController(text: '${Get.find<UserController>().userModel.value.f}');

  //Delete profile image
  Future _imageDelete() async {
    setState(() {
      _avatar = null;
      _image = null;
    });
  }

  //Image picker from Camera
  Future _imageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //Image Picker from Gallery
  Future _imageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //On User Update Click
  updateUser() async {
    setState(() {
      _isUpdating = true;
    });

    var _token = await SharePref.getString('token');
    var data = {
      'firstname': firstname.text,
      'lastname': lastname.text,
      'email': email.text,
      'type': userType
    };
    //print(data);

    AuthService authService = new AuthService();
    authService.updateUser(data, _token, _image, _avatar).then((value) {
      //
      setState(() {
        _isUpdating = false;
      });

      Get.put(UserController()).userModel.value.firstname = firstname.text;
      Get.put(UserController()).userModel.value.lastname = lastname.text;
      Get.put(UserController()).userModel.value.type = userType;

      if (_avatar == null) {
        Get.find<UserController>().userModel.value.avatarUrl = null;
      }

      final snackBar = SnackBar(content: Text('Profile updated succesfully'));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  //Circle avatar Profile Phpte
  profilePhoto() {
    if (_image == null) {
      if (_avatar == null) {
        return null;
      } else {
        return CachedNetworkImageProvider(_avatar);
      }
    } else {
      return FileImage(File(_image.path));
    }
  }

  //Circle avatar text
  profileText() {
    if (_image == null) {
      if (_avatar == null) {
        return Text('$_initials', style: TextStyle(fontSize: 60));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: profilePhoto(),
                    child: profileText(),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor)),
                          child: Icon(Icons.photo_camera, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 35),
            buildTextField('First Name', false, firstname, 1),
            buildTextField('Last Name', false, lastname, 1),
            buildTextField('Email', false, email, 1),
            Row(
              children: [
                Radio(
                    value: 'student',
                    groupValue: userType,
                    onChanged: (val) {
                      userType = val;
                      setState(() {});
                    }),
                Text('Student'),
                SizedBox(width: 20),
                Radio(
                    value: 'teacher',
                    groupValue: userType,
                    onChanged: (val) {
                      userType = val;
                      setState(() {});
                    }),
                Text('Teacher')
              ],
            ),
            SizedBox(height: 20),
            buildTextField('About Me', false, details, 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Save Button
                DZButton(
                  buttonText: 'Update',
                  onClick: () {
                    updateUser();
                  },
                  updating: _isUpdating,
                )
              ],
            ),
            //Text('${Get.find<UserController>().userModel.value.firstname}'),
            //Text('${Get.find<UserController>().userModel.value.lastname}')
          ],
        ),
      ),
    );
  }

  //Image Picker dialog
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  children: [
                    Text('Profile Photo',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: primaryColor),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _imageDelete();
                                    Navigator.of(context).pop();
                                  }),
                            ),
                            Text('Remove'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: primaryColor),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _imageFromCamera();
                                    Navigator.of(context).pop();
                                  }),
                            ),
                            Text('Camera'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: primaryColor),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.photo_library,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _imageFromGallery();
                                    Navigator.of(context).pop();
                                  }),
                            ),
                            Text('Gallery'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget buildTextField(String label, bool isPassword,
      TextEditingController controller, int maxLine) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        //minLines: 10,

        maxLines: maxLine,
        controller: controller,
        obscureText: isPassword ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : null,
            //contentPadding: EdgeInsets.all(3),
            border: InputBorder.none,
            labelText: label,
            //floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
