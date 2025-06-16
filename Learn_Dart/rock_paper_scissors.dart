import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  while (true) {
    final rng = Random();
    stdout.write('Rock,Paper or Scissors? (r/p/s) ');
    final input = stdin.readLineSync();
    if (input == 'r' || input == 'p' || input == 's') {
      var PlayerMove;
      switch (input) {
        case 'r':
          PlayerMove = Move.rock;
          break;
        case 'p':
          PlayerMove = Move.paper;
          break;
        case 's':
          PlayerMove = Move.scissors;
          break;
      }
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      if (PlayerMove == aiMove)
        print("It's a draw.");
      else if ((PlayerMove == Move.rock && aiMove == Move.scissors) ||
          (PlayerMove == Move.paper && aiMove == Move.rock) ||
          (PlayerMove == Move.scissors && aiMove == Move.rock))
        print('Player wins');
      else
        print('AI wins');
      print("Player chose $PlayerMove");
      print("AI chose $aiMove");
    } else if (input == 'q')
      break;
    else
      print('Invalid Input');
  }
}
