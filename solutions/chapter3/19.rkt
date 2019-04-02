#lang sicp

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (has-cycle? x)
  (define (find-cycles current-node current-index last-visited-node last-index)
    (cond ((= current-index last-index) #f)
          ((eq? current-node last-visited-node) #t)
          (else (find-cycles (cdr current-node)
                             (+ 1 current-index)
                             last-visited-node
                             last-index))))
  (define (iter ls i)
    (cond ((null? ls) #f)
          ((find-cycles x 0 ls i) #t)
          (else (iter (cdr ls) (+ 1 i)))))
  (iter x 0))

(define l (list 1 2 3))
(has-cycle? l)

(append! l l)
(has-cycle? l)
