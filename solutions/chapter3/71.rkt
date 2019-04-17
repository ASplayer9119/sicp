#lang sicp

(#%require "helpers.rkt")

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< (weight s1car) (weight s2car))
                  (cons-stream s1car
                               (merge-weighted (stream-cdr s1) s2 weight)))
                 ((> (weight s1car) (weight s2car))
                  (cons-stream s2car
                               (merge-weighted s1 (stream-cdr s2) weight)))
                 (else
                  (cons-stream s1car
                               (merge-weighted (stream-cdr s1)
                                               s2
                                               weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define (cube x) (* x x x))
(define (cube-sum pair)
  (+ (cube (car pair)) (cube (cadr pair))))

(define sum-of-cubes (stream-map cube-sum
                                (weighted-pairs integers integers cube-sum)))

(define (ramanujan s)
  (if (= (stream-car s) (stream-car (stream-cdr s)))
      (cons-stream (stream-car s) (ramanujan (stream-cdr (stream-cdr s))))
      (ramanujan (stream-cdr s))))
(define ramanujan-nums (ramanujan sum-of-cubes))

(stream-ref ramanujan-nums 0) ; 1729
(stream-ref ramanujan-nums 1) ; 4104
(stream-ref ramanujan-nums 2) ; 13822
(stream-ref ramanujan-nums 3) ; 20683
(stream-ref ramanujan-nums 4) ; 32832
(stream-ref ramanujan-nums 5) ; 39312
