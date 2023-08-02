import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/functions/functions.dart';

class MovieFullScreenImage extends StatelessWidget {
  final String imagePath;
  const MovieFullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).textTheme.bodyMedium?.color,)),
        actions : [
          IconButton(onPressed: (){ AppFunctions.downloadNetworkImage(imagePath); },
              icon: Icon(Icons.file_download_outlined, color: Theme.of(context).textTheme.bodyMedium?.color,))
        ],
      ),
      body: InteractiveViewer(
        child: Container(
          alignment: Alignment.center,
          height: context.getHeight(),
          width: double.maxFinite,
          child: Image.network(
            imagePath, width: double.maxFinite, fit: BoxFit.contain,
            isAntiAlias: true,
          ),
        ),
      ),
    );
  }
}
