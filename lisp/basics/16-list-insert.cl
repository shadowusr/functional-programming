(defun insert (list1 list2 offset) (if
    (= offset 0)
    (append list2 list1)
    (cons (car list1) (insert (cdr list1) list2 (1- offset)))
))

(print (insert '(1 2 3 4) '(5 6 7) 2))
; => (1 2 5 6 7 3 4) 