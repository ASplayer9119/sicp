#lang sicp

(#%require "helpers.rkt")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define factorials
  (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(#%provide factorials)
