:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

% Definisikan fakta-fakta tentang profil
profil(rangga, '137417415', 'Laki-laki', '50', 'Cicurug', 'franggay@example.com', 'Software Engineer').

% Handler untuk halaman profil
:- http_handler(root(profile), profile_handler, []).

% Membuat halaman HTML untuk profil pengguna
profile_handler(_Request) :-
    format('Content-type: text/html~n~n'),
    format('<html>~n', []),
    format('<head><title>Profil Pengguna</title></head>~n', []),
    format('<body>~n', []),
    format('<h1>Profil Pengguna</h1>~n', []),
    format('<ul>~n', []),
    profil(Name, NIK, Gender, Age, Address, Email, Skill),
    format('<li><b>NIK:</b> ~w</li>~n', [NIK]),
    format('<li><b>Nama:</b> ~w</li>~n', [Name]),
    format('<li><b>Jenis Kelamin:</b> ~w</li>~n', [Gender]),
    format('<li><b>Umur:</b> ~w</li>~n', [Age]),
    format('<li><b>Alamat Tinggal:</b> ~w</li>~n', [Address]),
    format('<li><b>Email:</b> <a href="mailto:~w">~w</a></li>~n', [Email, Email]),
    format('<li><b>Keahlian :</b> ~w</li>~n', [Skill]),
    fail.
profile_handler(_Request) :-
    format('</ul>~n', []),
    format('</body></html>~n', []).

% Menjalankan server pada port tertentu
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Contoh penggunaan: menjalankan server pada port 8000
:- initialization(server(8000)).