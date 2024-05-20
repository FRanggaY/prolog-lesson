tugaslab:-nl,
    write('***MENU***'),nl,nl,
    write('Setelah menjawab WAJIB berikan tanda TITIK, dan jangan menggunakan SPASI, underscore boleh aja!'),nl,nl,

    write('1. Biodata'),nl,
    write('2. Luas Persegi Panjang'),nl,
    write('3. Keliling Persegi Panjang'),nl,
    write('4. Pembelian Tiket Bus'),nl,
    write('5. Exit'),nl,nl,
    write('pilih:'),read(Pilihan),nl,
    (
        Pilihan = 1,
        write('***BIODATA***'),nl,nl,
        write('Masukkan Nama         :'),read(A),
        write('Masukkan NPM          :'),read(B),
        write('Masukkan Prodi        :'),read(C),
        write('Masukkan Hobby        :'),read(D),
        write('Selamat datang '),write(A),nl,
        write('NPM anda adalah       : '),write(B),nl,
        write('Anda dari prodi       : '),write(C),nl,
        write('yang hobby nya adalah : '),write(D),nl,nl,
        tugaslab;

        Pilihan = 2,
        write('***Luas Persegi Panjang***'),nl,nl,
        write('Masukkan Panjang  : '),read(P),
        write('Masukkan Lebar    : '),read(L),nl,nl,
        S is P*L,
        write('Luas Persegi Panjangnya adalah '),write(S),nl,
        tugaslab;

        Pilihan = 3,
        write('***Keliling Persegi Panjang***'),nl,nl,
        write('Masukkan Panjang : '),read(G),
        write('Masukkan Lebar   : '),read(E),nl,nl,
        K is 2 * (G+E),
        write('Keliling Persegi Pangangnya adalah : '),write(K),
        tugaslab;

        Pilihan = 5,
        write('Terimakasih gaes :)')
    ).
