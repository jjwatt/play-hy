(import pyxel)
(import hyrule [assoc])

(global WIDTH 400)
(global HEIGHT 400)
(global NUMPOINTS 5000)
(setv points [])
(let [verticies [[0 0]
                 [(/ WIDTH 2) HEIGHT]
                 [WIDTH 0]]
      p [50 50]]
  (setv j 1)
  (for [k (range NUMPOINTS)]
    (setv j (random.randint 0 2))
    (assoc p 0 (/ (+ (get p 0)
                     (get vertices j 0))
                  2))
    (assoc p 1 (/ (+ (get p 1)
                     (get vertices j 1))
                  2))
    (assoc points k [(get p 0) (get p 1)])))
(pyxel.init 400 400)
(pyxel.cls 1)
(for [k (range NUMPOINTS)]
  (let [ix (get points k 0)
        iy (get points k 1)]
    (pyxel.pset (+ (- ix) WIDTH) (+ (- iy) HEIGHT) 8)))

