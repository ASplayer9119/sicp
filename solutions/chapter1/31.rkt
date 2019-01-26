#lang racket/base

(require "helpers.rkt")

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(define (factorial n)
  (product-iter identity 1 inc n))

(define (pi-approx n)
  (define (term x)
    (if (even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (* 4 (product-iter term 1.0 inc n)))

(provide (all-defined-out))
