import 'package:codealpha_flashcard/data_helper/db_helper.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final List<DataHelper> cards;
  const QuizPage({super.key, required this.cards});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  int _current = 0;
  bool _flipped = false;

  DataHelper get _card => widget.cards[_current];
  int get _total => widget.cards.length;

  void _toggle() {
    _flipped ? _ctrl.reverse() : _ctrl.forward();
    setState(() => _flipped = !_flipped);
  }

  void _next() {
    if (_current >= _total - 1) return;
    setState(() {
      _current++;
      _flipped = false;
    });
    _ctrl.reverse();
  }

  void _prev() {
    if (_current <= 0) return;
    setState(() {
      _current--;
      _flipped = false;
    });
    _ctrl.reverse();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final progress = _total > 0 ? (_current + 1) / _total : 0.0;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Quiz Mode",
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// PROGRESS ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Question ${_current + 1}",
                    style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${_current + 1} / $_total",
                      style: tt.titleMedium?.copyWith(
                        color: cs.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// PROGRESS BAR
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: cs.surfaceContainerHighest,
                  color: cs.primary,
                ),
              ),

              const SizedBox(height: 40),

              /// CATEGORY CHIP
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [cs.primary, cs.secondary]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  _card.category,
                  style: tt.titleMedium?.copyWith(
                    color: cs.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// FLIP CARD
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _ctrl,
                    builder: (_, __) {
                      final angle = _ctrl.value * 3.14159;
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(angle),
                        child: _ctrl.value <= 0.5
                            ? _FlipCard(text: _card.question, isBack: false)
                            : _FlipCard(text: _card.answer, isBack: true),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// NAV BUTTONS
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: cs.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: _current > 0 ? _prev : null,
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: cs.onSurface,
                      ),
                      label: Text("Previous", style: tt.titleMedium),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: cs.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: _toggle,
                      child: Text(
                        _flipped ? "Show Question" : "Show Answer",
                        style: tt.titleMedium?.copyWith(
                          color: cs.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: cs.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: _current < _total - 1 ? _next : null,
                      iconAlignment: IconAlignment.end,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: cs.onSurface,
                      ),
                      label: Text("Next", style: tt.titleMedium),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Flip Card ─────────────────────────────────────────────────────────────────

class _FlipCard extends StatelessWidget {
  final String text;
  final bool isBack;
  const _FlipCard({required this.text, required this.isBack});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Transform(
      alignment: Alignment.center,
      transform: isBack
          ? (Matrix4.identity()..rotateY(3.14159))
          : Matrix4.identity(),
      child: Container(
        width: double.infinity,
        height: 420,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isBack
                ? [cs.primary, cs.secondary]
                : [cs.primaryContainer, cs.secondaryContainer],
          ),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: cs.primary.withOpacity(.20),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isBack ? Icons.lightbulb_rounded : Icons.quiz_rounded,
              size: 60,
              color: isBack ? cs.onPrimary : cs.onPrimaryContainer,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: tt.headlineSmall?.copyWith(
                      color: isBack ? cs.onPrimary : cs.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
