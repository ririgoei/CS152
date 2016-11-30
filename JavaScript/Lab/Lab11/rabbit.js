"use strict";
var name1 = "Monty";
function Rabbit(name) {
    this.name = name;
}
var r = new Rabbit("Python");
console.log(r.name); // ERROR!!!
console.log(name1); // Prints "Python"
