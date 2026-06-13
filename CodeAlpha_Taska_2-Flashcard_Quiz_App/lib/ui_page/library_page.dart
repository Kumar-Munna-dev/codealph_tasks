import 'package:codealpha_flashcard/data_helper/db_helper.dart';
import 'package:codealpha_flashcard/ui_page/add_new_card.dart';
import 'package:codealpha_flashcard/ui_page/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Consumer<HomePageProvider>(
      builder: (_, provider, __) {
        final cards = provider.allQAndAns;

        return Scaffold(
          backgroundColor: cs.surface,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Library',
              style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          body: cards.isEmpty
              ? _EmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cards.length,
                  itemBuilder: (_, i) =>
                      _FlashCard(faq: cards[i], provider: provider),
                ),

          floatingActionButton: FloatingActionButton.extended(
            elevation: 5,
            backgroundColor: cs.primary,
            icon: Icon(Icons.add, color: cs.onPrimary),
            label: Text(
              "Add Card",
              style: TextStyle(
                color: cs.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddNewCard()),
            ),
          ),
        );
      },
    );
  }
}

// ─── Flash Card ────────────────────────────────────────────────────────────────

class _FlashCard extends StatelessWidget {
  final DataHelper faq;
  final HomePageProvider provider;
  const _FlashCard({required this.faq, required this.provider});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withOpacity(.20),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          childrenPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          iconColor: cs.onSurface,
          collapsedIconColor: cs.onSurface,

          title: Text(
            faq.question,
            style: tt.titleMedium?.copyWith(
              color: cs.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                faq.category,
                style: TextStyle(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          children: [
            /// ANSWER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                faq.answer,
                style: tt.bodyLarge?.copyWith(color: cs.onSurface, height: 1.5),
              ),
            ),

            const SizedBox(height: 20),

            /// ACTIONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  icon: Icons.delete,
                  label: "Delete",
                  onTap: () async {
                    await provider.deleteCard(faq.id!);
                  },
                ),
                _ActionButton(
                  icon: Icons.edit,
                  label: "Edit",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddNewCard(editFaq: faq),
                      ),
                    );
                  },
                ),
                _ActionButton(icon: Icons.share, label: "Share", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Action Button ─────────────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: cs.onSurface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: cs.onPrimary),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: cs.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Empty State ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book_rounded,
            size: 100,
            color: cs.primary.withOpacity(.4),
          ),
          const SizedBox(height: 20),
          Text(
            'No Flash Cards Yet',
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Tap + button to add new cards',
            style: tt.bodyLarge?.copyWith(color: cs.onSurface.withOpacity(.6)),
          ),
        ],
      ),
    );
  }
}
