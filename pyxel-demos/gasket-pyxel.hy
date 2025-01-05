(import random)
(import pyxel)
(import hyrule [assoc])

(setv WIDTH 400)
(setv HEIGHT 400)
(setv NUMPOINTS 10000)
(setv points [])
(setv WIDTH (cv.get_width))
(setv HEIGHT (cv.get_height))

(let [verticies [[0 0]
                 [(/ WIDTH 2) HEIGHT]
                 [WIDTH 0]]
      p [50 50]]
  (setv j 1)
  (for [k (range NUMPOINTS)]
    ;; (print f"k: {k}")
    (setv j (random.randint 0 2))
    (assoc p 0 (/ (+ (get p 0)
                     (get verticies j 0))
                  2))
    (assoc p 1 (/ (+ (get p 1)
                     (get verticies j 1))
                  2))
    (.append points [(get p 0) (get p 1)])))
(pyxel.init 400 400)
(pyxel.cls 1)
(for [k (range NUMPOINTS)]
  (let [ix (get points k 0)
        iy (get points k 1)]
    (pyxel.pset (+ (- ix) WIDTH) (+ (- iy) HEIGHT) 8)))
(pyxel.show)
