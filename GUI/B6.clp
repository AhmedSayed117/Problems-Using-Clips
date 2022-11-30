(deftemplate person 
	(multislot name (type STRING))
	(multislot childrens (type STRING)))


(deffacts Initials-persons
	(person (name "Ahmed Sayed") (childrens "Ahmed Sayed" "S" "H" ))
	(person (name "Khaled Ashraf") (childrens "B" "C" "D" "C"))
	(person (name "Hassan") (childrens "X" "C" "D" "S" "N"))
	(person (name "Youssef") (childrens "Y" "C" "D" "E"))
	(person (name "Mohamed") (childrens "Z" "C" "D" "Y" "D" "Y")))


(defrule Print-Parent-more-than-3-Child
	(declare (salience 5))
	?set<-(person (name $?name) (childrens $?child))
=>
	(if (> (length$ ?child) 3)
	then

	(printout t "This parent : " ?name " Have More Than 3 Child " ?child crlf)

	(open "GUI6.txt" data "a")
	(printout data "This parent : " ?name " Have More Than 3 Child " ?child crlf)
	(close data)))


(defrule Print-Parent-of-Child
	(declare (salience 3))
	(child-name ?child)
	?set<-(person (name $?name) (childrens ?First $?Rest))
=>
	(if (eq ?First ?child)
	then
	(retract ?set)
	(printout t "parent of " ?child " is " ?name " " crlf)
	(open "GUI6.txt" data "a")
	(printout data "parent of " ?child " is " ?name " " crlf)
	(close data)
	else
	(retract ?set)
	(assert (person (name ?name) (childrens ?Rest)))))
 
 