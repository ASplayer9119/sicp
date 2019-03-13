#lang sicp

(#%require sicp-pict)

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))



; Ex 2.44
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))



(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4 painter)))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))



; Ex 2.45
(define (split current-combiner next-combiner)
  (define (inner painter n)
    (if (= n 0)
        painter
        (let ((smaller (inner painter (- n 1))))
          (current-combiner painter (next-combiner smaller smaller)))))
  inner)

(define right-split-2 (split beside below))
(define up-split-2 (split below beside))



(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                (scale-vect (ycor-vect v) (edge2-frame frame))))))



; Ex 2.46
(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect x y)
  (let ((x1 (xcor-vect x))
        (x2 (xcor-vect y))
        (y1 (ycor-vect x))
        (y2 (ycor-vect y)))
    (make-vect (+ x1 x2) (+ y1 y2))))
(define (sub-vect x y)
  (let ((x1 (xcor-vect x))
        (x2 (xcor-vect y))
        (y1 (ycor-vect x))
        (y2 (ycor-vect y)))
    (make-vect (- x1 x2) (- y1 y2))))
(define (scale-vect x s)
  (let ((x1 (xcor-vect x))
        (y1 (ycor-vect x)))
    (make-vect (* s x1) (* s y1))))



; Ex 2.47
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame x)
  (car x))
(define (edge1-frame x)
  (cadr x))
(define (edge2-frame x)
  (caddr x))

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame-2 x)
  (car x))
(define (edge1-frame-2 x)
  (cadr x))
(define (edge2-frame-2 x)
  (cddr x))



; Ex 2.48
(define (make-segment start end)
  (cons start end))
(define (start-segment x)
  (car x))
(define (end-segment x)
  (cdr x))



; Ex 2.49
(define v1 (make-vect 0 0))
(define v2 (make-vect 0 0.9))
(define v3 (make-vect 0.9 0))
(define v4 (make-vect 0.9 0.9))
(define v5 (make-vect 0.5 0))
(define v6 (make-vect 0 0.5))
(define v7 (make-vect 1 0.5))
(define v8 (make-vect 0.5 1))

(define s1 (make-segment v1 v2))
(define s2 (make-segment v1 v3))
(define s3 (make-segment v2 v4))
(define s4 (make-segment v3 v4))
(define s5 (make-segment v1 v4))
(define s6 (make-segment v2 v3))
(define s7 (make-segment v5 v7))
(define s8 (make-segment v7 v8))
(define s9 (make-segment v8 v6))
(define s10 (make-segment v6 v5))

; a
(define frame-drawer (segments->painter (list s1 s2 s3 s4)))
(paint frame-drawer)

; b
(define x-drawer (segments->painter (list s5 s6)))
(paint x-drawer)

; c
(define diamond-drawer (segments->painter (list s7 s8 s9 s10)))
(paint diamond-drawer)

; d
; annoying...
; I took this solution from http://www.billthelizard.com/2011/10/sicp-249-defining-primitive-painters.html

(define wave-drawer
  (segments->painter
    (list
       (make-segment
   (make-vect 0.006 0.840)
   (make-vect 0.155 0.591))
  (make-segment
   (make-vect 0.006 0.635)
   (make-vect 0.155 0.392))
  (make-segment
   (make-vect 0.304 0.646)
   (make-vect 0.155 0.591))
  (make-segment
   (make-vect 0.298 0.591)
   (make-vect 0.155 0.392))
  (make-segment
   (make-vect 0.304 0.646)
   (make-vect 0.403 0.646))
  (make-segment
   (make-vect 0.298 0.591)
   (make-vect 0.354 0.492))
  (make-segment
   (make-vect 0.403 0.646)
   (make-vect 0.348 0.845))
  (make-segment
   (make-vect 0.354 0.492)
   (make-vect 0.249 0.000))
  (make-segment
   (make-vect 0.403 0.000)
   (make-vect 0.502 0.293))
  (make-segment
   (make-vect 0.502 0.293)
   (make-vect 0.602 0.000))
  (make-segment
   (make-vect 0.348 0.845)
   (make-vect 0.403 0.999))
  (make-segment
   (make-vect 0.602 0.999)
   (make-vect 0.652 0.845))
  (make-segment
   (make-vect 0.652 0.845)
   (make-vect 0.602 0.646))
  (make-segment
   (make-vect 0.602 0.646)
   (make-vect 0.751 0.646))
  (make-segment
   (make-vect 0.751 0.646)
   (make-vect 0.999 0.343))
  (make-segment
   (make-vect 0.751 0.000)
   (make-vect 0.597 0.442))
  (make-segment
   (make-vect 0.597 0.442)
   (make-vect 0.999 0.144)))))

(paint wave-drawer)


; There is some incompatibility between functions provided by sicp package and ones that were given in the book (e.g. args of transform-painter func)
(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (shrink-to-upper-right painter)
  (transform-painter
    painter (make-vect 0.5 0.5)
    (make-vect 1.0 0.5) (make-vect 0.5 1.0)))

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (squash-inwards painter)
  (transform-painter painter
                     (make-vect 0.0 0.0)
                     (make-vect 0.65 0.35)
                     (make-vect 0.35 0.65)))

(define (beside-2 painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
            (transform-painter
              painter1
              (make-vect 0.0 0.0)
              split-point
              (make-vect 0.0 1.0)))
          (paint-right
            (transform-painter
              painter2
              split-point
              (make-vect 1.0 0.0)
              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-left frame)))))


; Ex 2.50
(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))



; Ex 2.51
(define (below-2 painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
            (transform-painter
              painter1
              (make-vect 0.0 0.0)
              (make-vect 1.0 0.0)
              split-point))
          (paint-top
            (transform-painter
              painter2
              split-point
              (make-vect 1.0 0.5)
              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

(define (below-3 painter1 painter2)
  (rotate90 (beside-2 (rotate270 painter1)
                      (rotate270 painter2))))



; Ex 2.52
; a
(define wave-smile-drawer
  (segments->painter
    (list
       (make-segment
   (make-vect 0.006 0.840)
   (make-vect 0.155 0.591))
  (make-segment
   (make-vect 0.006 0.635)
   (make-vect 0.155 0.392))
  (make-segment
   (make-vect 0.304 0.646)
   (make-vect 0.155 0.591))
  (make-segment
   (make-vect 0.298 0.591)
   (make-vect 0.155 0.392))
  (make-segment
   (make-vect 0.304 0.646)
   (make-vect 0.403 0.646))
  (make-segment
   (make-vect 0.298 0.591)
   (make-vect 0.354 0.492))
  (make-segment
   (make-vect 0.403 0.646)
   (make-vect 0.348 0.845))
  (make-segment
   (make-vect 0.354 0.492)
   (make-vect 0.249 0.000))
  (make-segment
   (make-vect 0.403 0.000)
   (make-vect 0.502 0.293))
  (make-segment
   (make-vect 0.502 0.293)
   (make-vect 0.602 0.000))
  (make-segment
   (make-vect 0.348 0.845)
   (make-vect 0.403 0.999))
  (make-segment
   (make-vect 0.602 0.999)
   (make-vect 0.652 0.845))
  (make-segment
   (make-vect 0.652 0.845)
   (make-vect 0.602 0.646))
  (make-segment
   (make-vect 0.602 0.646)
   (make-vect 0.751 0.646))
  (make-segment
   (make-vect 0.751 0.646)
   (make-vect 0.999 0.343))
  (make-segment
   (make-vect 0.751 0.000)
   (make-vect 0.597 0.442))
  (make-segment
   (make-vect 0.597 0.442)
   (make-vect 0.999 0.144))
  (make-segment
   (make-vect 0.395 0.916)
   (make-vect 0.410 0.916))
  (make-segment
   (make-vect 0.376 0.746)
   (make-vect 0.460 0.790))
  )))

(paint wave-smile-drawer)

; b
(define (corner-split2 painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split2 einstein 2))

; c
(define (square-limit2 painter n)
  (let ((combine4 (square-of-four identity flip-vert rotate270 flip-vert)))
    (combine4 (corner-split painter n))))
