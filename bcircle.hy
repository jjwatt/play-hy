(import pyxel)

(defn bcircle [center-x center-y radius]
  (setv x radius)
  (setv y 0)
  (setv err 0)
  (setv points [])
  (while (>= x y)
    ;; Plot 8 points symmetrical points
    (points.extend [[(+ center-x x) (+ center-y y)]
                    [(+ center-x y) (+ center-y x)]
                    [(- center-x y) (+ center-y x)]
                    [(- center-x x) (+ center-y y)]
                    [(- center-x x) (- center-y y)]
                    [(- center-x y) (- center-y x)]
                    [(+ center-x y) (- center-y x)]
                    [(+ center-x x) (- center-y y)]])
    (setv y (+ 1 y))
    (setv err (+ err (+ 1 (* 2 y))))
    (cond (> (+ 1 (* 2 (- err x))) 0)
        (do (setv x (- x 1))
            (setv err (+ err (- 1 (* 2 x)))))))
  points)

(defn draw-circle [x y radius color]
  (let [points (bcircle x y radius)]
    (for [p points]
      (pyxel.pset (get p 0) (get p 1) color))))

(defn draw-recursive-circles [x y radius color]
  (when (> radius 4)
    (draw-circle x y radius color)
    (draw-recursive-circles (+ x radius) y (/ radius 2) color)
    (draw-recursive-circles (- x radius) y (/ radius 2) color)
    (draw-recursive-circles x (+ y radius) (/ radius 2) color)
    (draw-recursive-circles x (- y radius) (/ radius 2) color)))

(pyxel.init 400 400)
(pyxel.cls 1)
(draw-recursive-circles 200 200 100 8)
(pyxel.show)
