import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ListTile(
          title: Text('Title 1'),
          subtitle: Text(
              'Some randon subtitle to test whether the text is overflowing or not in the current scenario'),
        ),
        ListTile(
          title: Text('Title 1'),
          subtitle: Text(
              'Some randon subtitle to test whether the text is overflowing or not in the current scenario'),
        ),
        ListTile(
          title: Text('Title 1'),
          subtitle: Text(
              'Some randon subtitle to test whether the text is overflowing or not in the current scenario'),
        ),
        ListTile(
          title: Text('Title 1'),
          subtitle: Text(
              'Some randon subtitle to test whether the text is overflowing or not in the current scenario'),
        ),
        ListTile(
          title: Text('Title 1'),
          subtitle: Text(
              'Some randon subtitle to test whether the text is overflowing or not in the current scenario'),
        ),
        ListTile(
          title: Text('Title 1'),
          subtitle: Text(
              'Some randon subtitle to test whether the text is overflowing or not in the current scenario'),
        ),
      ],
    );
  }
}
