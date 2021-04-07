; # 1
; Implement funcall using apply.

(defun negative (x) (- x))

(defun myfuncall (fn &rest args) (apply fn args))
(print (myfuncall #'negative 1))
; => -1