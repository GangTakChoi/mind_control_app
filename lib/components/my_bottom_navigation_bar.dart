import 'package:flutter/material.dart';
import 'package:mind_control/providers/root_provider.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Consumer<RootProvider>(
      builder: (context, rootProvider, child) => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '기록의날들',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: '더보기',
          ),
        ],
        currentIndex: rootProvider.indexOfPage,
        onTap: (index) {
          if (index == rootProvider.indexOfPage) return;
          rootProvider.updateIndexForPage(context, index);
        },
      ),
    );
  }
}
