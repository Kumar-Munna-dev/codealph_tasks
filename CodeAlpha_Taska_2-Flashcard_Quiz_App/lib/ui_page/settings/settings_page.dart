import 'package:codealpha_flashcard/theme/theme_provider.dart';
import 'package:codealpha_flashcard/ui_page/settings/about_us_page.dart';
import 'package:codealpha_flashcard/ui_page/settings/help_center_page.dart';
import 'package:codealpha_flashcard/ui_page/settings/privacy_policy_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,

        title: Text(
          'Settings',

          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// PROFILE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.secondary],
                ),

                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(.20),

                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: colorScheme.onPrimary.withOpacity(.2),

                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: colorScheme.onPrimary,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Flash Card App",

                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Learn smarter every day",

                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimary.withOpacity(.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            /// GENERAL TITLE
            Text(
              "GENERAL",

              style: textTheme.titleSmall?.copyWith(
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface.withOpacity(.6),
              ),
            ),

            const SizedBox(height: 15),

            /// THEME CARD
            settingsTile(
              context: context,
              icon: Icons.dark_mode_rounded,
              title: "Dark Mode",
              subtitle: "Enable dark appearance",

              trailing: Switch(
                value:
                    context.watch<ThemeProvider>().themeMode == ThemeMode.dark,

                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme();
                },
              ),
            ),

            const SizedBox(height: 15),

            /// ABOUT
            settingsTile(
              context: context,
              icon: Icons.info_outline_rounded,
              title: "About App",
              subtitle: "Application information",

              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: colorScheme.onSurface.withOpacity(.5),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AboutUsPage()),
                );
              },
            ),

            const SizedBox(height: 15),

            /// HELP CENTER
            settingsTile(
              context: context,
              icon: Icons.help_outline_rounded,
              title: "Help Center",
              subtitle: "Support & FAQ",

              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: colorScheme.onSurface.withOpacity(.5),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HelpCenterPage()),
                );
              },
            ),

            const SizedBox(height: 15),

            /// PRIVACY
            settingsTile(
              context: context,
              icon: Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              subtitle: "Terms and conditions",

              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: colorScheme.onSurface.withOpacity(.5),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PrivacyPolicyPage()),
                );
              },
            ),

            const SizedBox(height: 40),

            /// VERSION
            Center(
              child: Column(
                children: [
                  Text(
                    "Version 1.0.0",

                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withOpacity(.6),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Made with Flutter ❤️",

                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// SETTINGS TILE
Widget settingsTile({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
  Widget? trailing,
  VoidCallback? onTap,
}) {
  final textTheme = Theme.of(context).textTheme;
  final colorScheme = Theme.of(context).colorScheme;

  return InkWell(
    borderRadius: BorderRadius.circular(24),

    onTap: onTap,

    child: Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          /// ICON
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(.1),

              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(icon, color: colorScheme.primary),
          ),

          const SizedBox(width: 16),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,

                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(.6),
                  ),
                ),
              ],
            ),
          ),

          /// TRAILING
          trailing ?? const SizedBox(),
        ],
      ),
    ),
  );
}
