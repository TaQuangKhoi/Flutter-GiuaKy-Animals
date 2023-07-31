int getTotalTime(level) {
  switch (level) {
    case "easy":
      return 150;
    case "medium":
      return 100;
    case "hard":
      return 50;
    default:
      return 50;
  }
}

double getTotalTimeAsSeconds(level) {
  switch (level) {
    case "easy":
      return 1.5;
    case "medium":
      return 1;
    case "hard":
      return 0.5;
    default:
      return 1.5;
  }
}