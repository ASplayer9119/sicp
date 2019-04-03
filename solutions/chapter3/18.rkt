#lang sicp

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (has-cycle? x)
  (define visited '())
  (define (visited? x)
    (if (memq x visited)
        #t
        #f))
  (define (traverse x)
    (cond ((null? x) #f)
          ((visited? x) #t)
          (else (begin (set! visited (cons x visited))
                       (traverse (cdr x))))))
  (traverse x))

(#%provide (all-defined))
