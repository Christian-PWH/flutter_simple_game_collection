class GameValidation {
  static var winCondition = {
    "Rock": {
      "Rock": "It's a Draw",
      "Paper": "You Lose",
      "Scissor": "You Win",
    },
    "Paper": {
      "Rock": "You Win",
      "Paper": "It's a Draw",
      "Scissor": "You Lose",
    },
    "Scissor": {
      "Rock": "You Lose",
      "Paper": "You Win",
      "Scissor": "It's a Draw",
    }
  };
}
