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

(query-exec mydb
            "CREATE TABLE IF NOT EXISTS `racket`.`pergunta` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pergunta` VARCHAR(20000) NOT NULL,
  `resposta` VARCHAR(20000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))")

(query-exec mydb
            "TRUNCATE TABLE `racket`.`pergunta`;")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'Qual a principal característica do cálculo lambda?', 'As entidades podem ser utilizadas como argumentos e retornadas como valores de outras funções');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'A programação funcional é adequada em quais cenários?', 'Computações matemáticas, inteligência artificial e processamento paralelo');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'Qual foi a primeira linguagem de programação a implementar o paradigma funcional?', 'Lisp');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'Qual o nome da IDE oficial da linguagem racket?', 'DrRacket');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'No paradigma funcional se um valor qualquer aparece num momento qualquer da computação, considera-se que ele é um valor ....... e ....... durante todo o processo', 'único e imutável');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'O paradigma funcional é baseado em funções ........', 'matemáticas');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'Quais foram as duas linguagens de programação que influenciaram o racket?', 'Scheme e Eiffel');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'Quais são os tipos de tipagem suportados pelo racket?', 'Dinâmica, forte e estática');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'O racket é uma linguagem que tem seus principais usos na área acadêmica e na criação de .......', 'linguagens embutidas');")
(query-exec mydb
             "INSERT INTO `pergunta` (`id`, `pergunta`, `resposta`) VALUES (NULL, 'Qual a diretiva utilizada para modificar a linguagem interpretada pelo Racket?', '#lang');")


(define questions
  (in-query mydb
              "SELECT pergunta.pergunta FROM pergunta"
  )
)

(define answers
  (in-query mydb
              "SELECT pergunta.resposta FROM pergunta"
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
                         (p "1: ", (list-ref (sequence->list questions) 0))
                         (br)
                         (input ([type "text"] [name "1"] [value ""] [required "true"]))
                         (br)
                         (p "2: ", (list-ref (sequence->list questions) 1))
                         (br)
                         (input ([type "text"] [name "2"] [value ""] [required "true"]))
                         (br)
                         (p "3: ", (list-ref (sequence->list questions) 2))
                         (br)
                         (input ([type "text"] [name "3"] [value ""] [required "true"]))
                         (br)
                         (p "4: ", (list-ref (sequence->list questions) 3))
                         (br)
                         (input ([type "text"] [name "4"] [value ""] [required "true"]))
                         (br)
                         (p "5: ", (list-ref (sequence->list questions) 4))
                         (br)
                         (input ([type "text"] [name "5"] [value ""] [required "true"]))
                         (br)
                         (p "6: ", (list-ref (sequence->list questions) 5))
                         (br)
                         (input ([type "text"] [name "6"] [value ""] [required "true"]))
                         (br)
                         (p "7: ", (list-ref (sequence->list questions) 6))
                         (br)
                         (input ([type "text"] [name "7"] [value ""] [required "true"]))
                         (br)
                         (p "8: ", (list-ref (sequence->list questions) 7))
                         (br)
                         (input ([type "text"] [name "8"] [value ""] [required "true"]))
                         (br)
                         (p "9: ", (list-ref (sequence->list questions) 8))
                         (br)
                         (input ([type "text"] [name "9"] [value ""] [required "true"]))
                         (br)
                         (p "10: ", (list-ref (sequence->list questions) 9))
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

  (define correctFirstAnswer (list-ref (sequence->list answers) 0))
  (define correctSecondAnswer (list-ref (sequence->list answers) 1))
  (define correctThirdAnswer (list-ref (sequence->list answers) 2))
  (define correctFourthAnswer (list-ref (sequence->list answers) 3))
  (define correctFifthAnswer (list-ref (sequence->list answers) 4))
  (define correctSixthAnswer (list-ref (sequence->list answers) 5))
  (define correctSeventhAnswer (list-ref (sequence->list answers) 6))
  (define correctEighthAnswer (list-ref (sequence->list answers) 7))
  (define correctNinthAnswer (list-ref (sequence->list answers) 8))
  (define correctTenthAnswer (list-ref (sequence->list answers) 9))

  (response/xexpr
   `(html
      (head (title "Trabalho 1!"))
      (body ([style "background-color: #ccc;"])
        (p "1: Sua resposta: "(b, firstAnswer) " | Reposta correta: "(b, correctFirstAnswer))
        (br)
        (p "2: Sua resposta: "(b, secondAnswer) " | Reposta correta: "(b, correctSecondAnswer))
        (br)
        (p "3: Sua resposta: "(b, thirdAnswer) " | Reposta correta: "(b, correctThirdAnswer))
        (br)
        (p "4: Sua resposta: "(b, fourthAnswer) " | Reposta correta: "(b, correctFourthAnswer))
        (br)
        (p "5: Sua resposta: "(b, fifthAnswer) " | Reposta correta: "(b, correctFifthAnswer))
        (br)
        (p "6: Sua resposta: "(b, sixthAnswer) " | Reposta correta: "(b, correctSixthAnswer))
        (br)
        (p "7: Sua resposta: "(b, seventhAnswer) " | Reposta correta: "(b, correctSeventhAnswer))
        (br)
        (p "8: Sua resposta: "(b, eighthAnswer) " | Reposta correta: "(b, correctEighthAnswer))
        (br)
        (p "9: Sua resposta: "(b, ninthAnswer) " | Reposta correta: "(b, correctNinthAnswer))
        (br)
        (p "10: Sua resposta: "(b, tenthAnswer) " | Reposta correta: "(b, correctTenthAnswer))
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


  