
import com.externs.JSDom.JSDomSetup;
import com.vige.components.Container;
import com.vige.components.Text;
import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

class ContainerTest {
  var container: Container;

	public function new(){
	}
	
	@BeforeClass
	public function beforeClass() {

	}
	
	@Before
	public function setup() {
    JSDomSetup.init();
    container = new Container({
      child: new Text("tekst"),
    });
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
  
  #if js
	@Test
	public function testSinglePlatform() {
	  Assert.isTrue(true);
	}
	#end
	
	@After
	public function tearDown() {
    container = null;
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