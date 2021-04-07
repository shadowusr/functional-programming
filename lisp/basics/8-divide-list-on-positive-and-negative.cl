; # 8
; Implement a function to divide a list into two: 
; list of positive elements and list of negative.

(defun GG (lst)
    (if (null lst) (list NIL NIL)
    ((lambda (x result)
        ((lambda (negatives positives)
            (cond
                ((> x 0) (list negatives (cons x positives)) )
                (t (list (cons x negatives) positives))
            )
        ) (car result) (cadr result))
    ) (car lst) (GG (cdr lst))))
)

(print (GG '(1 -2 12 -4 3)))
; => ((-2 -4) (1 12 3)) 