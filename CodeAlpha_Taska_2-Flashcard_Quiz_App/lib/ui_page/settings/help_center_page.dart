import 'package:flutter/material.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final _searchCtrl = TextEditingController();
  String _query = '';
  int? _expandedIndex;

  final List<_FAQItem> _faqs = [
    _FAQItem(
      category: "Getting Started",
      icon: Icons.rocket_launch_rounded,
      color: Colors.blue,
      question: "How do I create my first flash card?",
      answer:
          "Tap the '+' button on the Library page or bottom navigation bar. Fill in the Question, Answer, and Category fields, then tap 'Add Flash Card'. Your card is saved instantly.",
    ),

    _FAQItem(
      category: "Getting Started",
      icon: Icons.rocket_launch_rounded,
      color: Colors.blue,
      question: "What categories can I create?",
      answer:
          "You can create any category you like — just type the category name when adding a card. Examples: Flutter, Math, History, Vocabulary. There's no limit.",
    ),

    _FAQItem(
      category: "Getting Started",
      icon: Icons.rocket_launch_rounded,
      color: Colors.blue,
      question: "Is there a limit to how many cards I can add?",
      answer:
          "No limit at all. Add as many cards as you need — all data is stored locally on your device using SQLite.",
    ),

    _FAQItem(
      category: "Quiz Mode",
      icon: Icons.quiz_rounded,
      color: Colors.purple,
      question: "How does Quiz Mode work?",
      answer:
          "Select a category on the Home page, then tap 'Start Quiz'. You'll see your flash cards one by one. Tap 'Show Answer' to flip the card and reveal the answer. Use Previous and Next to navigate.",
    ),
  ];

  List<_FAQItem> get _filtered => _query.isEmpty
      ? _faqs
      : _faqs
            .where(
              (f) =>
                  f.question.toLowerCase().contains(_query.toLowerCase()) ||
                  f.answer.toLowerCase().contains(_query.toLowerCase()) ||
                  f.category.toLowerCase().contains(_query.toLowerCase()),
            )
            .toList();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'Help Center',
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HERO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: cs.primary.withOpacity(.25),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.support_agent_rounded,
                    color: cs.onPrimary,
                    size: 42,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "How can we help?",
                    style: tt.headlineSmall?.copyWith(
                      color: cs.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Find answers to common questions below.",
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onPrimary.withOpacity(.8),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// SEARCH BAR
            Container(
              decoration: BoxDecoration(
                color: cs.surfaceContainer,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: "Search questions...",
                  hintStyle: TextStyle(color: cs.onSurface.withOpacity(.4)),
                  prefixIcon: Icon(Icons.search_rounded, color: cs.primary),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            color: cs.onSurface.withOpacity(.4),
                          ),
                          onPressed: () {
                            _searchCtrl.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),

            /// FAQ COUNT
            Text(
              _query.isEmpty
                  ? "Frequently Asked Questions"
                  : "${filtered.length} result${filtered.length == 1 ? '' : 's'} for \"$_query\"",
              style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            /// FAQ LIST
            if (filtered.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 60,
                        color: cs.onSurface.withOpacity(.3),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "No results found",
                        style: tt.titleMedium?.copyWith(
                          color: cs.onSurface.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...filtered.asMap().entries.map((e) {
                final i = e.key;
                final faq = e.value;
                final isOpen = _expandedIndex == i;
                return _FAQTile(
                  faq: faq,
                  isOpen: isOpen,
                  onTap: () =>
                      setState(() => _expandedIndex = isOpen ? null : i),
                );
              }),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

// ─── Models & Widgets ──────────────────────────────────────────────────────────

class _FAQItem {
  final String category, question, answer;
  final IconData icon;
  final Color color;
  const _FAQItem({
    required this.category,
    required this.question,
    required this.answer,
    required this.icon,
    required this.color,
  });
}

class _FAQTile extends StatelessWidget {
  final _FAQItem faq;
  final bool isOpen;
  final VoidCallback onTap;
  const _FAQTile({
    required this.faq,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isOpen ? cs.primary.withOpacity(.07) : cs.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isOpen ? cs.primary.withOpacity(.3) : Colors.transparent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: faq.color.withOpacity(.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(faq.icon, size: 16, color: faq.color),
                ),
                const SizedBox(width: 8),
                Text(
                  faq.category,
                  style: tt.bodySmall?.copyWith(
                    color: faq.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  isOpen ? Icons.remove_rounded : Icons.add_rounded,
                  color: cs.primary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              faq.question,
              style: tt.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            if (isOpen) ...[
              const SizedBox(height: 10),
              Divider(color: cs.primary.withOpacity(.15)),
              const SizedBox(height: 10),
              Text(
                faq.answer,
                style: tt.bodyMedium?.copyWith(
                  color: cs.onSurface.withOpacity(.75),
                  height: 1.6,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
