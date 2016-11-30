// Simplified version of code found on https://developer.mozilla.org/en-US/docs/Web/JavaScript/Old_Proxy_API
function handlerMaker(obj) {
  return {
    delete:       function(name) {
      console.log("Delete: " + obj[name]); 
      return delete obj[name]; },
    has:          function(name) { 
      console.log("Has: " + obj);
      return name in obj; },
    hasOwn:       function(name) { 
      console.log("Has its own: " + Object.prototype.hasOwnProperty.call(obj, name));
      return Object.prototype.hasOwnProperty.call(obj, name); },
    get:          function(receiver, name) { 
      console.log("Get: " + obj[name]);
      return obj[name]; },
    set:          function(receiver, name, val) {
      console.log("Setting " + obj[name] + " to " + val); 
      obj[name] = val; return true; },
    enumerate:    function() {
      console.log("Enumerating: ");
      var result = [];
      for (name in obj) { result.push(name); };
      return result;
    },
    keys: function() {
      console.log("Keys: " + Object.keys(obj));
      return Object.keys(obj) }
  };
}

// ...

var o = Object.create({});
var proxy = Proxy.create(handlerMaker(o));

proxy.blabla = 12; // Thanks to the forwarding, o now has a 'blabla' property with a value of 12
o.blabla++; // just incrementing o.blabla

console.log(proxy.blabla); // prints 13: the getting operation is forwarded to o which returns 13.
