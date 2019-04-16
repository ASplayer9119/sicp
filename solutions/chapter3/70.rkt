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

; a
(define (sum pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ i j)))

(define pairs-1 (weighted-pairs integers integers sum))
(stream-ref pairs-1 0)
(stream-ref pairs-1 1)
(stream-ref pairs-1 2)
(stream-ref pairs-1 3)
(stream-ref pairs-1 4)

; b
(define (sum-2 pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ (* 2 i) (* 3 j) (* 5 i j))))

(define (divisible? x y)
  (= (remainder x y) 0))

(define pairs-2
  (stream-filter
    (lambda (pair)
      (let ((i (car pair))
            (j (cadr pair)))
        (and (not (divisible? i 2))
             (not (divisible? i 3))
             (not (divisible? i 5))
             (not (divisible? j 2))
             (not (divisible? j 3))
             (not (divisible? j 5)))))
    (weighted-pairs integers integers sum-2)))
(stream-ref pairs-2 0)
(stream-ref pairs-2 1)
(stream-ref pairs-2 2)
(stream-ref pairs-2 3)
(stream-ref pairs-2 4)
