import 'dart:math';

List gameLevelStatus = [
  true,
  true,
  true,
  true,
  true,
  true,
];

List<bool> questionRecord = [];
const int questionTime = 999;
int totalTime = 0;
int progressLevel = 0;
int bestTime = 0;
List gamesTime = [0, 0, 0, 0, 0];

int countQuestionAnswer(match) {
  return questionRecord.where((element) => element == match).length;
}

String formatDuration(int seconds) {
  final Duration duration = Duration(seconds: seconds);
  int hours = duration.inHours;
  int minutes = (duration.inMinutes % 60);
  int remainingSeconds = (duration.inSeconds % 60);

  // Ensure hours, minutes, and seconds are not negative
  hours = hours < 0 ? 0 : hours;
  minutes = minutes < 0 ? 0 : minutes;
  remainingSeconds = remainingSeconds < 0 ? 0 : remainingSeconds;

  // Format hours, minutes, and seconds with leading zeros if less than 10
  String formattedHours = hours < 10 ? '0$hours' : '$hours';
  String formattedMinutes = minutes < 10 ? '0$minutes' : '$minutes';
  String formattedSeconds =
      remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';

  return '$formattedHours : $formattedMinutes : $formattedSeconds';
}

List<List<Question>> allQuestions = [
  [
    Question(
        "How many skills are in the Skills System?", ["10", "9"], 1, false),
    Question("What is Skill 1?", ["Clear Mind", "Clear Picture"], 1, false),
    Question("What skill is this? (TV)", ["Clear Picture", "Distract Activity"],
        0, false),
    Question("What is Skill 2?", ["New-Me Self-Talk", "On-Track Thinking"], 1,
        false),
    Question("What skill is this? (Person's head)",
        ["Safety Plan", "On-Track Thinking"], 1, false),
    Question("What is Skill 3?", ["On-Track Action", "On-Tracking"], 0, false),
    Question("What skill is this? (Train)",
        ["On-Track Thinking", "On-Track Action"], 1, false),
    Question("What is Skill 4?", ["Move Away", "Safety Plan"], 1, false),
    Question(
        "What skill is this? (Badge)", ["Risk Plan", "Safety Plan"], 1, false),
    Question(
        "What is Skill 5?", ["Calm Activity", "New-Me Activity"], 1, false),
    Question("What skill is this? (Cup)",
        ["Feel Good Activity", "New-Me Activity"], 1, false),
    Question("What is Skill 6?", ["Quick Fix", "Problem Solving"], 1, false),
    Question("What skill is this? (Flat Tire)",
        ["Problem Focus", "Problem Solving"], 1, false),
    Question(
        "What is Skill 7?", ["Talk It Out", "Expressing Myself"], 1, false),
    Question("What skill is this? (Person Talking)",
        ["Finding Middle Ground", "Expressing Myself"], 1, false),
    Question("What is Skill 8?", ["Getting It Right", "New-Me Activities"], 0,
        false),
    Question("What skill is this? (Treasure Chest)",
        ["Ask For It", "Getting It Right"], 1, false),
    Question("What is Skill 9?", ["Friendship Activities", "Relationship Care"],
        1, false),
    Question("What skill is this? (Ship)",
        ["Getting Together", "Relationship Care"], 1, false),
    Question(
      "How can skills help us?",
      [
        "Reach our goals and live according to our values",
        "Be what others want us to be.",
      ],
      0,
      false,
    ),
  ],

  //2

  [
    Question("What is the Feelings Rating Scale?", ["0-10", "0-5"], 1, false),
    Question(
        "What is a level 0 joy?",
        ["Not feeling joy right now", "Not having any feelings at all"],
        0,
        false),
    Question("What is a 0 angry?",
        ["Trying not to snap", "Not feeling angry right now"], 1, false),
    Question("What is a level 1 feeling?",
        ["Avoiding feeling bad", "Tiny feeling"], 1, false),
    Question(
        "What is a level 1 feeling?",
        ["One sensation of a feeling", "Many sensations of a feeling"],
        0,
        false),
    Question("What is a level 2 feeling?",
        ["Getting very uncomfortable", "Small feeling"], 1, false),
    Question("What is a level 3 feeling?",
        ["Medium feeling", "Tiny sensations of a feeling"], 0, false),
    Question(
        "What is a level 3 feeling like?",
        ["We are able to Talk & Listen", "We can't do a 2-Way Street"],
        0,
        false),
    Question("What is a level 4 feeling?",
        ["Going to flip out for sure", "Strong feeling"], 1, false),
    Question("What is a level 4 feeling like?",
        ["It's hard to focus my mind", "I am thinking very clearly"], 0, false),
    Question(
        "What is a level 4 feeling like?",
        [
          "I feel like I might flip out.",
          "I am harming self, other, or property"
        ],
        0,
        false),
    Question("What is a level 5 feeling?",
        ["Overwhelming feeling", "Strong feeling"], 0, false),
    Question(
        "What is a level 5 feeling like?",
        [
          "Harm self, others or property",
          "Urges to harm self, others, or property"
        ],
        0,
        false),
    Question(
        "Who can rate my feelings?", ["Me, myself, and I", "Others"], 0, false),
    Question("How can I rate others' feelings?",
        ["Estimate their level", "Know their level exactly"], 0, false),
    Question("What happens at levels 0-3 feelings?",
        ["Talk & Listen", "Break items"], 0, false),
    Question("What happens at levels 0-3 feelings?",
        ["Give & Take", "Harm Myself"], 0, false),
    Question("What happens at levels 0-3 feelings?",
        ["Focus my mind", "Hurt others"], 0, false),
    Question(
        "What happens at level 4 feelings?",
        [
          "Able to help a friend",
          "Unable to talk & listen, give & take, and focus."
        ],
        1,
        false),
    Question(
        "What is a level 5 happy like?",
        [
          "Able to solve a big problem",
          "So happy that we harm self, others or property"
        ],
        1,
        false),
  ],

  // 3

  [
    Question("What Category of Skills is Clear Picture?",
        ["All-the-Time", "Calm Only"], 0, false),
    Question(
        "When can we use Clear Picture?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        0,
        false),
    Question("What Category of Skills is On-Track Thinking?",
        ["All-the-Time", "Calm Only"], 0, false),
    Question(
        "When can we use On-Track Thinking?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        0,
        false),
    Question("What Category of Skills is On-Track Action?",
        ["All-the-Time", "Calm Only"], 0, false),
    Question(
        "When can we use On-Track Action?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        0,
        false),
    Question("What Category of Skills is Safety Plan?",
        ["All-the-Time", "Calm Only"], 0, false),
    Question(
        "When can we use Safety Plan?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        0,
        false),
    Question("What Category of Skills is New-Me Activity?",
        ["All-the-Time", "Calm Only"], 0, false),
    Question("When can we use New-Me Activity?",
        ["Levels 0-1-2-3-4-5", "Levels 0-1-2-3"], 0, false),
    Question("What Category of Skills is Problem Solving?",
        ["All-the-Time", "Calm Only"], 1, false),
    Question(
        "When can we use Problem Solving?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        1,
        false),
    Question("What Category of Skills is Expressing Myself?",
        ["All-the-Time", "Calm Only"], 1, false),
    Question(
        "When can we use Expressing Myself?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        1,
        false),
    Question("What Category of Skills is Getting It RIght?",
        ["All-the-Time", "Calm Only"], 1, false),
    Question(
        "When can we use Getting It RIght?",
        [
          "Levels 0-1-2-3-4-5",
          "Levels 0-1-2-3",
        ],
        1,
        false),
    Question("What Category of Skills is Relationship Care?",
        ["All-the-Time", "Calm Only"], 1, false),
    Question("When can we use Relationship Care?",
        ["Levels 0-1-2-3-4-5", "Levels 0-1-2-3"], 1, false),
    Question("At a level 0 feeling, how many skills do I need?",
        ["0", "At least 1"], 1, false),
    Question("At a level 1 feeling, how many skills do I need?",
        ["1", "At least 2"], 1, false),
    Question("At a level 2 feeling, how many skills do I need?",
        ["2", "At least 3"], 1, false),
    Question("At a level 3 feeling, how many skills do I need?",
        ["3", "At least 4"], 1, false),
    Question("At a level 4 feeling, how many skills do I need?",
        ["4", "At least 5 All-the-Time Skills"], 1, false),
    Question("At a level 5 feeling, how many skills do I need?",
        ["5", "At least 6 All-the-Time Skills"], 1, false),
    Question("When I am 0-3 what skills can I use?",
        ["Skills 1-5", "Skills 1-9"], 1, false),
  ],

  // 4

  [
    Question("How can Clear Picture help us? ",
        ["See the moment as it is", "Change the moment"], 0, false),
    Question(
        "How can On-Track Thinking help us?",
        [
          "Make choices that help us reach our goals",
          "See the moment as it is"
        ],
        0,
        false),
    Question(
        "How can On-Track Action help us? ",
        [
          "Take actions to help us reach our goals.",
          "Make other people like us better."
        ],
        0,
        false),
    Question(
      "How can Safety Plan help us?",
      ["Help us win all arguments.", "Help us manage risky situations."],
      1,
      false,
    ),
    Question(
      "What are the Types of Risk?",
      ["Small and big", "Inside and Outside"],
      1,
      false,
    ),
    Question(
      "What are the Levels of Risk?",
      ["0-1-2-3-4-5", "Low, Medium, and High"],
      1,
      false,
    ),
    Question(
      "What are the Types of Safety Plans?",
      ["Thinking, Talking, and Writing", "Solo and Partnership"],
      0,
      false,
    ),
    Question(
      "How can we handle risk?",
      ["Focus on New-Me Activity, Move, or Leave", "Avoid all stress"],
      0,
      false,
    ),
    Question(
      "When I want to Move Away and can't?",
      ["Stuck in a Rut", "Safety Pickle"],
      1,
      false,
    ),
    Question(
      "How can Focus New-Me Activities help us?",
      ["Help us focus our minds", "Get excited"],
      0,
      false,
    ),
    Question(
      "How can Feel Good New-Me Activities help us?",
      ["Help us relax", "Express anger"],
      0,
      false,
    ),
    Question(
      "How can Distraction New-Me Activities help us?",
      ["Get our mind off of something", "Solve our problems"],
      0,
      false,
    ),
    Question(
      "How can Fun New-Me Activities help us? ",
      ["Give us joy", "Avoid work and chores"],
      0,
      false,
    ),
    Question(
        "What skill is Noticing My Breath part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        0,
        true),
    Question(
        "What skill is Noticing My Surroundings part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        0,
        true),
    Question(
        "What skill is Body Check part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        0,
        true),
    Question(
        "What skill is Label and Rate Feelings part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        0,
        true),
    Question(
        "What skill is Notice My Thoughts part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        0,
        true),
    Question(
        "What skill is Noticing My Urges part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        0,
        true),
    Question(
        "What skill is Stop & Check It part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        1,
        true),
    Question(
        "What skill is Turn It part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        1,
        true),
    Question(
        "What skill is Cheerleading part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        1,
        true),
    Question(
        "What skill is Make a Skills Plan part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        1,
        true),
    Question(
        "What skill is Step to Our Goal part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        2,
        true),
    Question(
        "What skill is Switch Tracks part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        2,
        true),
    Question(
        "What skill is On-Track Action Plan part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        2,
        true),
    Question(
        "What skill is Accept the Situation part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        2,
        true),
    Question(
        "What skill is Turn the Page part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        2,
        true),
  ],

  //   5
  [
    Question(
        "How can Expressing Myself help us?",
        ["Ask for what we want", "Communicate what is in our hearts and minds"],
        1,
        false),
    Question("What is true about Expressing Myself?",
        ["Talking is the only way", "There are many ways"], 1, false),
    Question("What is true about Expressing Myself?",
        ["Increases feelings", "Decreases feelings"], 0, false),
    Question("How can Getting It Right help us?",
        ["Make situations right", "Get things I need from others"], 1, false),
    Question("How can Problem Solving help us?",
        ["Fix our problems", "Avoid our problems"], 0, false),
    Question(
        "How can Relationship Care help us?",
        [
          "Take care of ourselves.",
          "Help have healthy relationships with ourselves and others"
        ],
        1,
        false),
    Question(
        "What skill is Get a Clear Picture of the Problem part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        5,
        true),
    Question(
        "What skill is Check All Options part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        5,
        true),
    Question(
        "What is Pros and Cons part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        5,
        true),
    Question(
        "What is Make Plans A, B, and C?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        5,
        true),
    Question(
        "What skill is Right Mind part of? ",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        7,
        true),
    Question(
        "What skill is Right Person part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        7,
        true),
    Question(
        "What skill is Right Time & Place part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        7,
        true),
    Question(
        "What skill is Right Tone part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        7,
        true),
    Question(
        "What skill is Right Words part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        7,
        true),
    Question(
        "What skill is SEALS part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        7,
        true),
    Question(
        "What skill is Core Self part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        8,
        true),
    Question(
        "What skill is 2-Way Street part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        8,
        true),
    Question(
        "What skill is Finding Middle Ground part of?",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        8,
        true),
    Question(
        "What skill is Steps of Responsibility part of? ",
        [
          "tv",
          "person's head",
          "train",
          "badge",
          "cup",
          "flat tire",
          "person talking",
          "treasure chest",
          "ship",
        ],
        8,
        true),
  ]
];

class Question {
  final String questionText;
  List<String> options;
  int correctAnswerIndex;
  bool isImage;

  Question(
      this.questionText, this.options, this.correctAnswerIndex, this.isImage);
}

List<Question> pickRandomQuestions(int count, int index) {
  final random = Random();

  // Create a copy of the questions
  final List<Question> q = List<Question>.from(allQuestions[index])
    ..shuffle(random);

  List<Question> shuffledQuestions = q.take(count).toList();

  shuffledQuestions.forEach((question) {
    if (!question.isImage) {
      final correctAnswer = question.options[question.correctAnswerIndex];
      /*print(correctAnswer);
    print(question.options);*/
      question.options.shuffle(random);
      // print(question.options);
      question.correctAnswerIndex = question.options.indexOf(correctAnswer);
      // print(question.options[question.correctAnswerIndex]);
      // print("___________");
    }
  });

  // Take the first 'count' questions from the shuffled list

  return shuffledQuestions;
}
