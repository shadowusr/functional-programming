(defun onion (n &optional (m n)) (if (= n 1) 
                                     (list m)
                                     (list (onion (- n 1) m))))

(print (onion 5))

; => (((((5)))))