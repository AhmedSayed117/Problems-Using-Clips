(deffacts Color-flags
	(color Egypt Red White Black)
	(color UnitedStates Red White Blue)
	(color Belgium Black Yellow Red)
	(color Sweden Yellow Blue)
	(color Italy Green White Red)
	(color Ireland Green White Orange)
	(color Greece Blue White)
	(list ))


(defrule Countries
	?country <-(color ?CountreName ?First $?Rest)
	?l <-(list $?N)
	(choose ?X)
=> 
	(if(eq ?X ?First)then 
	(retract ?country)(retract ?l)
	(assert (list ?CountreName $?N))
	else
	(retract ?country)
	(assert (color ?CountreName $?Rest))))
	
	
(defrule Print-new-line-B
	(declare (salience -1))
=>
		(printout t "[ ")
		(open "GUI2.txt" data "a")
		(printout data "[ ")
		(close data)
	)


(defrule Print-List
	(declare (salience -2))
	?set<-(list ?Value $?Rest)
=>
	(printout t ?Value  " ")
	(open "GUI2.txt" data "a")
	(printout data ?Value  " ")
	(retract ?set)
	(assert(list $?Rest))
	(close data))


(defrule Print-new-line-A
	(declare (salience -3))
=>
	(printout t "]" crlf)
	(open "GUI2.txt" data "a")
	(printout data "]" crlf)
	(close data))