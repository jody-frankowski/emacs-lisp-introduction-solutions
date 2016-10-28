;; Write a line graph version of the graph printing functions.

(defvar graph-symbol "*"
  "string used as symbol in graph, usually an asterisk.")

(defvar graph-blank " "
  "string used as blank in graph, usually a blank space.
graph-blank must be the same number of columns wide
as graph-symbol.")

(defun column-of-graph (max-graph-height actual-height &optional line)
  "Return MAX-GRAPH-HEIGHT strings; ACTUAL-HEIGHT is the height of the column
 in the chart.

The graph-symbols are contiguous entries at the end
of the list.
The list will be inserted as one column of a graph.
The strings are either graph-blank or graph-symbol.
The optional boolean argument 'line' is used to create a line chart column
rather than a histogram (bar) column."

  (let ((insert-list nil)
        (number-of-top-blanks
         (- max-graph-height actual-height)))

    (if line
        ;; Line column
        ;; Fill in ‘graph-symbols’.
        (progn
          ;; Fill insert list with graph-blank up to the last character of the
          ;; actual bar.
          (while (> actual-height 1)
            (setq insert-list (cons graph-blank insert-list))
            (setq actual-height (1- actual-height)))
          (setq insert-list (cons graph-symbol insert-list)))

      ;; Bar column
      ;; Fill in ‘graph-symbols’.
      (while (> actual-height 0)
        (setq insert-list (cons graph-symbol insert-list))
        (setq actual-height (1- actual-height))))


    ;; Fill in ‘graph-blanks’.
    (while (> number-of-top-blanks 0)
      (setq insert-list (cons graph-blank insert-list))
      (setq number-of-top-blanks
            (1- number-of-top-blanks)))

    ;; Return whole list.
    insert-list))

(defun graph-body-print (numbers-list &optional line)
  "Print a bar graph of the NUMBERS-LIST.
     The numbers-list consists of the Y-axis values."

  (let ((height (apply 'max numbers-list))
        (symbol-width (length graph-blank))
        from-position)

    (while numbers-list
      (setq from-position (point))
      (insert-rectangle
       (column-of-graph height (car numbers-list) t))
      (goto-char from-position)
      (forward-char symbol-width)
      ;; Draw graph column by column.
      (sit-for 0)
      (setq numbers-list (cdr numbers-list)))
    ;; Place point for X axis labels.
    (forward-line height)
    (insert "\n")
    ))

(graph-body-print '(1 2 3 4) t)
