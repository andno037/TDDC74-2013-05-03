(define knapp-panel% (class object%
                       (init-field parentin)
                       (begin 
                         
                         (let* ((panel-main (new panel% [parent parentin]))
                                
                                (horizontal (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main]))
                                )
                           (new button% [parent horizontal]
                                [label "I"]
                                [min-width 50]
                                [callback (lambda (button event) (display "I"))])
                           (new button% [parent horizontal]
                                [label "Love"]
                                [min-height 50]
                                [callback (lambda (button event) (display "Love"))])
                           (new button% [parent horizontal]
                                [label "Racket"]
                                [callback (lambda (button event) (display "Racket"))]))
                         (new button% [parent *window*]
                              [label "DÃ¥"]
                              [callback (lambda (button event) (display "DÃ¥"))]))
                       (super-new)
                       
                       
                       
                       
                       
                       ))