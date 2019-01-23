#lang racket/base

(require "helpers.rkt")

; Ex 1.21
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= (smallest-divisor n) n))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)



; Ex 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-timed-prime-test n (runtime)))
(define (start-timed-prime-test n start-time)
  (cond ((prime? n)
         (report-prime (- (runtime) start-time)))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a b)
  (define (iter n)
    (cond ((> n b) (display "\nend\n"))
          ((even? n) (iter (+ n 1)))
          ((timed-prime-test n) (iter (+ n 1)))
          (else (iter (+ n 1)))))
  (iter a))

(search-for-primes 1000 1025)
; 1009 1013 1019
(search-for-primes 10000 10050)
; 10007 10009 10037
(search-for-primes 100000 100050)
; 100003 100019 100043
(search-for-primes 1000000 1000050)
; 1000003 1000033 1000037


; Ex 1.23
(define (next x)
  (if (= x 2) 3 (+ x 2)))

(define (smallest-divisor-modified n)
  (find-divisor-modified n 2))
(define (find-divisor-modified n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-modified n (next test-divisor)))))

(smallest-divisor-modified 1009)
(smallest-divisor-modified 1013)
(smallest-divisor-modified 1019)
(smallest-divisor-modified 10007)
(smallest-divisor-modified 10009)
(smallest-divisor-modified 10037)
(smallest-divisor-modified 100003)
(smallest-divisor-modified 100019)
(smallest-divisor-modified 100043)
(smallest-divisor-modified 1000003)
(smallest-divisor-modified 1000033)
(smallest-divisor-modified 1000037)
