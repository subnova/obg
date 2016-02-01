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
    app: "app",
    "bootstrap-sass": "../bower_components/bootstrap-sass/assets/javascripts/bootstrap",
    "google-maps": "../bower_components/google-maps/lib/Google",
    jquery: "../bower_components/jquery/dist/jquery",
    html5shiv: "../bower_components/html5shiv/dist/html5shiv",
    requirejs: "../bower_components/requirejs/require",
    respond: "../bower_components/respond/dest/respond.src",
    "jquery.easing": "../bower_components/jquery-easing/jquery.easing.min",
    font: "../bower_components/requirejs-plugins/src/font",
    propertyParser: "../bower_components/requirejs-plugins/src/propertyParser",
    "bower-webfontloader": "../bower_components/bower-webfontloader/webfont",
    async: "../bower_components/requirejs-plugins/src/async",
    depend: "../bower_components/requirejs-plugins/src/depend",
    goog: "../bower_components/requirejs-plugins/src/goog",
    image: "../bower_components/requirejs-plugins/src/image",
    json: "../bower_components/requirejs-plugins/src/json",
    mdown: "../bower_components/requirejs-plugins/src/mdown",
    noext: "../bower_components/requirejs-plugins/src/noext",
    "Markdown.Converter": "../bower_components/requirejs-plugins/lib/Markdown.Converter",
    text: "../bower_components/requirejs-plugins/lib/text"
  },
  packages: [

  ]
});

// configure loading of fonts
requirejs(['./site'], function(site) {
  requirejs(['font!typekit,id:' + site.apikey.typekit], function() {});
});
