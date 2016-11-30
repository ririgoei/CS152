#lang racket

(provide make-names)

(define (strings-to-nums lst)
  (map string->number lst)
)

(strings-to-nums '("1" "2" "3"))

(define (reverse lst) (foldl cons '() lst))

(reverse '(1 2 3))

;; Write a function that takes a list of list of first names
;; and a list of last names and produces a list of full names.
;; You may assume that the lists are of equal length.
(define (make-names fnames lnames)
  (map (lambda (first last)
          (string-append first " " last)) fnames lnames)
)

;;Alternative:
;;(define (make-names fnames lnames)
;;(map (lambda (f l) (string-append f " " l) fnames lnames))

(make-names '("Ned" "Tyrion") '("Stark" "Lannister"))