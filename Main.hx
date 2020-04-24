import utest.Runner;
import utest.ui.Report;

class Main {
  public static function main() {
    var runner = new Runner();
    runner.addCases(com.tests);
    Report.create(runner);
    runner.run();
  }
}