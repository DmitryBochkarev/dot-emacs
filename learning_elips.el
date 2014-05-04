(message "hello")

'(1 2 3)

(car '(1 2 3)) ;; first value
(cdr '(1 2 3)) ;; last value

(null nil) ;; null checks if value is nil (boolean value returned)

(cdr '(1))

;; Defining variables in Emacs
(setq my-list '(foo bar baz))

my-list

;; Defining functions in Emacs
(defun say-hello()
  (message "hello dude"))

(say-hello)

;; Conditionals
(when (= (+ 2 2) 4)
  (message "This is true!"))

(if (= 4 4)
    "one"
    "two")

;; Anonymous functions
((lambda (x) (* x x x)) 5)

(fset 'cube (lambda (x) (* x x x)))
(cube 4)
