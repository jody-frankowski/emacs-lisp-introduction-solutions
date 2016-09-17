;; Write an interactive function with an optional argument that tests
;; whether its argument, a number, is greater than or equal to, or else,
;; less than the value of ‘fill-column’, and tells you which, in a message.
;; However, if you do not pass an argument to the function, use 56 as a
;; default value

(defun compare-to-fill-column (&optional number)
  "Prints whether number is greater than or equal, or else less than
 'fill-column'. If no argument is given, 56 is used as a default value."
  (interactive "nNumber: ")
  (if (not number)
      (setq number 56))
  ;; We use 'or' so that the function doesn't return nil because of the lack
  ;; of 'else' statement in the last 'if'.
  (or
   (if (< number fill-column)
       (message "%d is less than fill-column %d." number fill-column))
   (if (= number fill-column)
       (message "%d is equal to fill-column %d." number fill-column))
   (if (> number fill-column)
       (message "%d is greater than fill-column %d." number fill-column))
   )
  )

(compare-to-fill-column)
