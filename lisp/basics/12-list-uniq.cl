(defun uniq (list) (
        cond
            ((null (cdr list)) list)
            (t ((lambda (_first _second _tail) 
                (if (= _first _second)
                    (uniq _tail)
                    (cons _first (uniq _tail))
                )
            ) (car list) (cadr list) (cdr list)))
    )
)

(print (uniq '(1 1 1 1 2 3 3 4 5 5)))
; => (1 2 3 4 5)