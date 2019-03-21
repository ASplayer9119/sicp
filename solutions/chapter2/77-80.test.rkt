#lang racket/base

(require rackunit
         rackunit/text-ui
         "77-80.rkt")

(install-scheme-number-package)
(install-rational-package)
(install-rectangular-package)
(install-polar-package)
(install-complex-package)

(define magnitude-test
  (test-suite
    "magnitude"
    (test-case
      "it should return magnitude of complex number"
      (check-equal? (magnitude (make-complex-from-real-imag 3 4))
                    5))))

(define scheme-number-test
  (test-suite
    "scheme-number"
    (test-case
      "it should handle ordinary numbers without type tag"
      (check-equal? (make-scheme-number 8) 8)
      (check-equal? (type-tag (make-scheme-number 8)) 'scheme-number)
      (check-equal? (contents (make-scheme-number 8)) 8)
      (check-equal? (add (make-scheme-number 8) (make-scheme-number 7)) 15))))

(define equ?-test
  (test-suite
    "equ?"
    (test-case
      "it should check for equality"
      (check-equal? (equ? (make-scheme-number 8) (make-scheme-number 10)) #f)
      (check-equal? (equ? (make-scheme-number 8) (make-scheme-number 8)) #t)
      (check-equal? (equ? (make-rational 1 2) (make-rational 3 4)) #f)
      (check-equal? (equ? (make-rational 1 2) (make-rational 2 4)) #t)
      (check-equal? (equ? (make-complex-from-real-imag 1 2)
                          (make-complex-from-real-imag 2 2)) #f)
      (check-equal? (equ? (make-complex-from-real-imag 1 2)
                          (make-complex-from-real-imag 1 2)) #t))))

(define =zero?-test
  (test-suite
    "=zero?"
    (test-case
      "it should check if number equals zero"
      (check-equal? (=zero? (make-scheme-number 8)) #f)
      (check-equal? (=zero? (make-scheme-number 0)) #t)
      (check-equal? (=zero? (make-rational 1 2)) #f)
      (check-equal? (=zero? (make-rational 0 2)) #t)
      (check-equal? (=zero? (make-complex-from-real-imag 1 2)) #f)
      (check-equal? (=zero? (make-complex-from-real-imag 0 0)) #t))))

(run-tests magnitude-test)
(run-tests scheme-number-test)
(run-tests equ?-test)
(run-tests =zero?-test)
