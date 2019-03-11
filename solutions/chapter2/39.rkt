#lang racket/base

(require "38.rkt")

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(provide (all-defined-out))
