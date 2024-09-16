int n = 100;
int num1 = 0;
int num2 = 1;

println(0);
println(num1 + num2);
for (int i = 0; i <= n; i++) {
  int num3 = num1 + num2;
  num1 = num2;
  num2 = num3;
  println(num3);
}
