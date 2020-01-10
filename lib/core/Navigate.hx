package lib.core;

import js.Browser;

/**
  Need to implement 404
**/

class Navigate {
    
  public static var routes: Array<DynamicComponent> = [];
  public static var fourOFour: DynamicComponent = null;
  
  public function new() { }

  public static function to(arg: {url: String, ?param: Array<{param: String, data: String}>, ?main: Bool, ?hardRefresh: Bool}) {
    var url = arg.url;
    if (arg.main == null) arg.main = false;
    if (arg.hardRefresh == null) arg.hardRefresh = false;
    if (arg.param != null && arg.param.length > 0) {
      url += "?";

      for(i in 0...arg.param.length){
        if(i != 0) url += "&";
        url += arg.param[i].param + "=" + arg.param[i].data;
      }
    }

    GlobalState.instance.closeAllStreams();
    var correctPage = matchRoute(url, routes);
      
    if (!arg.main) {
      Browser.window.history.pushState(null, "Index", url);
      if(arg.hardRefresh){
        Browser.window.location.reload();
      }
    }
      
    setComponent(true, correctPage); 
  }

  public static function getParameters() : Array<String>{
    var params = [];
    var url = Browser.location.pathname;
    var correctPage = matchRoute(url, routes);
    var currentRoute = correctPage.component().getRoute();
    var routeParts = currentRoute.split("/");
    var urlParts = url.split("/");
    routeParts.splice(0, 1);
    urlParts.splice(0, 1);
    for(i in 0...routeParts.length) {
      if(routeParts[i].indexOf(":") > -1) {
        params.push(urlParts[i]);
      }
    }
    return params;
  }



  public static function link(arg: {url: String}) {
    Browser.window.history.pushState(null, "Index", Browser.location.pathname);
    Browser.window.location.replace(arg.url);
  }

  /**
  TODO: Implement this feature:
      Determines whether a new component needs to be loaded, or an exsisting component from the stack
  **/
  static function setComponent(newHistoryElement: Bool, page: DynamicComponent) {
    var currentURL = Browser.location.pathname;
    
    if (Browser.document.querySelector("#page") != null) {
      Browser.document.querySelector("#page").remove();
    }

    Browser.document.body.appendChild(page.component().render());
    page.init();
  }

  private static function matchRoute(url: String, routes: Array<DynamicComponent>): DynamicComponent {
    var urlParts = url.split("/");
    urlParts.splice(0, 1);

    for(i in 0...routes.length) {
      var route = routes[i].component().getRoute().split("/");
      route.splice(0,1);
      var match = true;
      if(route.length == urlParts.length) {
        for(j in 0...urlParts.length) {
          if(route[j].indexOf(":") == -1) {
            if(route[j] != urlParts[j]) {
              match = false;
            }
          }
        }
      } else {
        match = false;
      }
      if(match) {
        return routes[i];
      }
    }
    for(route in routes) {
      if(route.component().getRoute() == "/") {
        return route;
      }
    }
    return fourOFour;
  }

  /**
  TODO: Implement this feature:
      Figures out if user navigates forwards or backwards when using browser navigation buttons
  **/

  public static function navigationEvent() {  
    GlobalState.instance.closeAllStreams();
    var url = Browser.location.pathname;
    var correctPage = matchRoute(Browser.location.pathname, routes);
    setComponent(false, correctPage);
  }

  public static function updateComponent(component: js.html.Node) {
    if (Browser.document.querySelector("#page") != null) {
      Browser.document.querySelector("#page").remove();
    }

    Browser.document.body.appendChild(component);
  }
}