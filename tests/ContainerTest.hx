
import com.externs.JSDom.JSDomSetup;
import com.vige.components.Container;
import com.vige.components.Text;
import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

/**
 * Auto generated ExampleTest for MassiveUnit.
 * This is an example test class can be used as a template for writing normal and async tests
 * Refer to munit command line tool for more information (haxelib run munit)
 */
class ContainerTest {
  var container: Container;

	public function new(){
	}
	
	@BeforeClass
	public function beforeClass() {
	}
	
	@AfterClass
	public function afterClass() { 
	}
	
	@Before
	public function setup() {
    JSDomSetup.init();
    container = new Container({
      child: new Text("tekst"),
    });
	}
	
	@After
	public function tearDown() {
	}
	
  @Test
	public function testExample() {
    Assert.isTrue(true);
    var node = container.render();
    Assert.isNotNull(node);
    Assert.isTrue(node.hasChildNodes());
    Assert.areEqual(node.firstChild.nodeName.toLowerCase(), "p");
    Assert.isFalse(node.firstChild.hasChildNodes());
    Assert.areEqual(node.childNodes.length, 1);
	}
  
  /*
	@AsyncTest
	public function testAsyncExample(factory:AsyncFactory){
		var handler:Dynamic = factory.createHandler(this, onTestAsyncExampleComplete, 300);
		var timer = Timer.delay(handler, 200);
	}
	
	function onTestAsyncExampleComplete(){
		Assert.isFalse(false);
  }
  */
  @AsyncTest
	public function testAsyncExample(asyncFactory:AsyncFactory):Void {
    Assert.isTrue(true);

	}

	private function onTestAsyncExampleComplete():Void {
    Assert.isTrue(true);
	}

	#if js
	@Test
	public function testSinglePlatform() {
	  Assert.isTrue(true);
	}
	#end
	
}