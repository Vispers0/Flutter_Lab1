import 'package:flutter/cupertino.dart';

class ListItem{
  late Image leading;
  late String title;
  late String subtitle;
  late Icon trailing;

  ListItem({
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });
}