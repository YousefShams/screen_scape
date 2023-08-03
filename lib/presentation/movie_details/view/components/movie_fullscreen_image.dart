import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_strings.dart';

class MovieFullScreenImage extends StatelessWidget {
  final String imagePath;
  const MovieFullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullPath = AppFunctions.getNetworkImagePath(imagePath, max:true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).textTheme.bodyMedium?.color,)),
        actions : [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){
              AppFunctions.saveNetworkImageToGallery(fullPath); },
                icon: Icon(Icons.file_download_outlined, size: 30,
                  color: Theme.of(context).textTheme.bodyMedium?.color,)),
          )
        ],
      ),
      body: InteractiveViewer(
        child: Container(
          alignment: Alignment.center,
          height: context.getHeight(),
          width: double.maxFinite,
          child: Image.network(
            fullPath, width: double.maxFinite, fit: BoxFit.contain,
            loadingBuilder: (_,widget, bytes) {
              if(bytes!=null) {
                if(bytes.cumulativeBytesLoaded/bytes.expectedTotalBytes!.toInt()==1) {
                  return widget;
                }
                else {
                  return const CircularProgressIndicator();
                }
              }
              return widget;
            },
            errorBuilder: (x,y,z) {
              return const Text(AppStrings.connectionError);
            },
            isAntiAlias: true,
          ),
        ),
      ),
    );
  }
}
