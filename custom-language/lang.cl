(setq y 0 x 0)

(defun printField (&optional (i -5) (j -5)) (cond
    ((and (eq i 5) (eq j 5)) (progn (if (and (eq i y) (eq j x)) (princ "#") (princ ".")) (prog1 (terpri) (terpri)))) 
    ((eq j 5) (progn (if (and (eq i y) (eq j x)) (princ "#") (princ ".")) (terpri) (printField (1+ i) -5)))
    (t (progn (if (and (eq i y) (eq j x)) (princ "#") (princ ".")) (printField i (1+ j))))
))

(defmacro $ (&rest args))

(defmacro up (&rest args) `(if (eq y -5) (setq y 5) (setq y (1- y)) ) )
(defmacro down (&rest args) `(if (eq y 5) (setq y -5) (setq y (1+ y)) ) )
(defmacro left (&rest args) `(if (eq x -5) (setq x 5) (setq x (1- x)) ) )
(defmacro right (&rest args) `(if (eq x 5) (setq x -5) (setq x (1+ x)) ) )
(defmacro show () `(printField))

(if (null *args*) 
    (progn
        (format t "File to interpret was not provided, exiting. Re-run interpreter and provide code file name as follows:")
        (terpri)
        (format t "> clisp lang.cl code.txt")
        (exit)
    )
)

(with-open-file (stream (car *args*))
    (do ((line (read-line stream nil)))
        ((null line))
        (eval (read-from-string (format nil "(~A)" line)))
        (setq line (read-line stream nil))
    )  
)
