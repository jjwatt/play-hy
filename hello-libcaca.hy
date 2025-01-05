(import caca)
(import sys)
(import caca.canvas [Canvas])
(import caca.display [Display Event])

(setv cv (Canvas))
(setv dp (Display cv))
(setv ev (Event))

(while (not (dp.get_event caca.EVENT_KEY_PRESS ev 0))
  (cv.draw_box 0 0 (cv.get_width) (cv.get_height) "#")
  (dp.refresh))
