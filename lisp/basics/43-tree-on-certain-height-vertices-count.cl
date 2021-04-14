(defun v-count (tree height) (if
    (= height 1) (if (null tree) 0 1)
    ((lambda (height-1) 
        (+ (v-count (cadr tree) height-1) (v-count (caddr tree) height-1) )
    ) (1- height))
))

(print (v-count '(
1
    (2 
        (4
            ()
            (7))
        (5)
    )
    (3
        ()
        (6)
    )
) 3))
; => 3