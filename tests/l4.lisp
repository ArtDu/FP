(defun array-manip (arr)
  (let ((n (car (array-dimensions arr)))
      (m (car (cdr (array-dimensions arr)))))
    (print n)
    (print m)))
    



(array-manip #2A((1 2 3) (4 5 6) (7 8 9) (10 11 12)))