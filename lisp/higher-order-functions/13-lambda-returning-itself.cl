; # 13
; Implement a function which returns itself

(print (
    (lambda (fun) 
        (list fun (list 'quote fun))
    )
    '(lambda (fun) 
        (list fun (list 'quote fun))
    )
))
