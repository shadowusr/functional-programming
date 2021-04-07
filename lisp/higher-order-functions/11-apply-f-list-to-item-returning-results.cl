; # 11
; Define a function which works as follows: `(func '(f g ... h) x) => (list (f x) (g x) ... (h x))`.

(defun hyper-fun (flist x) 
    (mapcar (lambda (f) (funcall f x)) flist)
)

(defun negative (x) (- x))
(defun twice (x) (* 2 x))
(defun thrice (x) (* 3 x))

(print (hyper-fun (list #'negative #'twice #'thrice) 1))
; => (-1 2 3)
