import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(
            imagePath, width: double.maxFinite, fit: BoxFit.contain,
            isAntiAlias: true,
          ),
        ),
      ),
    );
  }
}
