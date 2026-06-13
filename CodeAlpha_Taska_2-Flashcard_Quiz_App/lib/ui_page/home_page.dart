import 'package:codealpha_flashcard/ui_page/home_page_provider.dart';
import 'package:codealpha_flashcard/ui_page/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Consumer<HomePageProvider>(
      builder: (_, provider, __) {
        final categories = provider.categories;
        final filtered = provider.filteredQAndAns;

        return Scaffold(
          backgroundColor: cs.surface,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "Flash Cards",
              style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),

                /// DASHBOARD
                Row(
                  children: [
                    Expanded(
                      child: _DashboardCard(
                        title: "${provider.allQAndAns.length}",
                        subtitle: "Total Cards",
                        icon: Icons.style,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _DashboardCard(
                        title: "${categories.length}",
                        subtitle: "Categories",
                        icon: Icons.category,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),
                Text(
                  "Categories",
                  style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),

                /// CATEGORY CHIPS
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: categories.length,
                    itemBuilder: (_, i) {
                      final isSelected = _selectedCategory == i;
                      return GestureDetector(
                        onTap: () {
                          setState(() => _selectedCategory = i);
                          provider.filterByCategory(categories[i]);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? LinearGradient(
                                    colors: [cs.primary, cs.secondary],
                                  )
                                : null,
                            color: isSelected ? null : cs.surfaceContainer,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.08),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              categories[i],
                              style: tt.bodyMedium?.copyWith(
                                color: isSelected ? cs.onPrimary : cs.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                /// QUIZ PREVIEW CARD
                if (filtered.isNotEmpty)
                  _QuizPreviewCard(
                    question: filtered.first.question,
                    total: filtered.length,
                  ),

                const SizedBox(height: 40),

                /// START BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: cs.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizPage(
                          cards: provider.filteredQAndAns.isNotEmpty
                              ? provider.filteredQAndAns
                              : provider.allQAndAns,
                        ),
                      ),
                    ),
                    child: Text(
                      "Start Quiz",
                      style: tt.titleLarge?.copyWith(
                        color: cs.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─── Dashboard Card ────────────────────────────────────────────────────────────

class _DashboardCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  const _DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withOpacity(.25),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),

            child: Icon(icon, color: cs.primary, size: 34),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: tt.bodySmall?.copyWith(
                  color: cs.onSurface.withOpacity(.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Quiz Preview Card ─────────────────────────────────────────────────────────

class _QuizPreviewCard extends StatelessWidget {
  final String question;
  final int total;
  const _QuizPreviewCard({required this.question, required this.total});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withOpacity(.25),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: cs.primary,
                      blurRadius: 1,

                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  "1 of $total",
                  style: tt.bodyMedium?.copyWith(color: cs.onSurface),
                ),
              ),
              Icon(Icons.auto_awesome, color: cs.onSurface),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            question,
            style: tt.headlineSmall?.copyWith(
              color: cs.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Tap below to reveal answer",
            style: tt.bodyMedium?.copyWith(color: cs.onSurface.withOpacity(.8)),
          ),
        ],
      ),
    );
  }
}
