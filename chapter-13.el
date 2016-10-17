;; Using a ‘while’ loop, write a function to count the number of
;; punctuation marks in a region—period, comma, semicolon, colon,
;; exclamation mark, and question mark.  Do the same using recursion.

(defun count-punctuation (beginning end)
  "Count the number punctuation marks in a region—period, comma, semicolon,
  colon, exclamation mark, and question mark."
  (interactive "r")

  (save-excursion
    (goto-char beginning)
    (let ((count 0))
      (while (and (< (point) end)
                  (re-search-forward "[,;:!?]" end t))
        (setq count (1+ count))
        )

      (cond
       ((zerop count)
        (message "The region does not have any punctuation."))
       ((= 1 count)
        (message "The region has one punctuation."))
       (t
        (message "The region has %d punctuation." count))
        )
      )
    )
  )

;; Pellentesque dapibus suscipit ligula.  Donec posuere augue in quam.  Etiam vel tortor sodales tellus ultricies commodo.  Suspendisse potenti.  Aenean in sem ac leo mollis blandit.  Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi.  Phasellus lacus.  Etiam laoreet quam sed arcu.  Phasellus at dui in ligula mollis ultricies.  Integer placerat tristique nisl.  Praesent augue.  Fusce commodo.  Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus.  Nullam libero mauris, consequat quis, varius et, dictum id, arcu.  Mauris mollis tincidunt felis.  Aliquam feugiat tellus ut neque.  Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit.

(defun recursive-count-punctuation (end)
  "Returns the number punctuation marks in a region—period, comma, semicolon,
    colon, exclamation mark, and question mark."
  (if (and (< (point) end)
           (re-search-forward "[,;:!?]" end t))
      (1+ (recursive-count-punctuation end))
    0
    )
  )

(defun count-punctuation-recursive (beginning end)
  "Count the number punctuation marks in a region—period, comma, semicolon,
  colon, exclamation mark, and question mark."
  (interactive "r")

  (save-excursion
    (goto-char beginning)
    (let ((count (recursive-count-punctuation end)))

      (cond
       ((zerop count)
        (message "The region does not have any punctuation."))
       ((= 1 count)
        (message "The region has one punctuation."))
       (t
        (message "The region has %d punctuation." count))
       )
      )
    )
  )

;; Nullam eu ante vel est convallis dignissim.  Fusce suscipit, wisi nec facilisis facilisis, est dui fermentum leo, quis tempor ligula erat quis odio.  Nunc porta vulputate tellus.  Nunc rutrum turpis sed pede.  Sed bibendum.  Aliquam posuere.  Nunc aliquet, augue nec adipiscing interdum, lacus tellus malesuada massa, quis varius mi purus non odio.  Pellentesque condimentum, magna ut suscipit hendrerit, ipsum augue ornare nulla, non luctus diam neque sit amet urna.  Curabitur vulputate vestibulum lorem.  Fusce sagittis, libero non molestie mollis, magna orci ultrices dolor, at vulputate neque nulla lacinia eros.  Sed id ligula quis est convallis tempor.  Curabitur lacinia pulvinar nibh.  Nam a sapien.
