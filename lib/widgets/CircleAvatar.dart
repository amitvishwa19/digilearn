import 'package:cached_network_image/cached_network_image.dart';
import 'package:digilearn/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class CAvatar extends StatelessWidget {

  const CAvatar({
    Key key,
    this.radius,
    this.text,
    this.url
  }) : super(key: key);

  final double radius;
  final String text;
  final String url;


  //CachedNetworkImageProvider(url)
  @override
  Widget build(BuildContext context) {

    // GetX<UserController>(init: UserController(),builder: (_){
    //   return Text('${_.userModel.value.type}');
    // });

    return Container(
      child: CircleAvatar(
        radius: radius,
        backgroundImage: url != null ? CachedNetworkImageProvider(url) : null,
        backgroundColor: url != null ? Colors.transparent : null,
        child: url != null? Text(''
            '') : Text('$text')
      )
    );
  }
}
