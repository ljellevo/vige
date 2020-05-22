import com.externs.JSDom.JSDomSetup;
import com.vige.components.Action;
import com.vige.components.Text;
import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import js.html.DivElement;

class ActionTest {
  var element: Action;

	public function new(){
	}
	
	@BeforeClass
	public function beforeClass() {

	}

	@Before
	public function setup() {
    JSDomSetup.init();
    element = new Action({
      child: new Text("Tekst"),
      onClick: function() {
        trace("Click");
      }
    });
	}
  #if js
  @Test
	public function testExample() {
    Assert.isTrue(true);
    JSDomSetup.init();
    var node = Std.downcast(element.render(), DivElement);
    Assert.isNotNull(node);
    Assert.isTrue(node.hasChildNodes());
    Assert.areEqual(node.firstChild.nodeName.toLowerCase(), "p");
    Assert.isFalse(node.firstChild.hasChildNodes());
    Assert.areEqual(node.childNodes.length, 1);
  }

 
	@Test
	public function testSinglePlatform() {
	  Assert.isTrue(true);
	}
	#end
  
	@After
	public function tearDown() {
    element = null;
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