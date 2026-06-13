import 'package:codealpha_flashcard/data_helper/db_helper.dart';
import 'package:codealpha_flashcard/ui_page/add_new_card_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCard extends StatelessWidget {
  final DataHelper? editFaq;
  const AddNewCard({super.key, this.editFaq});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final isEditing = editFaq != null;

    return ChangeNotifierProvider(
      create: (_) => AddCardProvider(editFaq: editFaq),
      child: Consumer<AddCardProvider>(
        builder: (_, provider, __) {
          return Scaffold(
            backgroundColor: cs.surface,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                isEditing ? 'Edit Flash Card' : 'Create Flash Card',
                style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Banner(isEditing: isEditing),

                  const SizedBox(height: 35),

                  _InputCard(
                    title: "Question",
                    hint: "Enter your question here...",
                    icon: Icons.quiz_rounded,
                    controller: provider.questionCtrl,
                  ),
                  const SizedBox(height: 25),
                  _InputCard(
                    title: "Answer",
                    hint: "Enter answer or explanation...",
                    icon: Icons.lightbulb_rounded,
                    controller: provider.answerCtrl,
                    height: 220,
                  ),
                  const SizedBox(height: 25),
                  _InputCard(
                    title: "Category",
                    hint: "Flutter, Dart, Java...",
                    icon: Icons.category_rounded,
                    controller: provider.categoryCtrl,
                    height: 80,
                    singleLine: true,
                  ),

                  const SizedBox(height: 35),

                  /// SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: cs.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: Icon(
                        isEditing ? Icons.save_rounded : Icons.add_rounded,
                        color: cs.onPrimary,
                      ),
                      label: Text(
                        isEditing ? "Save Changes" : "Add Flash Card",
                        style: tt.titleMedium?.copyWith(
                          color: cs.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        await provider.addCard(editId: editFaq?.id);
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: cs.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Text(
                              isEditing ? "Card Updated!" : "Flash Card Added!",
                              style: TextStyle(color: cs.onPrimary),
                            ),
                          ),
                        );
                        if (isEditing) Navigator.pop(context);
                      },
                    ),
                  ),

                  const SizedBox(height: 35),
                  const _ProTip(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Banner ────────────────────────────────────────────────────────────────────

class _Banner extends StatelessWidget {
  final bool isEditing;
  const _Banner({this.isEditing = false});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [cs.primary, cs.secondary]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withOpacity(.20),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isEditing ? Icons.edit_note_rounded : Icons.auto_awesome_rounded,
            color: cs.onPrimary,
            size: 40,
          ),
          const SizedBox(height: 20),
          Text(
            isEditing ? "Edit Your Card" : "Build Your Knowledge",
            style: tt.headlineSmall?.copyWith(
              color: cs.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            isEditing
                ? "Update the question, answer or category below."
                : "Create flash cards for smarter learning and quick revision.",
            style: tt.bodyLarge?.copyWith(color: cs.onPrimary.withOpacity(.8)),
          ),
        ],
      ),
    );
  }
}

// ─── Input Card ────────────────────────────────────────────────────────────────

class _InputCard extends StatelessWidget {
  final String title, hint;
  final IconData icon;
  final TextEditingController controller;
  final double height;
  final bool singleLine;

  const _InputCard({
    required this.title,
    required this.hint,
    required this.icon,
    required this.controller,
    this.height = 200,
    this.singleLine = false,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: cs.primary),
            const SizedBox(width: 10),
            Text(
              title,
              style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          height: height,
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cs.surfaceContainer,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: singleLine ? 1 : null,
            expands: !singleLine,
            textInputAction: singleLine
                ? TextInputAction.done
                : TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: cs.onSurface.withOpacity(.45)),
            ),
            style: tt.bodyLarge,
          ),
        ),
      ],
    );
  }
}

// ─── Pro Tip ───────────────────────────────────────────────────────────────────

class _ProTip extends StatelessWidget {
  const _ProTip();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.lightbulb_rounded, color: Colors.amber),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pro Tip",
                  style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "Keep answers concise and meaningful to improve long-term memory retention.",
                  style: tt.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
