(deftemplate square 
	(slot id) 
	(slot side-length))


(deftemplate rectangle 
	(slot id) 
	(slot width) 
	(slot height))

	
(deftemplate circle
	(slot id) 
	(slot radius))
	
	
(deffacts test 
	(square (id A) (side-length 3)) 
	(square (id B) (side-length 5))
	(rectangle (id C) (width 2) (height 5)) 
	(circle (id D) (radius 2))
	(circle (id E) (radius 6))
	(AllArea 0)
	(Allperimeters 0))
	

(defrule square
	?sq<-(square (id ?id) (side-length ?side-length))
	?set1<-(AllArea ?a) ?set2<-(Allperimeters ?b)
=>
	(printout t "area of square: [" ?id "]" " = " (* ?side-length ?side-length) crlf)
	(printout t "perimeters of square: [" ?id "]" " = " (* ?side-length 4) crlf)
	(retract ?set1)(retract ?set2)(retract ?sq)
	(assert (AllArea ( + ?a (* ?side-length ?side-length))))
	(assert (Allperimeters ( + ?b  (* ?side-length 4)))))

	
(defrule rectangle
	?re<-(rectangle (id ?id) (width ?width) (height ?height))
	?set1<-(AllArea ?a) ?set2<-(Allperimeters ?b)
=>
	(printout t "area of rectangle: [" ?id "]" " = " (* ?width ?height) crlf)
	(printout t "perimeters of rectangle: [" ?id "]" " = " (* (+ ?width ?height) 2) crlf)
	(retract ?set1)(retract ?set2)(retract ?re)
	(assert (AllArea ( + ?a (* ?width ?height))))
	(assert (Allperimeters ( + ?b  (* (+ ?width ?height) 2)))))
	
	
(defrule circle
	?ci<-(circle (id ?id) (radius ?radius))
	?set1<-(AllArea ?a) ?set2<-(Allperimeters ?b)
=>
	(printout t "area of circle: [" ?id "]" " = "(* (* ?radius ?radius) 3.14 ) crlf)
	(printout t "perimeters of circle: [" ?id "]" " = "(* 2 3.14 ?radius) crlf)
	(retract ?set1)(retract ?set2)(retract ?ci)
	(assert (AllArea ( + ?a (* (* ?radius ?radius) 3.14 ))))
	(assert (Allperimeters ( + ?b  (* 2 3.14 ?radius)))))

(defrule print
	(declare (salience -1))
	?s1 <-(AllArea ?x)
	?s2<-(Allperimeters ?y)
=>
	(printout t "Total Area = " ?x crlf)
	(printout t "Total perimeters = " ?y crlf)
	(retract ?s1)(retract ?s2))