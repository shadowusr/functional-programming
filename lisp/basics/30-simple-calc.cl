(defun compute (list) (if (atom list)
                          list
                          (eval (list (cadr list) (compute (car list)) (compute (caddr list))))
                          ))

(print (compute '((2 * 3) + (2 * (1 + (1 + 1))))))

; => 12