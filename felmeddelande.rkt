Welcome to DrRacket, version 5.3.1 [3m].
Language: Pretty Big [custom]; memory limit: 128 MB.
Hejokpunkt < x: 304 , y: 437  >      
hej current väg är #fpunkt < x: 271 , y: 446  >      
hej current väg är #fpunkt < x: 268 , y: 454  >      
hej current väg är #fpunkt < x: 361 , y: 434  >      
stad : umeå  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #fpunkt < x: 324 , y: 557  >      
hej current väg är (#(struct:object:väg% ...) #(struct:object:väg% ...))punkt < x: 405 , y: 467  >      
current: #f  current2: #f  väg: (#(struct:object:väg% ...) #(struct:object:väg% ...)) 
stad : vaasa  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #fpunkt < x: 366 , y: 437  >      
hej current väg är (#(struct:object:väg% ...)). . kassa.rkt:33:32: for-each: contract violation
  expected: list?
  given: #f
  argument position: 2nd
  other arguments...:
   #<procedure:köp>
punkt < x: 435 , y: 565  >      
current: #f  current2: #f  väg: (#(struct:object:väg% ...)) 
hej current väg är #fpunkt < x: 327 , y: 553  >      
stad : sundsvall  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #fpunkt < x: 251 , y: 538  >      
hej current väg är (#(struct:object:väg% ...))punkt < x: 455 , y: 477  >      
current: #f  current2: #f  väg: (#(struct:object:väg% ...)) 
hej current väg är #fpunkt < x: 404 , y: 476  >      
stad : vaasa  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #f> (define stadun current)
punkt < x: 258 , y: 518  >      
stad : vaasa  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #fpunkt < x: 252 , y: 531  >      
stad : vaasa  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #fpunkt < x: 250 , y: 536  >      
hej current väg är ()punkt < x: 267 , y: 520  >      
current: #f  current2: #f  väg: () 
hej current väg är #fpunkt < x: 243 , y: 540  >      
stad : östersund  stad1 : #(struct:object:stad% ...) stad2: #f  
hej current väg är #f> (define staddeux current)
> (send (send dm get-spelare) kopplad? staddeux stadun)
>(kopplad-hjälp (object:stad% ...) (object:stad% ...) '())
>(kopplad-hjälp-lista (list (object:stad% ...)) (object:stad% ...) '())
> (kopplad-hjälp
   (object:stad% ...)
   (object:stad% ...)
   (list (object:stad% ...)))
< #f
>(kopplad-hjälp-lista '() (object:stad% ...) '())
<#f
#f
> (send (send dm get-spelare) kopplad? stadun staddeux)
>(kopplad-hjälp (object:stad% ...) (object:stad% ...) '())
>(kopplad-hjälp-lista (list (object:stad% ...)) (object:stad% ...) '())
> (kopplad-hjälp
   (object:stad% ...)
   (object:stad% ...)
   (list (object:stad% ...)))
< #f
>(kopplad-hjälp-lista '() (object:stad% ...) '())
<#f
#f
> 