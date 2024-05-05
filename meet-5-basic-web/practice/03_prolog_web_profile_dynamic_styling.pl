:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/html_write)).
:- use_module(library(persistency)).
:- use_module(library(http/html_head)).

% Inisialisasi basis data
:- persistent(
    profil(nama:atom, nik:atom, jenis_kelamin:atom, umur:atom, alamat:atom, email:atom, keahlian:atom)
).

% Pilih lokasi penyimpanan basis data
:- db_attach('C:/Users/franc/OneDrive/Documents/Prolog/profil_biodata.db', []).

% Handler untuk halaman beranda
:- http_handler(root(.), home_handler, []).

% Handler untuk halaman profil
:- http_handler(root(profil), profil_handler, []).

% Handler untuk halaman tambah profil
:- http_handler(root(tambah_profil), tambah_profil_handler, []).

% Handler untuk menangani permintaan yang tidak ditemukan
:- http_handler(root(.),
                http_404([method(Method), location(Relative)]),
                [method(Method), prefix]).

% Membuat halaman HTML untuk beranda
home_handler(_Request) :-
    reply_html_page(
        title('Beranda'),
        [ h1('Selamat Datang di Website Profil'),
          p('Silakan jelajahi website kami.'),
          p('Kunjungi halaman profil untuk melihat profil pengguna.'),
          p('Untuk menambahkan profil, kunjungi halaman tambah profil.')
        ]
    ).

% Membuat halaman HTML untuk profil
profil_handler(Request) :-
    http_parameters(Request, [nama(Nama, [])]),
    (   profil(Nama, Nik, JenisKelamin, Umur, Alamat, Email, Keahlian)
    ->  reply_html_page(
            title('Profil Pengguna'),
            \html_bootstrap_head,
            [ 
                h1('Profil Pengguna'),
                div(class='card m-4', [
                    div(class='card-body', [
                        h5(class='card-title', Nama), 
                        p(class="card-text", ['Jenis Kelamin: ', JenisKelamin]),
                        p(class="card-text", ['Umur: ', Umur]),
                        p(class="card-text", ['Alamat: ', Alamat]),
                        p(class="card-text", ['Email: ', Email]),
                        p(class="card-text", ['Keahlian: ', Keahlian])
                    ])
                ])
            ]
        )
    ;   reply_html_page(
            title('Profil Tidak Ditemukan'),
            [ h1('Profil Tidak Ditemukan'),
              p(['Profil dengan nama ', Nama, ' tidak ditemukan.'])
            ]
        )
    ).

% Membuat halaman HTML untuk menambah profil
tambah_profil_handler(_Request) :-
    reply_html_page(
        title('Tambah Profil'),
        [ h1('Tambah Profil'),
          form([action='/submit_profil', method='POST'],
               [ p(['Nama: ', input([type='text', name='nama'])]),
                 p(['Nik: ', input([type='text', name='nik'])]),
                 p(['Jenis Kelamin: ', select([name='jenis_kelamin'],
                                            [
                                                option(value='Laki-laki', 'Laki-laki'),
                                                option(value='Perempuan', 'Perempuan')
                                            ]
                    )]),
                 p(['Umur: ', input([type='number', name='umur'])]),
                 p(['Alamat: ', input([type='text', name='alamat'])]),
                 p(['Email: ', input([type='email', name='email'])]),
                 p(['Keahlian: ', input([type='text', name='keahlian'])]),
                 p(input([type='submit', value='Tambah']))
               ])
        ]
    ).

% Handler untuk menyimpan profil yang ditambahkan
:- http_handler(root(submit_profil), submit_profil_handler, [method(post)]).

submit_profil_handler(Request) :-
    http_parameters(Request, [nama(Nama, []), nik(Nik, []), jenis_kelamin(JenisKelamin, []), umur(Umur, []), alamat(Alamat, []), email(Email, []), keahlian(Keahlian, [])]),
    assert_profil(Nama, Nik, JenisKelamin, Umur, Alamat, Email, Keahlian),
    reply_html_page(
        title('Profil Ditambahkan'),
        [ h1('Profil Ditambahkan'),
          p(['Profil dengan nama ', Nama, ' berhasil ditambahkan.']),
          p('Kembali ke halaman '),
          a([href('/profil?nama='), Nama], 'profil'),
          p('.')
        ]
    ).

% Menangani permintaan HTTP yang tidak ditemukan
http_404(Request) :-
    memberchk(method(Method), Request),
    memberchk(location(Relative), Request),
    format('Content-type: text/plain~n~n'),
    format('404 Not Found: ~w ~w~n', [Method, Relative]).

% Menjalankan server pada port tertentu
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Contoh penggunaan: menjalankan server pada port 8000
:- initialization(server(8000)).


html_bootstrap_head -->
    html([ link([rel('stylesheet'), href('https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css')]) ]).