-- raio de círculo de raio r
areaCirculo :: Float -> Float
areaCirculo x = pi*(x*x) 

perimetro :: Float -> Float
perimetro x = 2*pi*x

hipotenusa :: Float -> Float -> Float
hipotenusa a b = sqrt(a*a+b*b)

diffCirculo :: Float -> Float -> Float
diffCirculo a b = abs(areaCirculo a - areaCirculo b)
