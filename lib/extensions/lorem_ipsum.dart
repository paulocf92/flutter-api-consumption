import 'dart:math';
import 'package:flutter/material.dart';

final List<String> texts = [
  'Nam et ante vel lacus aliquet tempus. Ut sagittis elit non luctus faucibus. Proin et tincidunt turpis, at elementum nibh. Quisque pellentesque blandit velit a egestas. Fusce ac volutpat massa, in blandit arcu. Quisque feugiat semper imperdiet. Duis eleifend posuere felis quis faucibus.',
  'Suspendisse facilisis sed nisl vel fringilla. Maecenas ornare purus sit amet ipsum egestas sagittis. Aenean vel dapibus ligula. Vivamus dolor tortor, dictum id tortor ut, imperdiet ullamcorper tortor. Phasellus quis sagittis odio, imperdiet lacinia nunc. Cras tellus nisi, rutrum fermentum lacus sed, bibendum suscipit sapien. Etiam vitae dui neque.',
  'Morbi sit amet libero nec eros congue aliquet. Aliquam id dictum enim, non consequat turpis. Phasellus tempus nibh a mi venenatis pharetra. Nullam dolor elit, venenatis in fringilla vitae, ultricies ac est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu mattis dui. Donec efficitur massa vel ornare pretium.',
  'Aenean quis turpis sit amet lacus eleifend lacinia. Aliquam erat volutpat. Duis pellentesque risus ac auctor egestas. Donec feugiat tempus mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut nisl et libero rutrum aliquet. Curabitur finibus arcu et metus dignissim vulputate. Duis maximus, augue at convallis lobortis, leo enim rhoncus metus, vel egestas ligula ligula sit amet augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean egestas malesuada sem, a eleifend dolor commodo ac.',
  'Ut mi lacus, rutrum eu varius nec, accumsan mollis dolor. Proin semper sit amet lacus suscipit efficitur. Nulla venenatis tortor ligula, sit amet tincidunt lectus sodales non. Etiam mattis tincidunt pellentesque. Vivamus eleifend ultrices dapibus. Sed ultricies lobortis tempus. In hac habitasse platea dictumst.',
  'Praesent ultrices mi a dui egestas tempus. Mauris sed ante purus. Etiam at quam gravida, porttitor nibh eu, semper metus. Nunc a eros ipsum. Nullam convallis laoreet fermentum. Nunc ac ipsum nunc. Etiam faucibus, nulla sed suscipit feugiat, mauris orci rutrum ipsum, sit amet euismod sapien dui ut felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas lorem lectus, tincidunt et vestibulum non, ultrices et nisl. Suspendisse commodo diam vel lacus sodales, in sagittis quam pretium.',
  'Morbi sit amet libero nec eros congue aliquet. Aliquam id dictum enim, non consequat turpis. Phasellus tempus nibh a mi venenatis pharetra. Nullam dolor elit, venenatis in fringilla vitae, ultricies ac est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu mattis dui. Donec efficitur massa vel ornare pretium.',
  'Integer quis luctus tortor. Etiam quis nisi id felis lacinia pellentesque. Phasellus sit amet accumsan magna. Aliquam ac velit quis mi mattis sagittis. Donec vel eros pellentesque, pharetra orci quis, blandit purus. Suspendisse sed faucibus diam. Nunc facilisis interdum quam eu commodo. Duis nec nisi consectetur, lobortis est id, fermentum diam.'
];

extension LoremIpsum on BuildContext {
  String get randomLoremIpsum => texts[Random().nextInt(texts.length)];
}
