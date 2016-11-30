var foldl = function (f, acc, array) {
    for(i = 0; i < array.length; i++){
        acc = f(acc, array[i]);
    }
    return acc;
}

console.log(foldl(function(x,y){return x+y}, 0, [1,2,3]));

var foldr = function (f, z, array) {
    var result = f(array[array.length-1], z);
    for(i = array.length-2; i >= 0; i--){
        result = f(array[i], result);
    }
    return result;
}

console.log(foldr(function(x,y){return x/y}, 1, [2,4,8]));

var map = function (f, array) {
    for(i = 0; i < array.length; i++){
        array[i] = f(array[i]);
    }
    return array;
}

console.log(map(function(x){return x+x}, [1,2,3,5,7,9,11,13]));

function Student(firstName, lastName, studentID){
    this.firstName = firstName;
    this.lastName = lastName;
    this.studentID = studentID;
}

Student.prototype.display = function() {console.log(this.firstName + " " + this.lastName + " " + this.studentID)};

var studentsArray = [new Student("Riadiani", "Marcelita", 10), new Student("Test", "Student", 20)];
studentsArray[0].graduate = true;

for(i = 0; i < studentsArray.length; i++){
    studentsArray[i].display();
}

var studentOne = {firstName: "Student", lastName: "One", studentID: 30, __proto__: Student.prototype};
studentOne.display();