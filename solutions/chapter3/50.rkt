#lang sicp

(#%require "helpers.rkt")

(define (stream-multi-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map car argstreams))
       (apply stream-multi-map
              (cons proc (map stream-cdr argstreams))))))

(#%provide (all-defined))
