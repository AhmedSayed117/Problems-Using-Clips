(deftemplate person 
	(multislot name (type STRING))
	(multislot childrens (type STRING)))


(deffacts Initials-persons
	(person (name "Ahmed Sayed") (childrens "Salma" "Kaled" "Menna" ))
	(person (name "Menna Sayed") (childrens "Sayed" "Mohamed" "Ragab" "Mona"))
	(person (name "Mallak Sayed") (childrens "S" "T" "A" "Kholod"))
	(person (name "Youssef") (childrens "M" "Mona" "Tatto" "T"))
	(person (name "Sara") (childrens "Mona" "K" "Mohamed" "M" "Salem" "Ahmed")))


(defrule Print-Parent-more-than-3-Child
	(declare (salience 5))
	?set<-(person (name $?name) (childrens $?child))
=>
	(if (> (length$ ?child) 3)
	then
	(open "GUI6.txt" data "a")
	(printout data "This parent : " ?name " Have More Than 3 Child " ?child crlf)
	(printout t "This parent : " ?name " Have More Than 3 Child " ?child crlf)
	(close data)))


(defrule Print-Parent-of-Child
	(declare (salience 3))
	(child-name ?child)
	?set<-(person (name $?name) (childrens ?First $?Rest))
=>
	(if (eq ?First ?child)
	then
	(retract ?set)
	(open "GUI6.txt" data "a")
	(printout data "parent of " ?child " is " ?name " " crlf)
	(printout t "parent of " ?child " is " ?name " " crlf)
	(close data)
	else
	(retract ?set)
	(assert (person (name ?name) (childrens ?Rest)))))
 
 