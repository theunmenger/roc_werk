size(1000, 1000);



ellipse(width / 2, height / 2, 750, 400);

fill(255, 0, 255);
arc(width / 2, height / 2, 750, 400,  PI+(QUARTER_PI * 3), TWO_PI );

String a = "ovaal met een taartpunt";
textSize(64);
text(a, width / 2 - 300, height / 2 + 300);
