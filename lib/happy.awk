{
  split($2, time, ":")
  minutes = time[1] * 60 + time[2];
  categories[$1] = minutes;
  total_minutes += minutes;
}
END {
  for (c in categories) {
    # printf "%s: %sm\n", c, categories[c]
    printf "%s: %.1f%\n", c, ((categories[c] / total_minutes) * 100);
  }
  happy_score = (categories["Coding"] / total_minutes) * 100;
  # printf "-----------------------------------\n"
  # printf "Total: %s minutes\n", total_minutes
  printf "\n"
  printf "Happy score: %.0f of 100 ", happy_score

  if (happy_score >= 90) {
    printf "🥳"
  }
  else if (happy_score >= 50) {
    printf "😃"
  }
  else if (happy_score >= 40) {
    printf "🤔"
  }
  else if (happy_score > 20) {
    printf "😐"
  }
  else if (happy_score < 20) {
    printf "😩"
  }


  printf "\n"
}
