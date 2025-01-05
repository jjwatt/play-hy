import caca
import sys

from caca.canvas import Canvas
from caca.display import Display, Event


if __name__ == "__main__":
    cv = Canvas()
    dp = Display(cv)
    ev = Event()

    width = cv.get_width()
    height = cv.get_height()

    while not dp.get_event(caca.EVENT_KEY_PRESS, ev, 0):
        cv.draw_box(0, 0, width, height, '#')
        dp.refresh()

    print(f"width: {width}")
    print(f"height: {height}")
