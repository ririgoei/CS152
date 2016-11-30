#lang racket

(require racket/contract)
(struct account (balance))
(provide new-account balance withdraw deposit account)

;; A new, empty account
(define new-account (account 0))

;; Get the current balance
(define/contract (balance acc)
  (-> account? number?)
  (account-balance acc))

;; Withdraw funds from an account
(define/contract (withdraw acc amt)
  (->i ([is-acct account?]
       [is-amt(is-acct) (and/c positive? (is-sufficient? is-acct))])
       [result-is account?]
       )
  (account (- (account-balance acc) amt)))

;; Add funds to an account
(define/contract (deposit acc amt)
  (-> account? positive? account?)
  (account (+ (account-balance acc) amt)))

(define (is-sufficient? act)
  (lambda(amt)
    (if (and (>= (balance act) amt) (number? amt))
        #t
        #f)))