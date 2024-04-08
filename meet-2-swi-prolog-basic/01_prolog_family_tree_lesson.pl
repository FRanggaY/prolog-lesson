% Silsilah Keluarga

pria(budi) .
pria(joko) .
wanita(ani) .

orangtua(budi, joko).
ayah(X,Y) :- pria(X), orangtua(X,Y) .
ibu(X,Y) :- wanita(X), orangtua(X,Y) .
