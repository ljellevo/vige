import massive.munit.TestSuite;

import ContainerTest;
import ActionTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */
class TestSuite extends massive.munit.TestSuite
{
	public function new()
	{
		super();

		add(ContainerTest);
		add(ActionTest);
	}
}
