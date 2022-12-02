(deffacts Color-flags
	(color Egypt Red White Black)
	(color UnitedStates Red White Blue)
	(color Belgium Black Yellow Red)
	(color Sweden Yellow Blue)
	(color Italy Green White Red)
	(color Ireland Green White Orange)
	(color Greece Blue White)
	(list ))

;validate The Countries That Have User Color
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
	
;Print "["
(defrule Print-new-line-B
	(declare (salience -1))
=>
	(open "GUI2.txt" data "a")
	(printout data "[ ")
	(close data))

;Print Result
(defrule Print-List
	(declare (salience -2))
	?set<-(list ?Value $?Rest)
=>
	(open "GUI2.txt" data "a")
	(printout data ?Value  " ")
	(retract ?set)
	(assert(list $?Rest))
	(close data))

;Print "]"
(defrule Print-new-line-A
	(declare (salience -3))
=>
	(open "GUI2.txt" data "a")
	(printout data "]" crlf)
	(close data))