require.config({
  shim: {
    "bootstrap-sass": {
      deps: [
        "jquery"
      ]
    },
    "jquery.easing": {
      deps: [
        "jquery"
      ]
    }
  },
  paths: {
    "app": "app",
    "bootstrap-sass": "../bower_components/bootstrap-sass/assets/javascripts/bootstrap",
    "google-maps": "../bower_components/google-maps/lib/Google",
    jquery: "../bower_components/jquery/dist/jquery",
    html5shiv: "../bower_components/html5shiv/dist/html5shiv",
    requirejs: "../bower_components/requirejs/require",
    respond: "../bower_components/respond/dest/respond.src",
    "jquery.easing": "../bower_components/jquery-easing/jquery.easing.min",
    font: "../bower_components/requirejs-plugins/src/font",
    propertyParser: "../bower_components/requirejs-plugins/src/propertyParser",
  }
});

// configure loading of fonts
requirejs(['./site'], function(site) {
  requirejs(['font!typekit,id:' + site.apikey.typekit], function() {});
});
