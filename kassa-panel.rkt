(define kassa-panel% (class object%
                       (init-field parentin)
                       (define köp #f)
                       (define avbryt #f)
                       (begin 
                         
                         (let* ((panel-main (new vertical-panel% [parent parentin]))
                                
                                (horizontal1 (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main])))
                           (set! köp (new button% [parent horizontal1]
                                [label(read-bitmap "köp.png" )]
                                [enabled #f]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (send kassa start)
                                            (send avbryt enable #t)
                                            (send *spelar-panel* set-buttons-sant)
                                            )]))
                           (set! avbryt (new button% [parent horizontal1]
                                [label (read-bitmap "avbryt.png" )]
                                [enabled #f]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (send kassa reset))])))
                         
                         (define/public (set-köp-t)
                           (if (send kassa öppen?)
                           (begin(send köp enable #t))))
                         (define/public (set-köp-f)
                           (send köp enable #f)
                           (send avbryt enable #f)
                           (send *spelar-panel* set-buttons-falsk)
                           )
                         
                         
                       (super-new))))