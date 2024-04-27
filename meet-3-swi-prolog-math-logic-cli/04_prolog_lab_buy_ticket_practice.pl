% fact
harga('Ekonomi', 'Bogor-Malang', 350000).
harga('Eksekutif', 'Bogor-Malang', 450000).
harga('Super Eksekutif', 'Bogor-Malang', 550000).
harga('Ekonomi', 'Bogor-Madiun', 300000).
harga('Eksekutif', 'Bogor-Madiun', 400000).
harga('Super Eksekutif', 'Bogor-Madiun', 450000).
harga('Ekonomi', 'Bogor-Surabaya', 325000).
harga('Eksekutif', 'Bogor-Surabaya', 425000).
harga('Super Eksekutif', 'Bogor-Surabaya', 525000).
harga('Ekonomi', 'Bogor-Yogyakarta', 250000).
harga('Eksekutif', 'Bogor-Yogyakarta', 350000).
harga('Super Eksekutif', 'Bogor-Yogyakarta', 450000).
harga('Ekonomi', 'Bogor-Palembang', 450000).
harga('Eksekutif', 'Bogor-Palembang', 550000).
harga('Super Eksekutif', 'Bogor-Palembang', 650000).
harga('Ekonomi', 'Bogor-Padang', 550000).
harga('Eksekutif', 'Bogor-Padang', 650000).
harga('Super Eksekutif', 'Bogor-Padang', 750000).

tugaslabtiket :-
    write('Pembelian Tiket Bus'), nl,
    write('1. Ekonomi'), nl,
    write('2. Eksekutif'), nl,
    write('3. Super Eksekutif'), nl,
    write('4. Exit'), nl,
    write('Pilih jenis bus: '), read(PilihanBus), nl,
    (
        PilihanBus = 4 -> write('Terima kasih telah menggunakan program ini.'), nl, !;
        PilihanBus < 1; PilihanBus > 4 -> write('Pilihan jenis bus tidak sesuai.'), nl, tugaslabtiket;
        write('Pilih Tujuan:'), nl,
        write('1. Bogor - Malang'), nl,
        write('2. Bogor - Madiun'), nl,
        write('3. Bogor - Surabaya'), nl,
        write('4. Bogor - Yogyakarta'), nl,
        write('5. Bogor - Palembang'), nl,
        write('6. Bogor - Padang'), nl,
        write('7. Exit'), nl,
        write('Pilih tujuan: '), read(TujuanBus), nl,
        pilih_tujuan(PilihanBus, TujuanBus)
    ).

% fact
pilih_jenis_bus(1, 'Ekonomi').
pilih_jenis_bus(2, 'Eksekutif').
pilih_jenis_bus(3, 'Super Eksekutif').

% fact
pilih_tujuan_bus(1, 'Bogor-Malang').
pilih_tujuan_bus(2, 'Bogor-Madiun').
pilih_tujuan_bus(3, 'Bogor-Surabaya').
pilih_tujuan_bus(4, 'Bogor-Yogyakarta').
pilih_tujuan_bus(5, 'Bogor-Palembang').
pilih_tujuan_bus(6, 'Bogor-Padang').

pilih_tujuan(PilihanBus, TujuanBus) :-
    TujuanBus = 7 -> write('Terima kasih telah menggunakan program ini.'), nl, !;
    TujuanBus < 1; TujuanBus > 7 -> write('Pilihan tujuan bus tidak sesuai.'), nl, tugaslabtiket;
    pilih_jenis_bus(PilihanBus, JenisBus),
    pilih_tujuan_bus(TujuanBus, Tujuan),
    harga(JenisBus, Tujuan, HargaTiket),
    format('Harga tiket untuk ~w ke ~w adalah: Rp ~d', [JenisBus, Tujuan, HargaTiket]), nl, nl,
    tugaslabtiket.