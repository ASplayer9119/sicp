#lang racket/base

(require "helpers.rkt")

; Ex 1.24
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder
            (square (expmod base (/ exp 2) m))
            m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 1009 1000)
(fast-prime? 1013 1000)
(fast-prime? 1019 1000)
(fast-prime? 10007 1000)
(fast-prime? 10009 1000)
(fast-prime? 10037 1000)
(fast-prime? 100003 1000)
(fast-prime? 100019 1000)
(fast-prime? 100043 1000)
(fast-prime? 1000003 1000)
(fast-prime? 1000033 1000)
(fast-prime? 1000037 1000)



; Ex 1.27
(define (carmichael-test n)
  (define (iter a)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (iter (+ a 1)))
          (else false)))
  (iter 1))

(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)



; Ex 1.28
(define (expmod-modified base exp m)
  (define (check-non-trivial x)
    (cond ((and (not (= x 1))
                (not (= x (- m 1)))
                (= (remainder (square x) m) 1))
           0)
          (else (remainder (square x) m))))
  (cond ((= exp 0) 1)
        ((even? exp)
          (check-non-trivial (expmod-modified base (/ exp 2) m)))
        (else
          (remainder
            (* base (expmod-modified base (- exp 1) m))
            m))))
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-modified a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (miller-rabin-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (miller-rabin-prime? n (- times 1)))
        (else false)))

(miller-rabin-prime? 561 1000)
(miller-rabin-prime? 1105 1000)
(miller-rabin-prime? 1729 1000)
(miller-rabin-prime? 2465 1000)
(miller-rabin-prime? 2821 1000)
(miller-rabin-prime? 6601 1000)
