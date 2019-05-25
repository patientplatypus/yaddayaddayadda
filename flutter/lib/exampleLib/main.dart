import 'package:flutter/material.dart';
// Import fluro package.
import 'package:fluro/fluro.dart';

// Import my pages.
import 'package:yaddayaddayadda/pages/about.page.dart';
import 'package:yaddayaddayadda/pages/home.page.dart';
import 'package:yaddayaddayadda/pages/splash.page.dart';

void main() {
  // Create the router.
  Router router = new Router();
  
  // Define our splash page.
  router.define('splash', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SplashPage();
  }));

  // Define our home page.
  router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));

  // Define our about page.
  router.define('about', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AboutPage();
  }));

  // Run app from splash page!
  runApp(new MaterialApp(
    title: 'App',
    home: new SplashPage(),
    onGenerateRoute: router.generator // Use our Fluro routers for this app.
  ));
}