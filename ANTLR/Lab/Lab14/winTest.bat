mkdir out
java -jar antlr.jar -no-listener -visitor Expr.g4 -o out/
cp *.java out/
javac -cp antlr.jar out/*.java
java -cp out;antlr.jar Calc %1