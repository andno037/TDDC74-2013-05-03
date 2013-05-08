(define kassa-panel% (class object%
                       (init-field parentin)
                       (begin 
                         
                         (let* ((panel-main (new vertical-panel% [parent parentin]))
                                
                                (horizontal1 (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main])))
                           (new button% [parent horizontal1]
                                [label "start"]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (send kassa start))])
                           (new button% [parent horizontal1]
                                [label "abort"]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (send kassa reset))]))
                       (super-new))))