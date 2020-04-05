(defun add-to-hash (h word)
	(setf (gethash word h)
		(+ 1 (or (gethash word h) 0))))

(defun iterate-through-list (h l)
   (when l                      
         (add-to-hash h (car l))       
         (iterate-through-list 
         	h (cdr l))))     

(defun word_counter (l &aux (ht (make-hash-table)))
	(iterate-through-list ht l)
	(let ((results (list)))
	    (maphash #'(lambda (key val)
	                 (setf results
	                       (append results
	                               (list (list key val)))))
	             ht)
	    results))

;(print (word_counter '(A B A B A C A)))
;(print (word_counter '(НИ ТО НИ СЁ)))


