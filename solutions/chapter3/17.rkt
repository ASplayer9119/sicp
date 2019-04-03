#lang sicp

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define x (cons 'a 'b))
(define y (cons 'c 'd))
(define z (cons 'e 'f))
(define e1 (cons x x))
(define e2 (cons x (cons 'a y)))
(define e3 (cons (cons y y) (cons y y)))
(define e4 (list 'a 'b 'c))
(set-cdr! e4 e4)

(count-pairs e1) ; 3
(count-pairs e2) ; 4
(count-pairs e3) ; 7

(define (correct-count-pairs x)
  (define visited '())
  (define (visited? x)
    (if (memq x visited)
        #t
        #f))
  (define (traverse x)
    (if (or (not (pair? x)) (visited? x))
        0
        (begin (set! visited (cons x visited))
               (+ (traverse (car x))
                  (traverse (cdr x))
                  1))))
  (traverse x))

(#%provide (all-defined))
