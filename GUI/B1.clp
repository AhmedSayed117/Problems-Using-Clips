(deffacts Family-knowledge
	(father Ahmed Mohammed)
	(father Hassan Ahmed)
	(father Ali Sara)
	(mother mona Mohammed))

;Parents Have The Same Child
(defrule parents
	(father ?A ?B)
	(mother ?C ?B)
=>   
	(assert (parents ?A ?C ?B))
	(open "GUI1.txt" data "a")
	(printout data "(parents" " "?A" "?C" "?B")"  crlf)
	(close data))
	
;Fater of Child
(defrule ParentFather
	(father ?A ?B)
=>   
	(open "GUI1.txt" data "a")
	(printout data "(parent" " "?A" "?B")"  crlf)
	(close data))

;Mother Of Child	
(defrule ParentMother
	(mother ?A ?B)
=>   
	(open "GUI1.txt" data "a")
	(printout data "(parent" " "?A" "?B")"  crlf)
	(close data))

;grandfathers
(defrule grandfathers
	(or (and(father ?A ?B)
	(father ?B ?C))
	(and(father ?A ?B)
	(mother ?B ?C)))
=>
	(assert (grandfathers ?A ?C))
	(open "GUI1.txt" data "a")
	(printout data "(grandfathers" " "?A" "?C")"  crlf)
	(close data))

;grandmothers
(defrule grandmothers
	(or (and (mother ?A ?B)
	(mother ?B ?C))
	(and(mother ?A ?B)
	(father ?B ?C)))
=>
	(assert (grandmothers ?A ?C))
	(open "GUI1.txt" data "a")
	(printout data "(grandmothers" " "?A" "?C")"  crlf)
	(close data))