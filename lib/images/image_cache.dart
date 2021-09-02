import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ImageCached extends StatelessWidget {
  const ImageCached({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Work with cached images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl:
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
