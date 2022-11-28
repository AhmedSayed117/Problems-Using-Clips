(deffacts Family-knowledge
	(father Ramadan AhmedRamadan)
	(father Ramadan Amr)
	(father Ramadan Azza)
	(father Ramadan Hayam)
	
	(mother OmHamada Hayam)
	(mother OmHamada Azza)
	(mother OmHamada Amr)
	(mother OmHamada AhmedRamadan)
	
	
	(father AhmedRamadan Marawan)
	(father AhmedRamadan Arwa)
	
	(mother Hayam Mido)
	(mother Hayam Menna)
	
	(mother Azza Yassmen)
	(mother Azza Nada)
	
	(mother Yassmen Koko)
	(mother Yassmen Selem)
	
	(father AhmedHassan Koko)
	(father AhmedHassan Selem))


(defrule parents
	(father ?A ?B)
	(mother ?C ?B)
=>   
	(assert (parents ?A ?C ?B))
	(printout t "(parents" " "?A" "?C" "?B")"  crlf)))


(defrule grandfathers
	(or (and(father ?A ?B) 
	(father ?B ?C))

	(and(father ?A ?B) 
	(mother ?B ?C)))
=>   
	(assert (grandfathers ?A ?C))
	(printout t "(grandfathers" " "?A" "?C" )"  crlf))

(defrule grandmothers
	(or (and (mother ?A ?B) 
	(mother ?B ?C))
		 
	(and(mother ?A ?B) 
	(father ?B ?C)))	
=>   
	(assert (grandmothers ?A ?C))
	(printout t "(grandmothers" " "?A" "?C" )"  crlf))