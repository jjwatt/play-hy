(import random)
(import caca)
(import caca.canvas [Canvas])
(import caca.display [Display Event])
(import hyrule [assoc])

(setv cv (Canvas))
(setv dp (Display cv))
(setv ev (Event))

(setv NUMPOINTS 100)
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

(cv.set_color_ansi caca.COLOR_BLUE caca.COLOR_BLACK)
(while (not (dp.get_event caca.EVENT_KEY_PRESS ev 0))
  (for [k (range NUMPOINTS)]
    (let [ix (get points k 0)
          iy (get points k 1)]
      (cv.put_char (+ (- ix) WIDTH) (+ (- iy) HEIGHT) 8)))
  (dp.refresh))
