#lang racket/base

(define f
  (let ((called #f))
    (lambda (arg)
      (if called
          0
          (begin (set! called #t)
                 arg)))))

(+ (f 0) (f 1))
