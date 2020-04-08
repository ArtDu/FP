(defun find-elem-in-list (l elem)
  (when l
    (if (= (car l) elem)
      t
      (find-elem-in-list (cdr l) elem))))

(defun traverse-array (ans arr lst n m i j) 
  (if (< i n)
    (if (< j m)
      (progn
        (if (and (= (rem (+ i j) 2) 0) (find-elem-in-list lst (aref arr i j)))
          (setf (aref ans i j) 0) 
          (setf (aref ans i j) (aref arr i j)))
        (traverse-array ans arr lst n m i (+ 1 j)))
      (traverse-array ans arr lst n m (+ 1 i) 0)
      )
    t))

(defun array-manip (A lis)
  (let* ((n (car (array-dimensions A)))
      (m (car (cdr (array-dimensions A))))
      (ans (make-array (list n m))))
    (traverse-array ans A lis n m 0 0)
    ans))

;(print (array-manip #2A((1 2 3) (4 5 6) (7 8 9)) '(1 2 3 4 5)))
;(print (array-manip #2A((1 2 3) (7 8 9)) '(7 9))
