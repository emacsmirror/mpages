;;; mpages-mode.el --- A mode for quickly writing your Morning Pages

;; Copyright (C) 2014 Sean Levin

;; Author: Sean Levin
;; Created: 20 Aug 2014
;; Version: 20140824

;;; Commentary:
;; This is the commentary

;;; Change Log:
;; 20140824 First Version


;;; Code:
(defun formatted-count (num threshold)
  "Colorize the NUM based on being above/below THRESHOLD."
  (let ((numstr (number-to-string num)))
    (if (< num threshold)
        (propertize numstr 'face '(:foreground "red"))
      (propertize numstr 'face '(:foreground "green")))))

(defun word-count-string ()
  (let ((num (count-words 1 (length (buffer-string)))))
    (concat "Words: "
            (formatted-count num 750)
            "   "
            "Time Elapsed: "
            (tfmt (time-subtract (current-time) start-time)))))

(defun update-word-count-maybe ()
  (if (boundp 'count-timer)
      (update-word-count)))

(defun update-word-count ()
  (setq header-line-format (word-count-string)))

(defun end-timer-stuff ()
  (cancel-timer count-timer)
  (setq header-line-format nil)
  (makunbound 'count-timer)
  (makunbound 'start-time))

(defun tfmt (time)
  (format-time-string "%M:%S" time))

(defun setup-time ()
  (defvar-local start-time (current-time)))

(defun setup-timer ()
  (defvar-local count-timer (run-at-time nil 5 'update-word-count-maybe))
  (add-hook 'kill-buffer-hook 'end-timer-stuff nil t))

(defun open-today ()
  (find-file (concat "~/wrk/words/" (format-time-string "%Y%m%d") ".txt")))

;; open todays file
(defun mp-today ()
  (interactive)
  (open-today)
  (setup-time)
  (setup-timer))

(defun testy ()
  (interactive)
  (update-word-count))

;; shouldn't change because I quit it right?

;; why not start again
(format-time-string "%H:%M:%S")

;; maybe function names should be mpages prefix

;;(setup-time)
;;(word-count-string)
;; [nil 21498 22316 175884 5 update-word-count nil nil 0] timer when not running?
;; [nil 21498 24521 908091 5 update-word-count nil nil 0] timer when running?

;; figure out why it doesn't restart when I restart the thing

;; make the timer check happen only if the timer has been defined
;; so check for local variable and then do the header format
;; that way switching away won't make anything happen

;; get rid of ? stuff


;; should customizable morning pages directory
;; should ask the first time its run to set that

;;; mpages-mode.el ends here