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
	(circle (id E) (radius 6)))
	

(defrule area-square
	(square (id ?id) (side-length ?side-length))
=>
	(printout t "area of square: [" ?id "]" " = " (* ?side-length ?side-length) crlf))

	
(defrule area-rectangle
	(rectangle (id ?id) (width ?width) (height ?height))
=>
	(printout t "area of rectangle: [" ?id "]" " = " (* ?width ?height) crlf))

	
(defrule area-circle
	(circle (id ?id) (radius ?radius))
=>
	(printout t "area of circle: [" ?id "]" " = "(* (* ?radius ?radius) 3.14 ) crlf))
	