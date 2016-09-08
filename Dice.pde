Die a;

int total = 0;
int average = 0;
int totalClicks = 0;

int numEven = 0;
int numOdd = 0;

boolean even;

boolean randomColor = false;
boolean randomScoreColor = false;

int color1 = 0;
int color2 = 255;
int color3 = 0;

int colorDie1 = 255;
int colorDie2 = 255;
int colorDie3 = 255;

void setup() {
	noLoop();
	size(700, 500);
}

void draw() {
	background(0);

	if (randomColor == true) {
		colorDie1 = (int)random(50, 255);
		colorDie2 = (int)random(50, 255);
		colorDie3 = (int)random(50, 255);
	}

	if (randomScoreColor == true) {
		color1 = (int)random(50, 255);
		color2 = (int)random(50, 255);
		color3 = (int)random(50, 255);
	}

	for (int x = 10; x < 390; x += 55) {
		for (int y = 10; y < 390; y += 55) {
			a = new Die(x, y);
			a.show();

			//total amount
			total = total + a.dieNum;
		}
	}

	if (total % 2 == 1) {
		even = false;
	} else {
		even = true;
	}

	if (even == true) {
		numEven = numEven + 1;
	} else if (even == false) {
		numOdd = numOdd + 1;
	}

	
	//text for things
	textAlign(CENTER);
	textSize(40);
	fill(255);
	text("Total: " + total, 200, 430);

	text("Evens: " + numEven, 100, 475);
	text("Odds: " + numOdd, 300, 475);


	textAlign(LEFT);
	textSize(30);
	text("Times Clicked: " + totalClicks, 400, 40);

	textAlign(CENTER);
	textSize(200);
	fill(color1, color2, color3, 200);
	text(total, 200, 275);


	//instructions
	textAlign(LEFT);
	textSize(20);
	fill(255);

	text(" Instructions: \n\n Click to roll the dice \n\n Press e to reset all stats \n\n To change TOTAL number \n color: \n r - RED \n g - GREEN \n b - BLUE \n t - RANDOM \n To change DICE color \n\n 1 - WHITE \n 2 - BLUE-GREEN \n 3 - PINK \n 4 - RANDOM ", 395, 70);

}

void mousePressed() {
	redraw();
	total = 0;

	if (totalClicks < 1000) {
		totalClicks = totalClicks + 1;
	}
}

void keyPressed () {
	if (keyPressed == true && key == 69) {
		numEven = 0;
		numOdd = 0;

		totalClicks = 0;

		total = 0;

		redraw();
	}

	if (keyPressed == true && key == 'b') {
		color1 = 0;
		color2 = 0;
		color3 = 255;
		randomScoreColor = false;
	}
	if (keyPressed == true && key == 'g') {
		color1 = 0;
		color2 = 255;
		color3 = 0;
		randomScoreColor = false;
	}
	if (keyPressed == true && key == 'r') {
		color1 = 255;
		color2 = 0;
		color3 = 0;
		randomScoreColor = false;
	}
	if (keyPressed == true && key == 't') {
		randomScoreColor = true;
	}

	if (keyPressed == true && key == '1') {
		colorDie1 = 255;
		colorDie2 = 255;
		colorDie3 = 255;
		randomColor = false;
	}
	if (keyPressed == true && key == '2') {
		colorDie1 = 0;
		colorDie2 = 255;
		colorDie3 = 200;
		randomColor = false;
	}
	if (keyPressed == true && key == '3') {
		colorDie1 = 255;
		colorDie2 = 0;
		colorDie3 = 200;
		randomColor = false;
	}
	if (keyPressed == true && key == '4') {
		randomColor = true;
	}

}


class Die {
	//variables for die
	int dieX, dieY, dieNum;

	//constructor function
	Die(int x, int y) {
		dieX = x;
		dieY = y;
	}

	void roll() {
		dieNum = (int)(Math.random() * 6) + 1;

		//dieNum = 2;

		strokeWeight(10);
		stroke(0);

		//drawing the pips
		if (dieNum == 1) {
			point(dieX + 25, dieY + 25);
		} else if (dieNum == 2) {
			point(dieX + 17.5, dieY + 17.5);
			point(dieX + 32, dieY + 32);
		} else if (dieNum == 3) {
			point(dieX + 15.5, dieY + 15.5);
			point(dieX + 25, dieY + 25);
			point(dieX + 35, dieY + 35);
		} else if (dieNum == 4) {
			point(dieX + 17.5, dieY + 17.5);
			point(dieX + 17.5, dieY + 32);
			point(dieX + 32, dieY + 32);
			point(dieX + 32, dieY + 17.5);
		} else if (dieNum == 5) {
			point(dieX + 15, dieY + 15);
			point(dieX + 15, dieY + 35);
			point(dieX + 35, dieY + 35);
			point(dieX + 35, dieY + 15);
			point(dieX + 25, dieY + 25);
		} else if (dieNum == 6) {
			point(dieX + 15, dieY + 13);
			point(dieX + 15, dieY + 37);
			point(dieX + 15, dieY + 25);
			point(dieX + 35, dieY + 25);
			point(dieX + 35, dieY + 37);
			point(dieX + 35, dieY + 13);
			
		}
	}

	void show() {
		fill(colorDie1, colorDie2, colorDie3);
		stroke(0);
		strokeWeight(1);
		rect(dieX, dieY, 50, 50, 15);
		roll();
	}
}
