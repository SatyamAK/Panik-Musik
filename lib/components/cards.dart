import 'package:flutter/material.dart';

SizedBox collectionCard(String? title, img, BuildContext context) {
  return SizedBox(
    height: 128,
    width: 128,
    child: Card(
      color: Theme.of(context).backgroundColor.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 128,
            width: 124,
            margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Image.network(img, fit: BoxFit.cover,)
          ),
          Text(title!, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.fade,)
        ],
      ),
    ),
  );
}
