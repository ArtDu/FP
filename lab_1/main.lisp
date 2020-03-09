(defun take-left (n)
  (if (< n 10)
    n
    (take-left (truncate n 10))))

(defun take-right (n)
  (rem n 10))

(defun cut-right (n)
  (truncate n 10))

(defun cut-left (n z m)
  (if (< n 10)
    z
    (cut-left (truncate n 10)
      (+ z
        (*
          (expt 10 m) (rem n 10)))
      (1+ m))))

(defun palindrome-p (n)
  (if (< n 10)
    t
    (if
      (and
        (eq (take-left n) (take-right n))
        (palindrome-p (cut-left (cut-right n) 0 0 )))
      t
      nil)))
      (defun take-left (n)
        (if (< n 10)
          n
          (take-left (truncate n 10))))

      (defun take-right (n)
        (rem n 10))

      (defun cut-right (n)
        (truncate n 10))

      (defun cut-left (n z m)
        (if (< n 10)
          z
          (cut-left (truncate n 10)
            (+ z
              (*
                (expt 10 m) (rem n 10)))
            (1+ m))))
