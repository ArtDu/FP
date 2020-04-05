; s(setq animals '(gazelle giraffe lion tiger))


     


(defun add_to_hash (h word)
	; (let ((downcased (string-downcase word)))
	(setf (gethash word h) 
		(+ 1 (or (gethash word h) 0))))

; (defun iterate-through-list (h l)
;    (when l                      
;          (add_to_hash (h (car l))       
;          (iterate-through-list 
;          	h (cdr l)))))            

(defun word-counter (&aux (ht (make-hash-table)))
	; (iterate-through-list ht animals)
	(add_to_hash ht 'name)
	(gethash 'name ht))


(print (word_counter))




