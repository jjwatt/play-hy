(import pyxel)
(defn draw-recursive-circles [x y radius color]
  (when (> radius 4)
    (pyxel.circb x y radius color)
    (draw-recursive-circles (+ x radius) y (/ radius 2) color)
    (draw-recursive-circles (- x radius) y (/ radius 2) color)
    (draw-recursive-circles x (+ y radius) (/ radius 2) color)
    (draw-recursive-circles x (- y radius) (/ radius 2) color)))
(pyxel.init 400 400)
(pyxel.cls 1)
(draw-recursive-circles 200 200 100 8)
(pyxel.show)

