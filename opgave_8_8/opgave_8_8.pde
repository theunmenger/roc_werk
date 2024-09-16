long n = 100;
long num1 = 0;
long num2 = 1;

println(0);
println(num1 + num2);
for (int i = 0; i <= n; i++) {
  long num3 = num1 + num2;
  num1 = num2;
  num2 = num3;
  println(num3);
}
