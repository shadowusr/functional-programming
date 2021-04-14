(defun parents (x) (list (get x 'mother) (get x 'father)))

(defun set-parents (x mother father) 
    (setf (get x 'mother) mother)
    (setf (get x 'father) father)
)

(defun sis-bro-p (x1 x2) ((lambda (p1 p2) 
    (or 
        (eql (first p1) (first p2))
        (eql (second p1) (second p2))
    )
) (parents x1) (parents x2)) )

(set-parents 'person1 'sylvia 'tom)
(set-parents 'person2 'sylvia 'seth)

(print (sis-bro-p 'person1 'person2))
; => T
