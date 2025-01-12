/*REXX*/

/*ABBREV,DELSTR,INSERT,JUSTIFY,LEFT,LENGTH,OVERLAY,POS,RIGHT,
SPACE,SUBSTR,SUBWORD,TRANSLATE,WORD,WORDINDEX,WORDPOS,WORDS*/

s1 = 'APROFLERILISTBOPYTY'
s2 = 'aa     bbb   cccc  ee      fff       gg'
s3 = 'CAR, DOG, CAT,T BIRD,MAN'

say substr(s1,10,4)

say right(s1,5)

say left(s1,5)

say length(s1)

say subword(s2,4,1)

say words(s2)

say wordindex(s2,4)

say subword(s2,3,3)

say space(s2,1)

say space(s2,1,',')

s2 = translate(s2,',',' ')

say s2

say pos('T',s3)

say wordpos('T',translate(s3,' ',','))

say words(translate(s3,' ',','))

s3 = insert('PIG, ',s3,9)

say s3

s3 = overlay('RAT',s3,POS('CAT',s3))

say space(s3,0)

say delstr(s3,pos('T ',s3),2)

say time() 'on' date('O')