import 'package:flutter/material.dart';
import 'package:panik_musik/components/cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Animes', style: Theme.of(context).textTheme.headline1),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return collectionCard(
                          'title',
                          'https://i.insider.com/5e820b04671de06758588fb8?width=700',
                          context
                      );
                  }
                ),
              ),
            ),
            Text('Video Games', style: Theme.of(context).textTheme.headline1),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return collectionCard(
                          'title',
                          'https://i.insider.com/5e820b04671de06758588fb8?width=700',
                          context
                      );
                  }
                ),
              ),
            ),
            Text('Artists', style: Theme.of(context).textTheme.headline1),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return collectionCard(
                          'title',
                          'https://i.insider.com/5e820b04671de06758588fb8?width=700',
                          context
                      );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
