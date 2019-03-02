#lang racket/base

(require rackunit
         rackunit/text-ui
         "03.rkt")

(define p1 (make-point 0 0))
(define p2 (make-point 3 0))
(define p3 (make-point 0 2))
; (define p4 (make-point 3 2))
(define a (make-segment p1 p2))
(define b (make-segment p1 p3))
; (define a2 (make-segment p3 p4))
(define rect1 (make-rect a b))
; (define rect2 (make-rect a a2))

(define rect1-test
  (test-suite
    "rect1-test"
    (test-case
      "it should correctly calculate area"
      (check-equal? (area rect1) 6))
    (test-case
      "it should correctly calculate perimeter"
      (check-equal? (perimeter rect1) 10))))

(run-tests rect1-test)

; (define rect2-test
;   (test-suite
;     "rect2-test"
;     (test-case
;       "it should correctly calculate area"
;       (check-equal? (area rect2) 6))
;     (test-case
;       "it should correctly calculate perimeter"
;       (check-equal? (perimeter rect2) 10))))

; (run-tests rect2-test)
