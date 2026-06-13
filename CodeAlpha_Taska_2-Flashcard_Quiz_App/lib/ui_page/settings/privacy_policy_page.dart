import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
                  Icon(Icons.shield_rounded, color: cs.onPrimary, size: 42),
                  const SizedBox(height: 14),
                  Text(
                    "Your Privacy Matters",
                    style: tt.headlineSmall?.copyWith(
                      color: cs.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Last updated: January 1, 2025",
                    style: tt.bodySmall?.copyWith(
                      color: cs.onPrimary.withOpacity(.7),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "We are committed to protecting your personal data. This policy explains how Flash Cards handles your information.",
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onPrimary.withOpacity(.9),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// SECTIONS
            _PolicySection(
              index: "1",
              title: "Information We Collect",
              icon: Icons.info_outline_rounded,
              content:
                  "Flash Cards does not collect any personal information from you. We do not ask for your name, email address, phone number, or any other identifying details.\n\nThe only data stored by the app is the flash card content you create yourself — questions, answers, and categories. This data exists solely on your device.",
            ),

            _PolicySection(
              index: "2",
              title: "How Your Data is Stored",
              icon: Icons.storage_rounded,
              content:
                  "All flash card data is stored locally on your device using SQLite, a lightweight embedded database. Your data never leaves your device and is never transmitted to our servers or any third party.\n\nWhen you uninstall the app, all locally stored data is permanently deleted from your device.",
            ),

            _PolicySection(
              index: "3",
              title: "Third-Party Services",
              icon: Icons.handshake_rounded,
              content:
                  "Flash Cards does not integrate with any third-party analytics, advertising, or tracking services. We do not use:\n\n• Google Analytics\n• Firebase Analytics\n• Facebook SDK\n• Any advertising networks\n• Any crash reporting tools that transmit data\n\nYour usage of the app is completely private.",
            ),

            _PolicySection(
              index: "4",
              title: "Internet & Permissions",
              icon: Icons.wifi_rounded,
              content:
                  "Flash Cards does not require an internet connection to function. The app works fully offline.\n\nWe do not request any sensitive device permissions such as camera, microphone, location, or contacts. The only device resource the app uses is local storage for saving your cards.",
            ),

            _PolicySection(
              index: "5",
              title: "Children's Privacy",
              icon: Icons.child_care_rounded,
              content:
                  "Flash Cards is designed to be safe for all ages, including children under 13. Since we collect no personal data, there is no risk of children's information being stored or shared.\n\nThe app is appropriate for use in educational settings, schools, and by students of all ages.",
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Widgets ───────────────────────────────────────────────────────────────────

class _PolicySection extends StatefulWidget {
  final String index, title, content;
  final IconData icon;
  const _PolicySection({
    required this.index,
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  State<_PolicySection> createState() => _PolicySectionState();
}

class _PolicySectionState extends State<_PolicySection> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _open ? cs.primary.withOpacity(.06) : cs.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _open ? cs.primary.withOpacity(.25) : Colors.transparent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [cs.primary, cs.secondary],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.index,
                      style: TextStyle(
                        color: cs.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Icon(widget.icon, size: 18, color: cs.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: tt.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _open
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: cs.primary,
                ),
              ],
            ),
            if (_open) ...[
              const SizedBox(height: 14),
              Divider(color: cs.primary.withOpacity(.15)),
              const SizedBox(height: 12),
              Text(
                widget.content,
                style: tt.bodyMedium?.copyWith(
                  color: cs.onSurface.withOpacity(.75),
                  height: 1.7,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
