; #3
; Implement a function apl-apply which applies every function fi from list f to every elemnt xi from list x. It should return a list of results.

(defun negative (x) (- x))
(defun twice (x) (* 2 x))
(defun thrice (x) (* 3 x))

(defun apl-apply (f x) (if (not (null f)) (cons (funcall (car f) (car x)) (apl-apply (cdr f) (cdr x)))))

(print (apl-apply (list #'negative #'twice #'thrice) '(1 1 1)))
; => (-1 2 3)