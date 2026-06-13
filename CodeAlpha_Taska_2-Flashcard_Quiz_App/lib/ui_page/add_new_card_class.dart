import 'package:codealpha_flashcard/data_helper/db_helper.dart';
import 'package:flutter/material.dart';

class AddCardProvider extends ChangeNotifier {
  final questionCtrl = TextEditingController();
  final answerCtrl = TextEditingController();
  final categoryCtrl = TextEditingController();

  List<DataHelper> allCards = [];

  AddCardProvider({DataHelper? editFaq}) {
    if (editFaq != null) {
      questionCtrl.text = editFaq.question;
      answerCtrl.text = editFaq.answer;
      categoryCtrl.text = editFaq.category;
    }
    _loadAll();
  }

  Future<void> _loadAll() async {
    allCards = await DatabaseHelper.instance.getAllData();
    notifyListeners();
  }

  Future<void> addCard({int? editId}) async {
    final q = questionCtrl.text.trim();
    final a = answerCtrl.text.trim();
    final c = categoryCtrl.text.trim();

    if (q.isEmpty || a.isEmpty || c.isEmpty) return;

    final faq = DataHelper(id: editId, question: q, answer: a, category: c);
    editId != null
        ? await DatabaseHelper.instance.update(faq)
        : await DatabaseHelper.instance.insert(faq);

    questionCtrl.clear();
    answerCtrl.clear();
    categoryCtrl.clear();

    await _loadAll();
  }

  @override
  void dispose() {
    questionCtrl.dispose();
    answerCtrl.dispose();
    categoryCtrl.dispose();
    super.dispose();
  }
}
