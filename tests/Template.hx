import com.externs.JSDom.JSDomSetup;
import com.vige.components.Text;
import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

class ExampleTest {

	public function new(){
	}
	
	@BeforeClass
	public function beforeClass() {

	}
	
	@Before
	public function setup() {
    JSDomSetup.init();
  }

  @Test
	public function testExample() {
    Assert.isTrue(true);
  }
  
  #if js
	@Test
	public function testSinglePlatform() {
	  Assert.isTrue(true);
	}
	#end
	
	@After
	public function tearDown() {
  
  }
  
  @AfterClass
	public function afterClass() { 

	}
	


  /*
  @AsyncTest
	public function testAsyncExample(asyncFactory:AsyncFactory):Void {
    Assert.isTrue(true);

	}

	private function onTestAsyncExampleComplete():Void {
    Assert.isTrue(true);
  }
  */


	
}