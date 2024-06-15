:- use_module(library(odbc)).

% Mengatur koneksi ke database MySQL
connect_to_db :-
    odbc_connect('myodbc', _,
                 [user(root), password(''), alias(person_db), open(once)]).

% Menutup koneksi ke database
disconnect_from_db :-
    odbc_disconnect(person_db).

% Menambahkan data person ke dalam database
add(Name, Age) :-
    format(atom(Query), 'INSERT INTO person (name, age) VALUES (\'~w\', \'~w\')', [Name, Age]),
    odbc_query(person_db, Query).

% Contoh penggunaan
main :-
    connect_to_db,
    add('Agus', 20),
    disconnect_from_db.

% Jalankan main untuk menjalankan contoh
:- main.
