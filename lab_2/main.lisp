(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-recursively (list)
   (when list                            ; do-again-test
         (print (car list))              ; body
         (print-elements-recursively     ; recursive call
          (cdr list))))                  ; next-step-expression
     
(print-elements-recursively animals)