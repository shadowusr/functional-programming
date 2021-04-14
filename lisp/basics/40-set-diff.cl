(defun has-p (list item) (cond
    ((null list) NIL)
    ((= item (car list)) t)
    (t (has-p (cdr list) item))
))

(defun sub (set1 set2)
    ((lambda (head1 tail1) (cond
        ((null set1) NIL)
        ((has-p set2 head1) (sub tail1 set2))
        (t (cons head1 (sub tail1 set2)))
    )) (car set1) (cdr set1))
)
(print "============== TASK 40 ==============")
(print (sub '(1 2 3 4 5) '(2 3)))
; => (1 4 5)
