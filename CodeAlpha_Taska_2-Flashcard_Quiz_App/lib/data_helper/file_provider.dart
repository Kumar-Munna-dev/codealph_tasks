import 'package:codealpha_flashcard/data_helper/db_helper.dart';
import 'package:codealpha_flashcard/ui_page/add_new_card.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class FileProvider extends ChangeNotifier {
  ///animation
  late Animation _animation;
  late AnimationController _animationController;
  Animation get animations => _animation;
  AnimationController get animationControllers => _animationController;
  final int totalCard = 0;

  void initController(TickerProvider provider) {
    _animationController = AnimationController(
      vsync: provider,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  void toggle() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationControllers.dispose();
  }

  /// animation end

  crudItem? selectedMenu;
  void popAction(crudItem? item, BuildContext context) {
    if (item == crudItem.Delete) {
    } else if (item == crudItem.Update) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddNewCard()),
      );
    }
  }
}

enum crudItem { Delete, Update }
