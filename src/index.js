'use strict';

require('./index.html');
var Elm = require('./Main.elm');

var mountNode = document.getElementById('main');
var main = Elm.Main.embed(mountNode);