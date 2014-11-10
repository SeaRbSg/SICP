; a.)  If we coerce a complex number to become a complex number, the tag remains the same
;      and next time the procedure is applied it will try to coerce it again. So, if we call
;      exp with two complex numbers as arguments, the procedure will enter an infinate loop.

; b.)  apply-generic will work as-is. When the coercion prodedure is looked up in the table
;      and none is found, it will cause an error to occurr.

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    (error "No method for these types" (list op type-tags))
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2
                             (apply-generic op (t1->t2 a1) a2))
                            (t2->t1
                             (apply-generic op a1 (t2->t1 a2)))
                            (else
                             (error "No method for these types" (list op type-tags)))))))
              (error "No method for these types" (list op type-tags)))))))
                
