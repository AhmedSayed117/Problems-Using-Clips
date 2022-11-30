(deffacts Family-knowledge
	(father Ahmed Mohammed)
	(father Hassan Ahmed)
	(father Ali Sara)
	(mother mona Mohammed))


(defrule parents
	(father ?A ?B)
	(mother ?C ?B)
=>   
	(assert (parents ?A ?C ?B))
	(printout t "(parents" " "?A" "?C" "?B")"  crlf)
	(open "GUI1.txt" data "a")
	(printout data "(parents" " "?A" "?C" "?B")"  crlf)
	(close data))


(defrule grandfathers
	(or (and(father ?A ?B)
	(father ?B ?C))

	(and(father ?A ?B)
	(mother ?B ?C)))
=>
	(assert (grandfathers ?A ?C))
	(printout t "(grandfathers" " "?A" "?C")"  crlf)
	(open "GUI1.txt" data "a")
	(printout data "(grandfathers" " "?A" "?C")"  crlf)
	(close data))

(defrule grandmothers
	(or (and (mother ?A ?B)
	(mother ?B ?C))

	(and(mother ?A ?B)
	(father ?B ?C)))
=>
	(assert (grandmothers ?A ?C))
	(printout t "(grandmothers" " "?A" "?C")"  crlf)
	(open "GUI1.txt" data "a")
	(printout data "(grandmothers" " "?A" "?C")"  crlf)
	(close data))