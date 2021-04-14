(defun has-p (list item) (cond
    ((null list) NIL)
    ((= item (car list)) t)
    (t (has-p (cdr list) item))
))

(defun set-p (list) (if (null list) 
    t
    (and (not (has-p (cdr list) (car list))) (set-p (cdr list)))
    )
)

(print (set-p '(1 2 3 4 5 6 0 9 99)))
; => T
(print (set-p '(1 2 3 4 5 6 0 1 99)))
; => NIL