#lang racket/base

(require db
         racket/sequence
         racket/list
         web-server/servlet
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


(define (mainScreen req)
  (response/xexpr
   `(html
     (head (title "Trabalho 1!"))
     (body ([style "background-color: #ccc;"])
                   (form ([action "/validate"])
                         
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

(serve/servlet mainScreen
               #:servlet-path "/"
               #:port 8080)

(serve/servlet mainScreen
               #:servlet-path "/validate"
               #:port 8080)


  