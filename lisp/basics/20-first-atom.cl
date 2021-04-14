(defun first-atom (list) ((lambda (head)
                                 (if (atom head) head
                                     (first-atom head))
                                 ) (car list)))

 (print (first-atom '(((((a)) b)) c d)))

; => A