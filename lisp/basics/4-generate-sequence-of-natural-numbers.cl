; # 4
; Define a function returning a sequence from 1 to N given N as an argument.

(defun gl$ (n) (
    cond
        ((= n 0) NIL)
        (t (append (gl$ (- n 1)) (list n)))
    )
)

(print (gl$ 15))
; => (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) 