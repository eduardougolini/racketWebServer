#lang racket/base

(require db
         racket/sequence
         racket/list
         web-server/servlet
         web-server/dispatch
         web-server/servlet-env)

(define mydb
  (mysql-connect	#:user "root"
                        #:port 3306
                        #:database "racket"	 	 	 	 
                        #:server "localhost"	 	 	 
                        #:password "root"
  )
)

(define questions
  (in-query mydb
              "SELECT pergunta.pergunta FROM pergunta"
  )
)

(define-values (trabalho-dispatch a-url)
  (dispatch-rules [("validate") validateFunc]
                  [("index") mainScreen])
)

(define (start request)
  (trabalho-dispatch request)
)

(define (mainScreen req)
  (response/xexpr
   `(html
     (head (title "Trabalho 1!"))
     (body ([style "background-color: #ccc;"])
                   (form ([method "get"] [action "/validate"])
                         
                         (p "1: ", (first (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "1"] [value ""] [required "true"]))
                         (br)
                         (p "2: ", (second (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "2"] [value ""] [required "true"]))
                         (br)
                         (p "3: ", (third (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "3"] [value ""] [required "true"]))
                         (br)
                         (p "4: ", (fourth (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "4"] [value ""] [required "true"]))
                         (br)
                         (p "5: ", (fifth (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "5"] [value ""] [required "true"]))
                         (br)
                         (p "6: ", (sixth (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "6"] [value ""] [required "true"]))
                         (br)
                         (p "7: ", (seventh (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "7"] [value ""] [required "true"]))
                         (br)
                         (p "8: ", (eighth (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "8"] [value ""] [required "true"]))
                         (br)
                         (p "9: ", (ninth (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "9"] [value ""] [required "true"]))
                         (br)
                         (p "10: ", (tenth (sequence->list questions)))
                         (br)
                         (input ([type "text"] [name "10"] [value ""] [required "true"]))
                         (br)
                         
                         (input ([type "submit"] [name "enter"] [value "Enviar"]))))
    )
  )
)


(define (validateFunc req)
  (define firstAnswer (get-param->string req "1"))
  (define secondAnswer (get-param->string req "2"))
  (define thirdAnswer (get-param->string req "3"))
  (define fourthAnswer (get-param->string req "4"))
  (define fifthAnswer (get-param->string req "5"))
  (define sixthAnswer (get-param->string req "6"))
  (define seventhAnswer (get-param->string req "7"))
  (define eighthAnswer (get-param->string req "8"))
  (define ninthAnswer (get-param->string req "9"))
  (define tenthAnswer (get-param->string req "10"))

  (response/xexpr
   `(html
      (head (title "Trabalho 1!"))
      (body ([style "background-color: #ccc;"])
        (p "resutado: ", result)
        (br)
      )
    )
   )
)

(define (get-param->string req param)
    (if (eq? #f (bindings-assq (string->bytes/utf-8 param)
                               (request-bindings/raw req)))
        ""
        (bytes->string/utf-8 
           (binding:form-value 
               (bindings-assq (string->bytes/utf-8 param)
                              (request-bindings/raw req))))))


(serve/servlet start
               #:servlet-path "/index"
               #:port 8080
               #:servlet-regexp #rx""
)


  