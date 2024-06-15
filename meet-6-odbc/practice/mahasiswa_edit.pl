:- use_module(library(odbc)).

% Mengatur koneksi ke database MySQL
connect_to_db :-
    odbc_connect('myodbc', _,
                 [user(root), password(''), alias(mahasiswa_db), open(once)]).

% Menutup koneksi ke database
disconnect_from_db :-
    odbc_disconnect(mahasiswa_db).

% Menambahkan data mahasiswa ke dalam database
add_mahasiswa(Nama, NIM, Jurusan) :-
    format(atom(Query), 'INSERT INTO mahasiswa (nama, nim, jurusan) VALUES (\'~w\', \'~w\', \'~w\')', [Nama, NIM, Jurusan]),
    odbc_query(mahasiswa_db, Query).

% Menampilkan data mahasiswa dari database
show_mahasiswa :-
    odbc_query(mahasiswa_db, 'SELECT id, nama, nim, jurusan FROM mahasiswa', row(Id, Nama, NIM, Jurusan)),
    format('ID: ~w, Nama: ~w, NIM: ~w, Jurusan: ~w~n', [Id, Nama, NIM, Jurusan]),
    fail.
show_mahasiswa.

% Contoh penggunaan
main :-
    connect_to_db,
    add_mahasiswa('Budi Santoso', '123456789', 'Informatika'),
    add_mahasiswa('Siti Aminah', '987654321', 'Sistem Informasi'),
    show_mahasiswa,
    disconnect_from_db.

% Jalankan main untuk menjalankan contoh
:- main.
