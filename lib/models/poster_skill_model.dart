class PersonModel {
  final String title;
  bool value;

  PersonModel({required this.title, this.value = false});
}

List<PersonModel> personList = [
  PersonModel(title: 'Have visual aids: Skills Posters or App'),
  PersonModel(
      title:
          'Make a general inquiry,\n(“Would you like to check in?”,\n“What’s up?”)'),
  PersonModel(title: 'Rate feelings\n(“What is your feelings level?”)'),
  PersonModel(title: 'If they appear to be over a 3,\nfocus on safety.**'),
];

class Validation {
  final String title;
  bool value;
  Validation({required this.title, this.value = false});
}

List<Validation> validationList = [
  Validation(title: '1: Pay attention\n(Focus attention & no multi-tasking)'),
  Validation(title: '2: Reflect back\n(Summarize/repeat what is said)'),
  Validation(title: '3: Share observations\n(“You do look uncomfortable.”)'),
  Validation(title: '4: Reactions make sense because of past experiences'),
  Validation(title: '5: Reasonable human responses\n(“Anyone would....”)'),
  Validation(title: '6: Being genuine\n(heart-to-heart, be personal)'),
];

class QuickkStep {
  final String title;
  bool value;
  QuickkStep({required this.title, this.value = false});
}

List<QuickkStep> quickStepList = [
  QuickkStep(title: 'Simple language'),
  QuickkStep(title: 'Go step-by-step'),
  QuickkStep(title: 'Cool versus hot topics'),
  QuickkStep(title: 'Slow pace'),
  QuickkStep(title: 'Use visual aids'),
  QuickkStep(title: 'Switch Tracks as needed'),
];

class ClearPicture {
  final String title;
  bool value;
  ClearPicture({required this.title, this.value = false});
}

List<ClearPicture> clearPictureList = [
  ClearPicture(title: 'Use the Clear Picture Poster or App as a guide'),
  ClearPicture(title: 'Notice Breath'),
  ClearPicture(title: 'Notice Surroundings'),
  ClearPicture(title: 'Body Check'),
  ClearPicture(title: 'Label & Rate Emotions'),
  ClearPicture(title: 'Notice Thought'),
  ClearPicture(title: 'Notice Urge'),
];

class AssessPerson {
  final String title;
  bool value;
  AssessPerson({required this.title, this.value = false});
}

List<AssessPerson> assessPersonList = [
  AssessPerson(
      title:
          'Ask about Person A’s GOAL for the situation.(“What is your goal for this situation?”)'),
  AssessPerson(
      title:
          'Ask about Person A’s PLAN to reach the goal. (“What is your plan to reach that goal?”)'),
  AssessPerson(title: 'Assess if the goal and plan are aligned and reachable.'),
];

class PlanGoal {
  final String title;
  bool value;
  PlanGoal({required this.title, this.value = false});
}

List<PlanGoal> planGoalList = [
  PlanGoal(
      title:
          'Summarize the plan (“Your plan is to…[list skills and/or actions]”, “Are those enough skills?” [Check the Categories & Recipe])'),
  PlanGoal(
      title:
          'Clarify what Person A will do first/right now (First Step to the Goal)'),
  PlanGoal(
      title:
          'Troubleshoot possible challenges (“What will you do if that urge returns?”)'),
  PlanGoal(
      title:
          'Ask for Cheerleading statements “What can you say to yourself to help you stay on-track to your goal?”)'),
];

class ColumnB {
  final String title;
  bool value;
  ColumnB({required this.title, this.value = false});
}

List<ColumnB> columnBList = [
  ColumnB(
      title:
          'Validate an on-track aspect of the plan/ goal (“It makes sense you want to...”)'),
  ColumnB(
      title:
          'Ask Permission to offer 2 Cents (“Can I tell you what I am thinking?”)'),
  ColumnB(title: 'Wait for consent to share'),
  ColumnB(
      title:
          'Share/discuss concerns about the Goal (Explain how the goal may not be reachable or it conflicts with their other goals)'),
  ColumnB(
      title:
          'Share/discuss concerns about the Plan (Explain how the plan may not reach the goal or may have unintended results)'),
  ColumnB(title: 'Listen to Person A’s perspective & validate.'),
  ColumnB(title: 'Offer to collaborate to make a new Skills Plan'),
  ColumnB(
      title:
          'Wait for consent again, then collaborate about a plan for this situation'),
];

class ColumnC {
  final String title;
  bool value;
  ColumnC({required this.title, this.value = false});
}

List<ColumnC> columnCList = [
  ColumnC(
      title:
          'Review the Skills List poster together & look for skill options (“What about…[ex. New-Me Activities]?”)'),
  ColumnC(title: 'Discuss what skills fit for them'),
  ColumnC(title: 'Teach skills concepts, as needed'),
  ColumnC(
      title:
          'When Person A’s Plan and Goal are aligned, shift to  Column A: Wrap-Up'),
];

class HelpFul {
  final String title;
  bool value;
  HelpFul({required this.title, this.value = false});
}

List<HelpFul> helpList = [
  HelpFul(title: 'Use Getting It Right to make requests'),
];

class Increase {
  final String title;
  bool value;
  Increase({required this.title, this.value = false});
}

List<Increase> increaseList = [
  Increase(title: 'Validate + Give Space'),
  Increase(title: 'Validate + Highlight benefits of Clear Picture'),
  Increase(
      title:
          'Validate + Ask about Feelings Rating goal ( “Do you want the feeling to go up or down?”)'),
  Increase(title: 'Validate + Switch Tracks to New-Me Activate'),
];

class Level3 {
  final String title;
  bool value;
  Level3({required this.title, this.value = false});
}

List<Level3> levelList = [
  Level3(title: 'Validate + Orient to All-the-Time Skills'),
  Level3(title: 'Follow de-escalation & safety procedues'),
];
