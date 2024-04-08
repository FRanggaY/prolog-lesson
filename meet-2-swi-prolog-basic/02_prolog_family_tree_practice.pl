% Silsilah Keluarga

pria(galih).
pria(gamma).
pria(samid).
pria(deri).
pria(agung).
pria(yuti).
pria(projo).
wanita(mia).
wanita(luna).
wanita(jajuk).
wanita(mita).

ayah(projo, samid).

ayah(samid, deri).
ayah(samid, luna).
ayah(samid, agung).

ayah(samid, galih).

ayah(galih, mia).
ayah(deri, gamma).

ibu(jajuk, deri).
ibu(jajuk, luna).
ibu(jajuk, agung).

ibu(jajuk, mita).

ibu(mita, yuti).


% A. Saudara Kandung
saudara_kandung(Nama1, Nama2) :-
    ayah(Ayah, Nama1),
    ayah(Ayah, Nama2),
    ibu(Ibu, Nama1),
    ibu(Ibu, Nama2),
    Nama1 \= Nama2.

% B. Saudara Tiri
saudara_tiri(Nama1, Nama2) :-
    ayah(Ayah, Nama1),
    ayah(Ayah, Nama2),
    \+ saudara_kandung(Nama1, Nama2).

saudara_tiri(Nama1, Nama2) :-
    ibu(Ibu, Nama1),
    ibu(Ibu, Nama2),
    \+ saudara_kandung(Nama1, Nama2).


% C. Paman
saudara_dari_paman(Nama1, Nama2) :-
    ayah(Ayah, Nama1),
    ayah(Ayah, Nama2).

paman(Paman, Nama) :-
    pria(Paman),
    ayah(Ayah, Nama),
    Paman \= Ayah,
    saudara_dari_paman(Ayah, Paman).

% D. bibi
saudara_dari_bibi(Nama1, Nama2) :-
    ibu(Ibu, Nama1),
    ibu(Ibu, Nama2).

bibi(Bibi, Nama) :-
    wanita(Bibi),
    ibu(Ibu, Nama),
    Bibi \= Ibu,
    saudara_dari_bibi(Ibu, Bibi).

% E. Kakek
kakek(Kakek, Cucu) :-
    ayah(Ayah, Cucu),
    ayah(Kakek, Ayah).

kakek(Kakek, Cucu) :-
    ibu(Ibu, Cucu),
    ayah(Kakek, Ibu).

% F. Cucu
cucu(Cucu, Kakek) :-
    ayah(Ayah, Cucu),
    ayah(Kakek, Ayah).

cucu(Cucu, Kakek) :-
    ibu(Ibu, Cucu),
    ayah(Kakek, Ibu).

