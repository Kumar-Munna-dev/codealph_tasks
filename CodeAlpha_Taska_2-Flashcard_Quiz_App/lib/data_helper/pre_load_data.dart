import 'package:codealpha_flashcard/data_helper/db_helper.dart';

class PreLoadData {
  static Future<void> initializeData() async {
    final existing = await DatabaseHelper.instance.getAllData();
    if (existing.isNotEmpty) return;

    final dataHelpers = [
      DataHelper(
        question:
            "I have cities, but no houses live there. I have mountains, but no trees grow there. I have water, but no fish swim there. What am I?",
        answer: "A Map.",
        category: "Logic Puzzles",
      ),

      DataHelper(
        question: "The more you take, the more you leave behind. What am I?",
        answer: "Footsteps.",
        category: "Logic Puzzles",
      ),

      DataHelper(
        question:
            "I speak without a mouth and hear without ears. I have no body, but I come alive with the wind. What am I?",
        answer: "An Echo.",
        category: "Logic Puzzles",
      ),

      DataHelper(
        question:
            "You see a house with two doors. One leads to certain death, the other to freedom. Two guards stand — one always lies, one always tells truth. You don't know which is which. What one question do you ask?",
        answer:
            "Ask either guard: 'Which door would the other guard say leads to freedom?' Then pick the opposite door.",
        category: "Logic Puzzles",
      ),

      DataHelper(
        question:
            "A rooster lays an egg on top of a barn roof. Which way does it roll?",
        answer: "Roosters don't lay eggs.",
        category: "Logic Puzzles",
      ),

      DataHelper(
        question:
            "If 5 machines take 5 minutes to make 5 widgets, how long do 100 machines take to make 100 widgets?",
        answer:
            "5 minutes. Each machine makes 1 widget in 5 minutes regardless of how many machines there are.",
        category: "Math Puzzles",
      ),

      DataHelper(
        question:
            "A bat and a ball cost \$1.10. The bat costs \$1 more than the ball. How much does the ball cost?",
        answer: "5 cents. (Ball = \$0.05, Bat = \$1.05, Total = \$1.10)",
        category: "Math Puzzles",
      ),

      DataHelper(
        question:
            "You have two ropes that each take exactly 1 hour to burn, but they burn unevenly. How do you measure 45 minutes?",
        answer:
            "Light both ends of rope 1 and one end of rope 2 simultaneously. When rope 1 finishes (30 min), light the other end of rope 2. It burns out in 15 more minutes. Total = 45 minutes.",
        category: "Math Puzzles",
      ),

      DataHelper(
        question:
            "What is the next number in the sequence: 1, 1, 2, 3, 5, 8, 13, ?",
        answer:
            "21. This is the Fibonacci sequence — each number is the sum of the two before it.",
        category: "Math Puzzles",
      ),

      DataHelper(
        question: "How many times can you subtract 10 from 100?",
        answer: "Once. After that you're subtracting from 90, 80, etc.",
        category: "Math Puzzles",
      ),

      DataHelper(
        question:
            "I am not alive, but I grow. I don't have lungs, but I need air. I don't have a mouth, but water kills me. What am I?",
        answer: "Fire.",
        category: "Word Puzzles",
      ),

      DataHelper(
        question: "What word becomes shorter when you add two letters to it?",
        answer: "Short. Add 'er' → Shorter.",
        category: "Word Puzzles",
      ),

      DataHelper(
        question: "I have a head and a tail but no body. What am I?",
        answer: "A coin.",
        category: "Word Puzzles",
      ),

      DataHelper(
        question:
            "What 5-letter word becomes shorter when you add two more letters?",
        answer: "Short + er = Shorter.",
        category: "Word Puzzles",
      ),

      DataHelper(
        question:
            "Railroad crossing, watch out for cars. Can you spell that without any R's?",
        answer: "T-H-A-T.",
        category: "Word Puzzles",
      ),

      DataHelper(
        question:
            "What comes once in a minute, twice in a moment, but never in a thousand years?",
        answer: "The letter M.",
        category: "Pattern Puzzles",
      ),

      DataHelper(
        question: "Complete the pattern: 2, 6, 12, 20, 30, ?",
        answer: "42. Pattern is n×(n+1): 1×2, 2×3, 3×4, 4×5, 5×6, 6×7.",
        category: "Pattern Puzzles",
      ),

      DataHelper(
        question:
            "What 3-digit number, when reversed and subtracted from itself, gives 0?",
        answer:
            "Any palindrome like 121, 252, 393 — reversing gives the same number.",
        category: "Pattern Puzzles",
      ),

      DataHelper(
        question:
            "A clock shows 3:15. What is the angle between the hour and minute hand?",
        answer:
            "7.5 degrees. At 3:15, the minute hand is at 90°. The hour hand is at 97.5° (3 hours + 15 min × 0.5°/min).",
        category: "Pattern Puzzles",
      ),

      DataHelper(
        question:
            "If you rearrange the letters 'CIFAIPC' you get the name of a famous what?",
        answer: "Ocean. CIFAIPC → PACIFIC.",
        category: "Pattern Puzzles",
      ),

      DataHelper(
        question:
            "A man walks into a restaurant and orders albatross soup. He takes one sip, goes home, and kills himself. Why?",
        answer:
            "He was a shipwreck survivor. His companion had died and he was fed 'albatross soup'. The real soup confirmed his companion was eaten — what he had at sea was not albatross.",
        category: "Lateral Thinking",
      ),

      DataHelper(
        question:
            "A man is found dead in a field. He has a pack on his back and no tracks around him. What happened?",
        answer: "His parachute failed to open.",
        category: "Lateral Thinking",
      ),

      DataHelper(
        question:
            "A woman shoots her husband, then holds him underwater for 5 minutes. An hour later they go to dinner. How?",
        answer:
            "She's a photographer. She shot his photo and developed it in a darkroom.",
        category: "Lateral Thinking",
      ),

      DataHelper(
        question: "How can a man go 8 days without sleep?",
        answer: "He sleeps at night.",
        category: "Lateral Thinking",
      ),

      DataHelper(
        question: "A girl fell off a 20-foot ladder but didn't get hurt. How?",
        answer: "She fell off the bottom rung.",
        category: "Lateral Thinking",
      ),

      DataHelper(
        question:
            "What has keys but no locks, space but no room, and you can enter but can't go inside?",
        answer: "A keyboard.",
        category: "Classic Riddles",
      ),

      DataHelper(
        question: "The more you have of it, the less you see. What is it?",
        answer: "Darkness.",
        category: "Classic Riddles",
      ),

      DataHelper(
        question: "What can travel around the world while staying in a corner?",
        answer: "A stamp.",
        category: "Classic Riddles",
      ),

      DataHelper(
        question: "I have branches but no fruit, trunk or leaves. What am I?",
        answer: "A bank.",
        category: "Classic Riddles",
      ),

      DataHelper(
        question: "What gets wetter the more it dries?",
        answer: "A towel.",
        category: "Classic Riddles",
      ),

      DataHelper(
        question: "What is Flutter?",
        answer:
            "Flutter is an open-source UI toolkit by Google for building natively compiled apps for mobile, web, and desktop from a single codebase.",
        category: "Flutter",
      ),
      DataHelper(
        question: "What language does Flutter use?",
        answer: "Flutter uses Dart, a language developed by Google.",
        category: "Flutter",
      ),
      DataHelper(
        question: "What is a Widget in Flutter?",
        answer:
            "Everything in Flutter is a widget. Widgets describe the UI — layout, text, buttons, etc.",
        category: "Flutter",
      ),
      DataHelper(
        question: "Difference between StatelessWidget and StatefulWidget?",
        answer:
            "StatelessWidget never changes after build. StatefulWidget has a State object that can rebuild when data changes.",
        category: "Flutter",
      ),
      DataHelper(
        question: "What is the widget tree?",
        answer:
            "The widget tree is the hierarchy of widgets that Flutter uses to build and render the UI.",
        category: "Flutter",
      ),
      DataHelper(
        question: "What is BuildContext?",
        answer:
            "BuildContext is a handle to the location of a widget in the widget tree, used to access theme, providers, and navigation.",
        category: "Flutter",
      ),

      DataHelper(
        question: "What is Dart?",
        answer:
            "Dart is a statically typed, object-oriented language by Google, used primarily with Flutter.",
        category: "Dart",
      ),
      DataHelper(
        question: "What is a Future in Dart?",
        answer:
            "A Future represents a value that will be available at some point in the future — used for async operations.",
        category: "Dart",
      ),
      DataHelper(
        question: "What is async/await in Dart?",
        answer:
            "async marks a function as asynchronous. await pauses execution until a Future completes, making async code readable.",
        category: "Dart",
      ),
      DataHelper(
        question: "What is a Stream in Dart?",
        answer:
            "A Stream is a sequence of asynchronous events, like a pipe delivering data over time.",
        category: "Dart",
      ),
      DataHelper(
        question: "What is null safety in Dart?",
        answer:
            "Null safety ensures variables can't be null unless explicitly declared nullable with '?', preventing null pointer errors.",
        category: "Dart",
      ),
      DataHelper(
        question: "What is the difference between final and const?",
        answer:
            "final is set once at runtime. const is a compile-time constant — more optimized but requires values known at compile time.",
        category: "Dart",
      ),

      DataHelper(
        question: "What is setState()?",
        answer:
            "setState() tells Flutter that state has changed and the widget should rebuild.",
        category: "State Management",
      ),
      DataHelper(
        question: "What is Provider?",
        answer:
            "Provider is a state management package that makes data accessible anywhere in the widget tree without passing it manually.",
        category: "State Management",
      ),
      DataHelper(
        question: "What is ChangeNotifier?",
        answer:
            "ChangeNotifier is a class that notifies its listeners when notifyListeners() is called, triggering a UI rebuild.",
        category: "State Management",
      ),
      DataHelper(
        question: "What is the difference between Provider and Riverpod?",
        answer:
            "Riverpod is a more robust, compile-safe evolution of Provider with better testability and no BuildContext dependency.",
        category: "State Management",
      ),
      DataHelper(
        question: "What is BLoC?",
        answer:
            "BLoC (Business Logic Component) is a pattern that separates UI from logic using Streams and Sinks.",
        category: "State Management",
      ),

      DataHelper(
        question: "How do you navigate to a new screen in Flutter?",
        answer:
            "Use Navigator.push() with a MaterialPageRoute to push a new screen onto the navigation stack.",
        category: "Navigation",
      ),
      DataHelper(
        question: "What is Navigator.pop()?",
        answer:
            "Navigator.pop() removes the current screen from the stack, returning to the previous screen.",
        category: "Navigation",
      ),
      DataHelper(
        question: "What is named routing?",
        answer:
            "Named routing lets you navigate using string names like Navigator.pushNamed(context, '/home') defined in MaterialApp routes.",
        category: "Navigation",
      ),

      DataHelper(
        question: "What is the difference between Row and Column?",
        answer:
            "Row lays out children horizontally. Column lays them out vertically.",
        category: "Layout",
      ),
      DataHelper(
        question: "What is Expanded?",
        answer:
            "Expanded makes a child of Row/Column fill the remaining available space along the main axis.",
        category: "Layout",
      ),
      DataHelper(
        question: "What is a Stack widget?",
        answer:
            "Stack lets you overlay widgets on top of each other, positioned using Positioned widgets.",
        category: "Layout",
      ),
      DataHelper(
        question: "What is SizedBox used for?",
        answer:
            "SizedBox gives a widget a fixed width/height, or adds spacing between widgets when empty.",
        category: "Layout",
      ),
      DataHelper(
        question: "What is MediaQuery?",
        answer:
            "MediaQuery gives you information about the screen size, orientation, and pixel density.",
        category: "Layout",
      ),

      DataHelper(
        question: "What is sqflite?",
        answer:
            "sqflite is a Flutter plugin for SQLite, a lightweight relational database stored locally on the device.",
        category: "Database",
      ),
      DataHelper(
        question: "What is shared_preferences?",
        answer:
            "shared_preferences stores simple key-value pairs persistently on device — good for settings and flags.",
        category: "Database",
      ),
      DataHelper(
        question: "What is Hive?",
        answer:
            "Hive is a fast, lightweight NoSQL database for Flutter, storing data as key-value boxes without needing native code.",
        category: "Database",
      ),

      DataHelper(
        question: "What is pubspec.yaml?",
        answer:
            "pubspec.yaml is the configuration file for a Flutter project — it defines dependencies, assets, fonts, and metadata.",
        category: "General",
      ),
      DataHelper(
        question: "What is hot reload in Flutter?",
        answer:
            "Hot reload injects updated code into the running app instantly without losing state, speeding up development.",
        category: "General",
      ),
    ];

    for (final data in dataHelpers) {
      await DatabaseHelper.instance.insert(data);
    }
  }
}
