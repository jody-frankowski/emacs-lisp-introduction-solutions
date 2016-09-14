;; • Write a non-interactive function that doubles the value of its
;; argument, a number.  Make that function interactive.
(defun double (number)
  "Double the value of number."
  (* 2 number)
  )

(message "The double of %d is %d" 3 (double 3))

(defun double-interactive (number)
  "Double the value of number interactively."
  (interactive "nInput number: ")
  (message "The double of %d is %d" number (* 2 number))
  )

;; • Write a function that tests whether the current value of
;; ‘fill-column’ is greater than the argument passed to the function,
;; and if so, prints an appropriate message.
(defun fill-column-is-greater-than (number)
  "Prints whether the argument number is greater than 'fill-column'."
  (if (> fill-column number)
      (message "fill-column %d is greater than number %d" fill-column number)
    (message "fill-column %d isn't greater than number %d" fill-column number)
    )
  )

(fill-column-is-greater-than 42)
(fill-column-is-greater-than 180)
