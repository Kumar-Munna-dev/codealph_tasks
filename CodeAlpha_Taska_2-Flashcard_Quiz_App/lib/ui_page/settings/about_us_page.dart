import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'About Us',
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HERO BANNER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(30),
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
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.auto_stories_rounded,
                      color: cs.onPrimary,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Flash Cards",
                    style: tt.headlineMedium?.copyWith(
                      color: cs.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Version 1.0.0",
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onPrimary.withOpacity(.75),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "A smarter way to learn. Build your knowledge one card at a time — anywhere, anytime.",
                    style: tt.bodyLarge?.copyWith(
                      color: cs.onPrimary.withOpacity(.9),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            _FeatureRow(
              icon: Icons.add_card_rounded,
              color: Colors.blue,
              title: "Create Cards",
              body:
                  "Add your own Q&A flash cards in any topic or category you choose.",
            ),
            _FeatureRow(
              icon: Icons.quiz_rounded,
              color: Colors.purple,
              title: "Quiz Mode",
              body:
                  "Test yourself with animated flip cards and track your progress.",
            ),
            _FeatureRow(
              icon: Icons.category_rounded,
              color: Colors.teal,
              title: "Organize by Category",
              body:
                  "Group your cards by subject for focused, efficient study sessions.",
            ),

            const SizedBox(height: 20),

            /// CONTACT
            _SectionTitle(title: "Get In Touch"),
            const SizedBox(height: 12),
            _ContactTile(
              icon: Icons.email_rounded,
              label: "Email",
              value: "flutterdeveloper37@gmail.com",
            ),
            _ContactTile(
              icon: Icons.language_rounded,
              label: "Website",
              value: "www.a2tool.com",
            ),
            _ContactTile(
              icon: Icons.code_rounded,
              label: "GitHub",
              value:
                  "https://github.com/Kumar-Munna-dev/codealpha_tasks-2-flashcard-Quiz-App",
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Reusable Widgets ──────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            color: cs.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title, body;
  const _FeatureRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: tt.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(
                  body,
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurface.withOpacity(.65),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String label, value;
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: cs.primary, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurface.withOpacity(.55),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
