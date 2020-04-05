(format t "~d~%" (random 100))

(format t "~d~%" (+ 100 201))

(format t "~r~%" (+ 100 201))

(format t "~s~%" (machine-type))

(defun print-n-randoms (n max-limit)
	(dotimes (i n)
		(format t "~r~%" (random max-limit))))

(print-n-randoms 2 100)

;(describe 'print)

(if (= 4 (* 2 2))
    (print "Don't panic")
    (print "Panic!"))

; progn - functional analog of begin, end or {}
;(if (> n 100)
;    (progn (too-large)
;	   (do-something)))
;or use

;(when (> n 10)
;  (too-large)
;  (do-something))

;(macroexpend macros)

(defvar a 0xDEADBEEF)
(print a)
