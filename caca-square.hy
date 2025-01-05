(import caca)
(import time)
(import caca.canvas [Canvas])
(import caca.display [Display Event])

(defclass Square []
  (defn __init__ [self width height x y]
    (setv self.width width)
    (setv self.height height)
    (setv self.x x)
    (setv self.y y)
    (setv self.dx 1)
    (setv self.dy 1)))

(setv cv (Canvas))
(setv dp (Display cv))
(setv ev (Event))

(setv width (cv.get_width))
(setv height (cv.get_height))
(setv square (Square 20 10 10 10))
(cv.set_color_ansi caca.COLOR_BLUE caca.COLOR_BLACK)
(cv.fill_box square.x square.y square.width square.height "#")

(while (not (dp.get_event caca.EVENT_KEY_PRESS ev 0))
  (cv.clear)
  (setv square.x (+ square.x square.dx))
  (setv square.y (+ square.y square.dy))
  (cond
    (or (>= square.x (- width square.width)) (<= square.x 0))
      (do
        (cv.set_color_ansi (caca.rand 1 16) caca.COLOR_BLACK)
        (setv square.dx (* square.dx -1)))
    (or (>= square.y (- height square.height)) (<= square.y 0))
      (do
        (cv.set_color_ansi (caca.rand 1 16) caca.COLOR_BLACK)
        (setv square.dy (* square.dy -1))))
  (cv.fill_box square.x square.y square.width square.height "#")
  (dp.refresh)
  (time.sleep 0.08))

