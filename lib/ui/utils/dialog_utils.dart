import 'package:flutter/material.dart';

class DialogUtils {
static void ShowLoading(BuildContext  context, String message){
  showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context){
    return AlertDialog(
      content: Row(
      children: [
         CircularProgressIndicator(color: Theme.of(context).primaryColor,),
          SizedBox( width: 20,),
          Text(message??'')
      ],

    ),
    );
      }
  );
}
static void hideDialog(BuildContext context){
  Navigator.of(context, rootNavigator: true).pop();

}
static void showMassage(BuildContext context,
String message,
{String title= "title",
String posActionName= "ok",
VoidCallback? posAction,
String? negActionName,
VoidCallback? negAction,
}) {
  List<Widget> actions = [];
  if (posActionName != null) {
    actions.add(TextButton(onPressed: (){
      Navigator.of(context).pop(context);
      posAction?.call();
    },
        child: Text(posActionName,style: TextStyle(color: Theme.of(context).primaryColor),
    )
    )
    );
  }
if (negActionName != null) {
  actions.add(TextButton(onPressed: (){
    Navigator.pop(context);
    negAction?.call();
  }, child: Text(negActionName??'cancel')
  )
  );
}
showDialog(context: context,
    builder:(context){
  return AlertDialog(
    title: Text(title),
    content: Text(message),
actions: actions,

  );
    } );
}
}