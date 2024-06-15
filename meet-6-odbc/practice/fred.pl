:- use_module(library(odbc)).

% Mengatur koneksi ke database MySQL
connect_to_db :-
    odbc_connect('myodbc', _,
                 [user(root), password(''), alias(person_db), open(once)]).

% Menutup koneksi ke database
disconnect_from_db :-
    odbc_disconnect(person_db).

% Menambahkan data person ke dalam database
add() :-
    odbc_query(person_db,
               'INSERT INTO person (name, age) VALUES (\'budi\', 10)').

% Contoh penggunaan
main :-
    connect_to_db,
    add(),
    disconnect_from_db.

% Jalankan main untuk menjalankan contoh
:- main.