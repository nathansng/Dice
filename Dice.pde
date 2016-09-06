Die a;

void setup() {
	noLoop();
	size(400, 500);
}

void draw() {
	background(0);

	for (int x = 10; x < 390; x += 55) {
		for (int y = 10; y < 390; y += 55) {
			a = new Die(x, y);
			a.show();
		}
	}
	
}

void mousePressed() {
	redraw();
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

		//dieNum = 1;

		strokeWeight(10);
		stroke(0);

		if (dieNum == 1) {
			point(dieX + 25, dieY + 25);
		}
	}

	void show() {
		fill(255);
		stroke(0);
		strokeWeight(1);
		rect(dieX, dieY, 50, 50, 15);
		roll();
	}
}
