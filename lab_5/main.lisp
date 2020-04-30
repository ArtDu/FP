(defclass polynom ()
  ((polynom-symbol :initarg :var1 :reader var1)
  ;; Разреженный список термов в порядке убывания степени
   (term-list :initarg :terms :reader terms)
  )
)

(defun order (term) (first term))
(defun coeff (term) (second term))

(defun make-term (&key order coeff)
    (list order coeff)
)

(defgeneric zerop1 (arg)
 (:method ((n number))   ; (= n 0)
  (zerop n)))

(defgeneric minusp1 (arg)
 (:method ((n number))   ; (< n 0)
  (minusp n)))

(defmethod print-object ((p polynom) stream)
  (format stream "~:{~:[~:[+~;-~]~d~[~2*~;~s~*~:;~s^~d~]~;~]~}"
          (mapcar (lambda (term)
                    (list (zerop1 (coeff term))
                          (minusp1 (coeff term))
                          (if (minusp1 (coeff term))
                              (abs (coeff term))
                              (coeff term))
                          (order term)
                          (var1 p)
                          (order term)))
                  (terms p))))


(defgeneric sub2 (arg1 arg2)
 (:method ((n1 number) (n2 number))
  (- n1 n2)))

(defun traverse-lists (ans l1 l2)
  (if (and l1 l2)
    (let ((order1 (car (car l1)))
          (order2 (car (car l2)))
          (coeff1 (car (cdr (car l1))))
          (coeff2 (car (cdr (car l2)))))
      (if (= order1 order2)
        (progn 
         (push (list order1 (- coeff1 coeff2)) ans)
         ; (print ans)
         (setf ans (traverse-lists ans (cdr l1) (cdr l2))))
        (if (< order1 order2)
          (progn 
            (push (list order2 (- coeff2)) ans)
            ; (print ans)
            (setf ans (traverse-lists ans l1 (cdr l2))))
          (progn 
            (push (list order1 coeff1) ans)
            ; (print ans)
            (setf ans (traverse-lists ans (cdr l1) l2)))
          )))
    (if l1
      (let ((order1 (car (car l1)))
            (coeff1 (car (cdr (car l1)))))
          (push (list order1 coeff1) ans)
          (setf ans (traverse-lists ans (cdr l1) l2)))
      (if l2
        (let ((order2 (car (car l2)))
            (coeff2 (car (cdr (car l2)))))
            (push (list order2 (- coeff2)) ans)
            (setf ans (traverse-lists ans l1 (cdr l2) ))))
    ))
  ans)


(defun sub2-aux (p1 p2)
  (let ((ans NIL))
    (reverse (traverse-lists ans (terms p1) (terms p2)))))

(defmethod sub2 ((p1 polynom) (p2 polynom))
  (let ((ans (make-instance 'polynom
                :var1 'x
                :terms (sub2-aux p1 p2))))
    ans))

; ; 5x^2 + 3.3x
; (defvar p1 (make-instance 'polynom
;           :var1 'x
;           :terms (list (make-term :order 2 :coeff 5)
;                        (make-term :order 1 :coeff 3.3)
;                        )))
; ; 4x^3 + 7x^2 + 2.3x - 7
; (defvar p2 (make-instance 'polynom
;           :var1 'x
;           :terms (list  (make-term :order 3 :coeff 4) 
;                         (make-term :order 2 :coeff 7)
;                         (make-term :order 1 :coeff 2.3)
;                         (make-term :order 0 :coeff -7)
;                         )))

; (print p1)
; (print p2)
; (print (sub2 p1 p2))