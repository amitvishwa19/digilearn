import 'package:digilearn/utils/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: primaryColor,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }
}

class DZButton extends StatefulWidget {
  final String buttonText;
  final Function onClick;
  final bool updating;

  DZButton({
    this.buttonText,
    this.onClick,
    this.updating
  }) ;



  @override
  _DZButtonState createState() => _DZButtonState();
}

class _DZButtonState extends State<DZButton> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 54,
      width: MediaQuery.of(context).size.width * .95,
      child: MaterialButton(
          //minWidth: MediaQuery.of(context).size.width * 0.8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: !widget.updating ? primaryColor : buttonUpdating,
          onPressed: !widget.updating ?widget.onClick : (){
            print('Button is executing previous command');
          },
          child: widget.updating ?
          Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
              )):
            Text(widget.buttonText,style: TextStyle(color: Colors.white,fontSize: 18))

      ),
    );
  }
}
