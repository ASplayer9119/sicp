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

(define (square x) (* x x))
(define (squares-sum pair)
  (+ (square (car pair))
     (square (cadr pair))))

(define sum-of-squares
  (weighted-pairs integers integers squares-sum))

(define (create-sum-squres-stream stream)
  (let ((s1 (stream-car stream))
        (s2 (stream-car (stream-cdr stream)))
        (s3 (stream-car (stream-cdr (stream-cdr stream)))))
    (if (= (squares-sum s1) (squares-sum s2) (squares-sum s3))
        (cons-stream (list (squares-sum s1) s1 s2 s3)
                     (create-sum-squres-stream (stream-cdr
                                                (stream-cdr
                                                  (stream-cdr stream)))))
        (create-sum-squres-stream (stream-cdr stream)))))

(define sum-squares-stream (create-sum-squres-stream sum-of-squares))

(stream-ref sum-squares-stream 0) ; 325
(stream-ref sum-squares-stream 1) ; 425
(stream-ref sum-squares-stream 2) ; 650
(stream-ref sum-squares-stream 3) ; 725
(stream-ref sum-squares-stream 4) ; 845
(stream-ref sum-squares-stream 5) ; 850
