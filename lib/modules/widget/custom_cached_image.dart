import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCashedImage extends StatelessWidget {
  final String url;
  const CustomCashedImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: url,
    fit: BoxFit.fill,
    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) =>  Center(child: Icon(Icons.error,color: Colors.black.withOpacity(.6),)),
    );
  }
}
