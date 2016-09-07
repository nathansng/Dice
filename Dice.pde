Die a;

int total = 0;
int average = 0;

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

			//total amount
			total = total + a.dieNum;
		}
	}

	
	//text for things
	textAlign(CENTER);
	text("Total: " + total, 200, 450);
}

void mousePressed() {
	redraw();
	total = 0;
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
