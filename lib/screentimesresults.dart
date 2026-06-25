class ScreenTimeResult {
  final String title;
  final String mainHours;
  final String wakingDayText;
  final String yearlyText;
  final String secondCardText;
  final String cta;

  ScreenTimeResult({
    required this.title,
    required this.mainHours,
    required this.wakingDayText,
    required this.yearlyText,
    required this.secondCardText,
    required this.cta,
  });
}

ScreenTimeResult getScreenTimeResult({
  required int estimatedHours,
  required int actualHours,
}) {
  final difference = estimatedHours - actualHours;

  // +/-1 hour = approximately correct
  final bool approximatelyCorrect = difference.abs() <= 1;
  final bool guessedLower = estimatedHours < actualHours;

  late String title;
  late String wakingDay;
  late String yearly;
  late String secondCard;
  late String cta;

  if (actualHours >= 10) {
    if (approximatelyCorrect) {
      title = "THIS NEEDS IMMEDIATE ATTENTION";
    } else if (guessedLower) {
      title = "YOU THOUGHT IT WAS $estimatedHours HOURS";
    } else {
      title = "YOU'RE DOING BETTER THAN YOU THINK";
    }
  } else {
    if (approximatelyCorrect) {
      title = "YOU KNOW WHERE YOUR TIME IS GOING";
    } else if (guessedLower) {
      title = "YOU THOUGHT IT WAS $estimatedHours HOURS";
    } else {
      title = "YOU'RE DOING BETTER THAN YOU THINK";
    }
  }

  if (actualHours >= 2 && actualHours < 4) {
    wakingDay = "Around 25% of your waking day";
    yearly = "That's around 61 days every year";
    secondCard = "That's enough time to learn a new skill.";

    if (approximatelyCorrect) {
      cta = "OPTIMIZE FURTHER";
    } else if (guessedLower) {
      cta = "TAKE CONTROL";
    } else {
      cta = "KEEP IMPROVING";
    }
  } else if (actualHours <= 2) {
    wakingDay = "Around 2% of your waking day";
    yearly = "Thats around 15 days every year";
    secondCard = "Thats actually pretty good";

    if (approximatelyCorrect) {
      cta = "START IMPROVING";
    } else if (guessedLower) {
      cta = "CHANGE THIS NOW";
    } else {
      cta = "KEEP IMPROVING";
    }
  } else if (actualHours >= 4 && actualHours < 6) {
    wakingDay = "Around 38% of your waking day";
    yearly = "That's around 91 days every year";
    secondCard = "That's enough time to read 20+ books every year.";

    if (approximatelyCorrect) {
      cta = "START IMPROVING";
    } else if (guessedLower) {
      cta = "CHANGE THIS NOW";
    } else {
      cta = "KEEP IMPROVING";
    }
  } else if (actualHours >= 6 && actualHours < 10) {
    wakingDay = "Around 63% of your waking day";
    yearly = "That's around 152 days every year";
    secondCard = "Those hours could become a side business.";

    if (approximatelyCorrect) {
      cta = "RECLAIM YOUR TIME";
    } else if (guessedLower) {
      cta = "TAKE BACK YOUR TIME";
    } else {
      cta = "KEEP IMPROVING";
    }
  } else {
    wakingDay = "Around 75% of your waking day";
    yearly = "That's around 183 days every year";
    secondCard =
        "Imagine where you'd be in 5 years if you reclaimed this time.";

    if (approximatelyCorrect) {
      cta = "TAKE ACTION NOW";
    } else if (guessedLower) {
      cta = "FIX THIS NOW";
    } else {
      cta = "START REDUCING TODAY";
    }
  }

  return ScreenTimeResult(
    title: title,
    mainHours: "$actualHours HOURS DAILY",
    wakingDayText: wakingDay,
    yearlyText: yearly,
    secondCardText: secondCard,
    cta: cta,
  );
}
