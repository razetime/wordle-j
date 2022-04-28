NB. Based on RGS' excellent, easy to follow tutorial
NB. https://mathspp.com/blog/solving-wordle-with-apl
NB. All functions take input in the same format and order.

read =. 1!:1

Load =. verb define
  'WORD.LST' Load y
:
  w =. cutopen read <x
  > y {. w #~ 5 = > # each w
)

NB. Part 1: Score Finding function
T =. {{<"1 y ;"0 >./ (* +/\"1) y =/~ ~. y}}
PM =. {{x e.&T y}}
I =. {{x {"1 y}}
Score =. {{
  p =. \: x = y
  y(= + (/: p) I PM&(p I ]))x
}}

NB. Part 2: Filtering function
NB. sub #~ (pos #"1 sub) -:"1 pos # guess
NB. sub #~ (pos #"1 sub) -.@-:"1 pos # guess
NB. sub #~ *./"1 (pos # guess) PM"1 sub #"1~ 2 -.@= score

NB.    guess =. 'praam'
NB.    score =. 0 0 1 0 2
NB.    pos =. 2 -.@= score
NB.    need =. 1 = score
NB.    illegal =. guess #~ 0 = score
NB.    wo =. (pos #"1 sub) PW"1 need # guess
NB.    sub #~ 0 = illegal #@:([ -. -.)"1 wo
PW =. {{>> {. each  x -.&T y}}
Filter =. {{
  'gss scr' =. x
  wrds =. y
  pos =. 2 = scr
  wrds =. wrds #~ (pos #"1 wrds) -:"1 pos # gss
  pos =. 1 = scr
  wrds =. wrds #~ (pos #"1 wrds) -.@-:"1 pos # gss
  wrds =. wrds #~ *./"1 (pos # gss) PM"1 wrds #"1~ 2 -.@= scr
  pos =. 2 -.@= scr
  need =. 1 = scr
  wrds #~ 0 = (gss #~ 0 = scr) #@:([ -. -.)"1 (pos #"1 wrds) PW"1 need # gss
}}

NB. Execution
'chess' Score 'caves'
'chess' Score 'swiss'
'talon' Score 'fault' 

words =. Load 8672
('aback' ; 2 0 2 1 0) Filter words
('aback' ; 2 0 2 0 1) Filter words