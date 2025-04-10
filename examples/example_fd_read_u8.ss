
(define (loop-fd-read-u8 fd)
  (do ((b (fd-read-u8 fd) (fd-read-u8 fd)))
      ((eof-object? b))
    (format (console-output-port) "read one byte: ~s\n" b)
    (flush-output-port (console-output-port))))

(define (loop-port-read-u8 binary-input-port)
  (do ((b (get-u8 binary-input-port) (get-u8 binary-input-port)))
      ((eof-object? b))
    (format (console-output-port) "read one byte: ~s\n" b)
    (flush-output-port (console-output-port))))

(define (loop-port-read-char textual-input-port)
  (do ((ch (get-char textual-input-port) (get-char textual-input-port)))
      ((eof-object? ch))
    (format (console-output-port) "read one char: ~s\n" ch)
    (flush-output-port (console-output-port))))

(define j1 {sleep 1 | {echo0 abc; sleep 2; echo def; sleep 3} | $(loop-fd-read-u8 (sh-fd 0))})
(define j2 {sleep 1 | {echo0 abc; sleep 2; echo def; sleep 3} | $(loop-port-read-u8 (sh-stdin))})
(define j3 {sleep 1 | {echo0 abc; sleep 2; echo def; sleep 3} | $(loop-port-read-char (current-input-port))})

#;(sh-run/i j1)
#;(sh-run/i j2)
#;(sh-run/i j3)

#;(sh-run j1)
#;(sh-run j2)
#;(sh-run j3)

(void)
