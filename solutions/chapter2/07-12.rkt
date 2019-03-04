#lang racket/base

(define (make-interval a b) (cons a b))

; Ex 2.7
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

; Ex 2.8
(define (sub-interval x y)
  (add-interval
    x
    (make-interval (- (upper-bound y))
                   (- (lower-bound y)))))

; Ex 2.10
(define (div-interval-zero-check x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "interval that you trying to divide by spans zero")
      (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))

; Ex 2.11
(define (positive? x)
  (>= x 0))

(define (negative? x)
  (< x 0))

(define (mul-interval-mod x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond ((and (positive? x1) (positive? x2) (positive? y1) (positive? y2))
           (make-interval (* x1 y1) (* x2 y2)))
          ((and (positive? x1) (positive? x2) (negative? y1) (positive? y2))
           (make-interval (* x2 y1) (* x2 y2)))
          ((and (positive? x1) (positive? x2) (negative? y1) (negative? y2))
           (make-interval (* x2 y1) (* x1 y2)))
          ((and (negative? x1) (positive? x2) (positive? y1) (positive? y2))
           (make-interval (* x1 y2) (* x2 y2)))
          ((and (negative? x1) (negative? x2) (negative? y1) (negative? y2))
           (make-interval (* x2 y2) (* x1 y1)))
          ((and (negative? x1) (positive? x2) (negative? y1) (negative? y2))
           (make-interval (* x2 y1) (* x1 y1)))
          ((and (negative? x1) (negative? x2) (positive? y1) (positive? y2))
           (make-interval (* x1 y2) (* x2 y1)))
          ((and (negative? x1) (negative? x2) (negative? y1) (positive? y2))
           (make-interval (* x1 y2) (* x1 y1)))
          (else
           (make-interval (min (* x1 y2) (* x2 y1))
                          (max (* x1 y1) (* x2 y2)))))))

; Ex 2.12
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (let ((p (* center (/ percent 100))))
    (make-interval (- center p)
                   (+ center p))))

(define (percent x)
  (let ((c (center x))
        (w (width x)))
    (/ (* 100 w) c)))
