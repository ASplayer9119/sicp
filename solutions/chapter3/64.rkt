#lang sicp

(#%require "helpers.rkt")

(define (average x y)
  (/ (+ x y) 2.0))
(define (sqrt-improve guess x)
  (average guess (/ x guess)))
(define (sqrt-stream x)
  (define guesses
    (cons-stream
      1.0
      (stream-map (lambda (guess) (sqrt-improve guess x))
                  guesses)))
  guesses)

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (stream-limit stream tolerance)
  (define (iter count)
    (let ((s1 (stream-ref stream count))
          (s2 (stream-ref stream (+ count 1))))
      (if (< (abs (- s2 s1)) tolerance)
          s2
          (iter (+ count 1)))))
  (iter 0))

(#%provide sqrt)
