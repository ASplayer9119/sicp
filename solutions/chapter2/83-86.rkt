#lang racket/base

; Here I defined only needed parts for the exercise
; so it wouldn't work without the rest of the system

; Ex 2.83
(define (install-scheme-number-package)
  (put 'raise '(scheme-number)
    (lambda (x) (make-rational x 1)))
  'done)

(define (install-rational-package)
  (put 'raise '(rational)
    (lambda (x) (make-real (/ (* (numer x) 1. 0)
                              (denom x)))))
  'done)

(define (install-real-package)
  (put 'raise '(real)
    (lambda (x) (make-complex-from-real-imag x 0)))
  'done)

(define (raise x) (apply-generic 'raise x))



; Ex 2.84
(define (compare type1 type2)
  ((get 'compare (list type1)) type2))

(define (install-scheme-number-package)
  (define (compare type)
    (if (eq? type 'scheme-number)
        0
        -1))
  (put 'compare '(scheme-number) compare)
  'done)

(define (install-rational-package)
  (define (compare type)
    (cond ((eq? type 'scheme-number) 1)
          ((eq? type 'rational) 0)
          (else -1)))
  (put 'compare '(rational) compare)
  'done)

(define (install-real-package)
  (define (compare type)
    (cond ((eq? type 'complex) -1)
          ((eq? type 'real) 0)
          (else 1)))
  (put 'compare '(real) compare)
  'done)

(define (install-complex-package)
  (define (compare type)
    (if (eq? type 'complex)
        0
        1))
  (put 'compare '(complex) compare)
  'done)

(define (all-elements-of-same-type? types)
  (define (iter current-type types)
    (cond ((null? types) #t)
          ((not (eq? current-type (car types))) #f)
          (else (iter current-type (cdr types)))))
  (cond ((null? types) #t)
        ((= (length types) 1) #t)
        (else (iter (car types) (cdr types)))))

(define (find-max-type types)
  (define (iter remaining max-type)
    (cond ((null? remaining) max-type)
          ((= (compare (car remaining) max-type) 1) (iter (cdr remaining) (car remaining)))
          (else (iter (cdr remaining) max-type))))
  (iter types (car types)))

(define (convert-all-types target args)
  (define (successive-raise x)
    (if (eq? (type-tag x) target-type)
        x
        (successive-raise (raise x))))
  (map successive-raise args))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (cond (proc (apply proc (map contents args)))
            ((all-elements-of-same-type? type-tags)
             (error "No method for these types"
                    (list op type-tags)))
            (else (apply apply-generic op (convert-all-types (find-max-type type-tags) args)))))))



; Ex 2.85
(define (install-scheme-number-package)
  (put 'project '(scheme-number)
    (lambda (x) #f))
  'done)

(define (install-rational-package)
  (put 'project '(rational)
    (lambda (x)
      (make-scheme-number (round (/ (numer x) (denom x))))))
  'done)

(define (install-real-package)
  (put 'project '(rational)
    (lambda (x)
      (make-rational (round x) 1)))
  'done)

(define (install-complex-package)
  (put 'project '(complex)
    (lambda (x) (make-real (real-part x))))
  'done)

(define (project x)
  (apply-generic 'project x))

(define (drop x)
  (define (iter prev dropped)
    (cond ((not dropped) prev)
          ((equ? (raise dropped) prev) (iter dropped (project dropped)))
          (else prev)))
  (if (and (pair? x)
           (get 'project (list (type-tag x))) (get 'raise (list (type-tag x))))
      (iter x (project x))
      x))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (cond (proc (drop (apply proc (map contents args))))
            ((all-elements-of-same-type? type-tags)
             (error "No method for these types"
                    (list op type-tags)))
            (else (apply apply-generic op (convert-all-types (find-max-type type-tags) args)))))))



; Ex 2.86
(define (sine x) (apply-generic 'sine x))
(define (cosine x) (apply-generic 'cosine x))

(define (install-scheme-number-package)
  (put 'sine '(scheme-number)
    (lambda (x) (sin x)))
  (put 'cosine '(scheme-number)
    (lambda (cos x)))
  'done)

(define (install-rational-package)
  (put 'sine '(rational)
    (lambda (x) (sin (/ (* (numer x) 1.0) (denom x)))))
  (put 'cosine '(rational)
    (lambda (x) (cos (/ (* (numer x) 1.0) (denom x)))))
  'done)

(define (install-complex-package)
  (define (add-complex z1 z2)
    (make-from-real-imag (add (real-part z1) (real-part z2))
                         (add (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2)
    (make-from-real-imag (sub (real-part z1) (real-part z2))
                         (sub (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
    (make-from-mag-ang (mul (magnitude z1) (magnitude z2))
                       (add (angle z1) (angle z2))))
  (define (div-complex z1 z2)
    (make-from-mag-ang (div (magnitude z1) (magnitude z2))
                       (sub (angle z1) (angle z2))))
  'done)
