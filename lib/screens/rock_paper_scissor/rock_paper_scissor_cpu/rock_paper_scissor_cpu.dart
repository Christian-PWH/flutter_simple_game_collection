import 'dart:math';

class RockPaperScissorCpu {
  Random random = Random();

  int? generateChoiceRNG() {
    int cpuChoiceRNG = random.nextInt(3);
    return cpuChoiceRNG;
  }

  int? generateFakeChoiceRNG() {
    int cpuFakeChoiceRNG = random.nextInt(3);
    return cpuFakeChoiceRNG;
  }
}
