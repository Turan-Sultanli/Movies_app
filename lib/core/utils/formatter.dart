String formatYear(DateTime date) {
  return date.year.toString();
}


String formatCount(int count) {
  if (count >= 1000) {
    return "${(count / 1000).toStringAsFixed(0)}K";
  }
  return count.toString();
}
