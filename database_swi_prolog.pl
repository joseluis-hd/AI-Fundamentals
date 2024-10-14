progenitor(clara,jose).
progenitor(tomas,jose).
progenitor(tomas,isabel).
progenitor(jose,ana).
progenitor(jose,patricia).
progenitor(patricia,jaime).

hombre(jose).
hombre(tomas).
hombre(jaime).

mujer(patricia).
mujer(ana).
mujer(clara).
mujer(isabel).

dif(X,Y):-X\=Y.
es_madre(X):-mujer(X),progenitor(X,Y).
es_padre(X):-hombre(X),progenitor(X,Y).
es_hijo(X):-hombre(X),progenitor(Y,X).
hermana_de(X,Y):-mujer(X),progenitor(Z,Y),progenitor(Z,X).
abuelo_de(X,Y):-hombre(X),progenitor(X,Z),progenitor(Z,Y).
abuela_de(X,Y):-mujer(X),progenitor(X,Z),progenitor(Z,Y).
hermanos(X,Y):-dif(X,Y),progenitor(Z,X),progenitor(Z,Y).
tia(X,Y):-hermana_de(X,Z),progenitor(Z,Y).