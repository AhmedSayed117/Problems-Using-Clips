(deftemplate person 
	(multislot name (type STRING))
	(multislot childrens (type STRING)))


(deffacts Initials-persons
	(person (name "Ahmed") (childrens "A" "S" "H"))
	(person (name "Sayed") (childrens "B" "C" "D"))
	(person (name "Hassan") (childrens "X" "C" "D" "S" "N"))
	(person (name "Youssef") (childrens "Y" "C" "D" "E"))
	(person (name "Mohamed") (childrens "Z" "C" "D" "Y" "D" "Y"))
	(child-name))


(defrule Print-Parent-more-than-3-Child
	(declare (salience 5))
	?set<-(person (name $?name) (childrens $?child))
=>
	(if (> (length$ ?child) 3)
	then
	(printout t ?name crlf)))


(defrule input-user
	(declare (salience 4))
=>
	(printout t "Enter Child Name: ")
	(assert (child-name (read))))


(defrule Print-Parent-of-Child
	(declare (salience 3))
	(child-name ?child)
	?set<-(person (name $?name) (childrens ?First $?Rest))
=>
	(if (eq ?First ?child)
	then
	(retract ?set)
	(printout t "The Parent Of Child : " ?child " is "?name crlf)
	else
	(retract ?set)
	(assert (person (name ?name) (childrens ?Rest)))))
 
 