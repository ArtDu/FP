(defun russian-lower-case-p (char)
  (position char "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"))

(defun whitespace-char-p (char)
  (member char '(#\Space #\Tab #\Newline)))

(defun check-word (word)
  (let ((lower nil))
  (loop for c across word do (if (or (lower-case-p c) (russian-lower-case-p c))
    (setf lower T)))
  lower))  

(defun word-transform (word)
  (if (check-word word)
            (concatenate 'string word ",")
            word))

(defun sentence-traverse (sentence)
  (let ((new-sentence "") (word ""))  
    (loop for c across sentence do 
      (if (whitespace-char-p c)
          (progn 
            (setf new-sentence (concatenate 'string new-sentence (word-transform word)))
            (setf new-sentence (concatenate 'string new-sentence (string c)))
            (setf word "")
          )
          (setf word (concatenate 'string word (string c))))
    )
  (setf new-sentence (concatenate 'string new-sentence (word-transform word)))
  new-sentence))

(defun text-traverse (text)
  (let ((new-text '()))
    (dolist (sentence text)  
      (setf new-text 
        (append new-text 
          (list 
            (sentence-traverse sentence)))))
    new-text))


(print (text-traverse '("HELLO      world." "ПРИВЕТ мир")))

