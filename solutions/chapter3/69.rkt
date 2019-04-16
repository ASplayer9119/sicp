#lang sicp

(#%require "helpers.rkt")

(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (interleave
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (triples s t u)
  (let ((s1 (stream-car s))
        (t1 (stream-car t))
        (u1 (stream-car u)))
    (cons-stream
      (list s1 t1 u1)
      (interleave
        (stream-map (lambda (x) (cons s1 x))
                    (pairs t (stream-cdr u)))
        (triples (stream-cdr s) (stream-cdr t) (stream-cdr u))))))

(define (square x) (* x x))

(define pythagorean-triples
  (stream-filter
    (lambda (x)
      (let ((i (car x))
            (j (cadr x))
            (k (caddr x)))
        (= (+ (square i) (square j))
           (square k))))
    (triples integers integers integers)))

(stream-ref pythagorean-triples 0) ; (3 4 5)
(stream-ref pythagorean-triples 1) ; (6 8 10)
(stream-ref pythagorean-triples 2) ; (5 12 13)
