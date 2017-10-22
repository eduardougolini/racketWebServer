#lang racket/base

(require db
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
  (query-exec mydb
              "SELECT * FROM pergunta"
  )
)


(define (mainScreen req)
  (response/xexpr
   `(html
     (head (title "Trabalho 1!"))
     (body ([style "background-color: #ccc;"])
                   (form ([action "/validate"])
                         "Enter the number to add "
                         (br)
                         (input ([type "text"] [class "1"] [name "number"] [value ""]))
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


  