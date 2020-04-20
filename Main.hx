import com.tests.TestContainer;

import utest.Runner;
import utest.ui.Report;

class Main {
  public static function main() {
    //the long way
    var runner = new Runner();
    runner.addCases(com.tests);
    Report.create(runner);
    runner.run();

    //the short way in case you don't need to handle any specifics
    //utest.UTest.run([new TestCase1(), new TestCase2()]);
  }
}