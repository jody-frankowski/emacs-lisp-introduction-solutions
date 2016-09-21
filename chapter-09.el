;; Set ‘flowers’ to ‘violet’ and ‘buttercup’.  Cons two more flowers on to
;; this list and set this new list to ‘more-flowers’.  Set the CAR of
;; ‘flowers’ to a fish.  What does the ‘more-flowers’ list now contain?

(setq flowers '(violet buttercup))
flowers
(setq more-flowers (cons 'tulip (cons 'rose flowers)))
more-flowers
(setcar more-flowers 'a-fish)
more-flowers
