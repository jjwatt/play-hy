import caca
import time
from caca.canvas import Canvas
from caca.display import Display, Event

class Square:
    def __init__(self, width, height, x, y):
        self.width = width
        self.height = height
        self.x = x
        self.y = y
        self.dx = 1
        self.dy = 1


if __name__ == "__main__":
    cv = Canvas()
    dp = Display(cv)
    ev = Event()

    width = cv.get_width()
    height = cv.get_height()
    square = Square(20, 10, 10, 10)
    cv.set_color_ansi(caca.COLOR_BLUE, caca.COLOR_BLACK)
    cv.fill_box(square.x, square.y, square.width, square.height, "#")

    while not dp.get_event(caca.EVENT_KEY_PRESS, ev, 0):
        cv.clear()
        square.x += square.dx
        square.y += square.dy
        if (square.x >= width - square.width) or (square.x <= 1):
            cv.set_color_ansi(caca.rand(1, 16), caca.COLOR_BLACK)
            square.dx *= -1
        if (square.y >= height - square.height) or (square.y <= 1):
            cv.set_color_ansi(caca.rand(1, 16), caca.COLOR_BLACK)
            square.dy *= -1
        cv.fill_box(square.x, square.y, square.width, square.height, "#")
        dp.refresh()
        time.sleep(0.08)

