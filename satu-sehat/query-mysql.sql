BEGIN;

-- =========================
-- HAPUS DATA SEBELUMNYA
-- =========================
-- Data Resource Organization - Provider
DELETE FROM tbl_namers
WHERE
    koders = 'SKI';

-- Data Resource Organization - Department
DELETE FROM tbl_namapos
WHERE
    kodepos IN ('PURO', 'PUGD', 'IRJ', 'IRI');

DELETE FROM branch_department
WHERE
    koders = 'SKI'
    AND kodepos IN ('PURO', 'PUGD', 'IRJ', 'IRI');

DELETE FROM satset_organizations
WHERE
    id IN (
        '9e440888-2ab1-4f97-9b29-80eff581344f',
        'c9c04a20-da73-431a-a503-b5bddc7002b1',
        '434d6af4-0c31-4c67-9f7e-eb4dced5235c',
        '0c4b3add-74a1-4ea7-839b-d5caf8e645f0',
        '1f73971b-fe3f-4c4e-8ea9-d57e9dcec63e'
    );

-- Data Resource Location - Ruang Poli, Bangsal Inap, Ruang Inap dan Kamar Inap
DELETE FROM tbl_ruangpoli
WHERE
    koderuang IN ('01PURL', '01PIGD');

DELETE FROM tbl_bangsal
WHERE
    bangsalid IN ('BL00000001');

DELETE FROM tbl_bangsal
WHERE
    bangsalid IN ('BL00000001');

DELETE FROM tbl_ruang
WHERE
    koderuang IN ('INAPB00177');

DELETE FROM tbl_kamar
WHERE
    kodekamar IN ('INAPB0017710');

DELETE FROM satset_locations
WHERE
    id IN ('46a18b96-d8bb-48f4-a9e0-1b79ff30fa79', '2cdbf6bb-fe51-42b2-a474-b2b9d0ba5613', '17d99116-af40-475f-adac-1b393020c3ec', '781e9eba-30d3-4166-adea-8e46e9c7e102', '3c30c892-3c71-445d-b2b5-da6460a466a0');

-- Data Resource Practitioner - Dokter, Perawat dan Apoteker
DELETE FROM tbl_dokter
WHERE
    kodokter IN ('SKIDR1001', 'SKIDR1002', 'SKIPRT0001', 'SKIPRT0002');

DELETE FROM tbl_doktercabang
WHERE
    kodokter IN ('SKIDR1001', 'SKIDR1002', 'SKIPRT0001', 'SKIPRT0002');

DELETE FROM satset_practitioners
WHERE
    id IN ('10009880728', '10006926841', '10014058550', '10001915884');

DELETE FROM users
WHERE
    name = 'aditya';

-- Data Resource Patient
DELETE FROM tbl_pasien
WHERE
    rekmed = '0000077';

DELETE FROM satset_patients
WHERE
    id IN ('P02478375538');

-- Data Resource Encounter
DELETE FROM tbl_regist
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

DELETE FROM tbl_kasir
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

-- Resource Observation - Triage (Emergency)
DELETE FROM tbl_triage
WHERE
    noreg IN ('SKIRJ20250000078');

-- Resource Condition, Observation, ClinicalImpression - Rekam Medis (Outpatient, Emergency dan Inpatient)
DELETE FROM tbl_rekammedisrs
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

DELETE FROM tbl_darirj
WHERE
    noreg IN ('SKIRJ20250000078');

-- Resource Observation - TTV (Inpatient)
DELETE FROM tbl_tanda_vital
WHERE
    noreg IN ('SKIRI20250000079');

-- Resource Condition, Procedure - Diagnosa dan Tindakan
DELETE FROM tbl_icdtr
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

-- Master Medication - Obat
DELETE FROM tbl_barang
WHERE
    kodebarang IN ('0300');

-- Resource MedicationRequest - E-Resep
DELETE FROM tbl_orderperiksa
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

DELETE FROM tbl_eresep
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

-- Resource QuestionnaireResponse - Telaah Resep
DELETE FROM tbl_apotelaah
WHERE
    orderno IN ('SKIER20250000000001', 'SKIER20250000000002');

-- Resource MedicationDispense - Farmasi Penjualan
DELETE FROM tbl_apoposting
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

DELETE FROM tbl_apohresep
WHERE
    noreg IN ('SKIRJ20250000077', 'SKIRJ20250000078', 'SKIRI20250000079');

DELETE FROM tbl_apodresep
WHERE
    resepno IN ('SKIR202506000000001', 'SKIR202506000000001');

DELETE FROM tbl_hmaslab
WHERE
    id IN (1);

DELETE FROM tbl_tarifh
WHERE
    id IN (1, 2);

DELETE FROM tbl_labmashasil
WHERE
    kodelab IN ('TARIF00066001');

DELETE FROM tbl_orderperiksa
WHERE
    orderno IN ('SKIEL2025000000001', 'SKIERD2025000000001');

DELETE FROM tbl_elab
WHERE
    notr IN ('SKIEL2025000000001');

DELETE FROM tbl_spesimen
WHERE
    nolaborat IN ('SKIAL20250000000001');

DELETE FROM tbl_spesimen_pemeriksaan
WHERE
    spesimen_id IN (1);

DELETE FROM tbl_hlab
WHERE
    nolaborat IN ('SKIAL20250000000001');

DELETE FROM tbl_dlab
WHERE
    id IN (1);

DELETE FROM tbl_dhasillabnew
WHERE
    nolaborat IN ('SKIAL20250000000001');

DELETE FROM tbl_eradio
WHERE
    notr IN ('SKIERD2025000000001');

DELETE FROM tbl_hradio
WHERE
    noradio IN ('SKIRD-202500000001');

DELETE FROM tbl_dradio
WHERE
    id IN (1);

DELETE FROM tbl_expertise
WHERE
    noradio IN ('SKIRD-202500000001');

-- Resource MedicationStatement - Riwayat Pengobatan
DELETE FROM tbl_riwayat_pengobatan
WHERE
    noreg IN ('SKIRJ20250000077');

-- =========================
-- INSERT DATA BARU
-- =========================
-- Data Resource Organization - Provider
INSERT INTO
    tbl_namers (
        koders,
        namars,
        phone,
        email,
        website,
        alamat,
        kota,
        postalCode,
        province,
        city,
        district,
        village,
        rw,
        rt,
        satset_organization_id
    )
VALUES
    (
        'SKI',
        'RUMAH SAKIT SISTEMKESEHATAN.ID',
        '01-100100',
        'info@ski.co.id',
        'ski.co.id',
        'Jl. Magelang No.188, Karangwaru, Kec. Tegalrejo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55242',
        'Sleman',
        '55242',
        '34',
        '3471',
        '347101',
        '3471011002',
        '00',
        '00',
        '9e440888-2ab1-4f97-9b29-80eff581344f'
    );

INSERT INTO
    satset_organizations (id, type, attributes)
VALUES
    (
        '9e440888-2ab1-4f97-9b29-80eff581344f',
        '',
        '{"id":"9e440888-2ab1-4f97-9b29-80eff581344f"}'
    );

-- Data Resource Organization - Department Instalasi Rawat Jalan
INSERT INTO
    tbl_namapos (
        kodepos,
        kodeunit,
        namapost,
        jenispost,
        is_farmacy,
        is_uronefrologi,
        ifilter
    )
VALUES
    (
        'IRJ',
        'IRJ',
        'Instalasi Rawat Jalan',
        NULL,
        0,
        0,
        ''
    );

INSERT INTO
    branch_department (id, koders, kodepos)
VALUES
    (1, 'SKI', 'IRJ');

INSERT INTO
    satset_organizations (
        id,
        type,
        organizationable_id,
        organizationable_type,
        attributes
    )
VALUES
    (
        'c9c04a20-da73-431a-a503-b5bddc7002b1',
        'Poly',
        1,
        'App\\Models\\SatSet\\BranchDepartment',
        '{"id":"c9c04a20-da73-431a-a503-b5bddc7002b1"}'
    );

-- Data Resource Organization - Department Instalasi Gawat Darurat
INSERT INTO
    tbl_namapos (
        kodepos,
        kodeunit,
        namapost,
        jenispost,
        is_farmacy,
        is_uronefrologi,
        ifilter
    )
VALUES
    (
        'PUGD',
        'PUGD',
        'Instalasi Gawat Darurat',
        NULL,
        0,
        0,
        ''
    );

INSERT INTO
    branch_department (id, koders, kodepos)
VALUES
    (2, 'SKI', 'PUGD');

INSERT INTO
    satset_organizations (
        id,
        type,
        organizationable_id,
        organizationable_type,
        attributes
    )
VALUES
    (
        '434d6af4-0c31-4c67-9f7e-eb4dced5235c',
        'Poly',
        2,
        'App\\Models\\SatSet\\BranchDepartment',
        '{"id":"434d6af4-0c31-4c67-9f7e-eb4dced5235c"}'
    );

-- Data Resource Organization - Department Spesialis Urologi
INSERT INTO
    tbl_namapos (
        kodepos,
        kodeunit,
        namapost,
        jenispost,
        is_farmacy,
        is_uronefrologi,
        ifilter
    )
VALUES
    (
        'PURO',
        'PURO',
        'Spesialis Urologi',
        'IRJ',
        0,
        1,
        'P'
    );

INSERT INTO
    branch_department (id, koders, kodepos)
VALUES
    (3, 'SKI', 'PURO');

INSERT INTO
    satset_organizations (
        id,
        type,
        organizationable_id,
        organizationable_type,
        attributes
    )
VALUES
    (
        '0c4b3add-74a1-4ea7-839b-d5caf8e645f0',
        'Poly',
        3,
        'App\\Models\\SatSet\\BranchDepartment',
        '{"id":"0c4b3add-74a1-4ea7-839b-d5caf8e645f0"}'
    );

-- Data Resource Organization - Department Instalasi Rawat Inap
INSERT INTO
    tbl_namapos (
        kodepos,
        kodeunit,
        namapost,
        jenispost,
        is_farmacy,
        is_uronefrologi,
        ifilter
    )
VALUES
    (
        'IRI',
        'IRI',
        'Instalasi Rawat Inap',
        NULL,
        0,
        0,
        ''
    );

INSERT INTO
    branch_department (id, koders, kodepos)
VALUES
    (4, 'SKI', 'IRI');

INSERT INTO
    satset_organizations (
        id,
        type,
        organizationable_id,
        organizationable_type,
        attributes
    )
VALUES
    (
        '1f73971b-fe3f-4c4e-8ea9-d57e9dcec63e',
        'Poly',
        4,
        'App\\Models\\SatSet\\BranchDepartment',
        '{"id":"1f73971b-fe3f-4c4e-8ea9-d57e9dcec63e"}'
    );

-- Data Resource Location - Ruang Poli Urologi
INSERT INTO
    tbl_ruangpoli (
        id,
        koders,
        kopoli,
        kodeunit,
        koderuang,
        namaruang,
        description,
        longitude,
        latitude,
        altitude,
        satset_location_id
    )
VALUES
    (
        1,
        'SKI',
        'PURO',
        'RSRR-GT1-B1-P1-URO',
        '01PURL',
        'Ruang Urologi',
        'Ruang konsultasi dan tindakan urologi SKI',
        '110.414738',
        '-7.715576',
        '114',
        '46a18b96-d8bb-48f4-a9e0-1b79ff30fa79'
    );

INSERT INTO
    satset_locations (id, attributes)
VALUES
    (
        '46a18b96-d8bb-48f4-a9e0-1b79ff30fa79',
        '{"id":"46a18b96-d8bb-48f4-a9e0-1b79ff30fa79"}'
    );

-- Data Resource Location - Ruang IGD
INSERT INTO
    tbl_ruangpoli (
        id,
        koders,
        kopoli,
        kodeunit,
        koderuang,
        namaruang,
        description,
        longitude,
        latitude,
        altitude,
        satset_location_id
    )
VALUES
    (
        2,
        'SKI',
        'PUGD',
        'GT1-B1-PUGD-PONEK',
        '01PIGD',
        'BED 01',
        'TEMPAT TIDUR 1 INSTALASI GAWAT DARURAT - PONEK',
        '110.414738',
        '-7.715576',
        '114',
        '2cdbf6bb-fe51-42b2-a474-b2b9d0ba5613'
    );

INSERT INTO
    satset_locations (id, attributes)
VALUES
    (
        '46a18b96-d8bb-48f4-a9e0-1b79ff30fa79',
        '{"id":"46a18b96-d8bb-48f4-a9e0-1b79ff30fa79"}'
    );

-- Data Resource Location - Bangsal Inap
INSERT INTO
    tbl_bangsal (
        koders,
        kodeunit,
        bangsalid,
        nama_bangsal,
        deskripsi,
        longitude,
        latitude,
        altitude,
        aktif,
        satset_location_id
    )
VALUES
    (
        'SKI',
        'SKI-GB1-R-RI-SDW',
        'BL00000001',
        'SADEWA',
        'BANGSAL RAWAT INAP PASIEN DEWASA DAN ANAK SADEWA - LANTAI 1 - GEDUNG BARAT',
        '-4.807.779.235.890.210',
        '10.536.385.747.905.800',
        '0',
        1,
        '17d99116-af40-475f-adac-1b393020c3ec'
    );

INSERT INTO
    satset_locations (id, attributes)
VALUES
    (
        '17d99116-af40-475f-adac-1b393020c3ec',
        '{"id":"17d99116-af40-475f-adac-1b393020c3ec"}'
    );

-- Data Resource Location - Ruang Inap
INSERT INTO
    tbl_ruang (
        koders,
        bangsalid,
        kodeunit,
        koderuang,
        namaruang,
        fasilitas,
        longitude,
        latitude,
        altitude,
        satset_location_id
    )
VALUES
    (
        'SKI',
        'BL00000001',
        'SKI-GB1-R-RI-SDW1',
        'INAPB00177',
        'SADEWA 1',
        'RUANG RAWAT INAP PASIEN DEWASA DAN ANAK SADEWA - LANTAI 1 - GEDUNG BARAT',
        '-4.807.779.235.890.210',
        '10.536.385.747.905.800',
        '0',
        '781e9eba-30d3-4166-adea-8e46e9c7e102'
    );

INSERT INTO
    satset_locations (id, attributes)
VALUES
    (
        '781e9eba-30d3-4166-adea-8e46e9c7e102',
        '{"id":"781e9eba-30d3-4166-adea-8e46e9c7e102"}'
    );

-- Data Resource Location - Kamar Inap
INSERT INTO
    tbl_kamar (
        koders,
        koderuang,
        kodeunit,
        kodekamar,
        namakamar,
        description,
        longitude,
        latitude,
        altitude,
        aktif,
        satset_location_id
    )
VALUES
    (
        'SKI',
        'INAPB00177',
        'SKI-GB1-RI-B1-SDW1-VIP',
        'INAPB0017710',
        'TT - 01',
        'Tempat Tidur 1 - Sadewa 1 - Kelas VIP - Lantai 1 - Gedung Barat',
        '-4.807.779.235.890.210',
        '10.536.385.747.905.800',
        '0',
        1,
        '3c30c892-3c71-445d-b2b5-da6460a466a0'
    );

INSERT INTO
    satset_locations (id, attributes)
VALUES
    (
        '3c30c892-3c71-445d-b2b5-da6460a466a0',
        '{"id":"3c30c892-3c71-445d-b2b5-da6460a466a0"}'
    );

-- Data Resource Practitioner - Dokter, Perawat dan Apoteker
INSERT INTO
    tbl_dokter (
        koders,
        kodokter,
        nik,
        nadokter,
        jenis_kerja_sama,
        jenispegawai,
        nostr,
        hp,
        status,
        satset_practitioner_id
    )
VALUES
    (
        'SKI',
        'SKIDR1001',
        '7209061211900001',
        'dr. Alexander',
        2,
        1,
        '10 01 0 0 0 00-0001001',
        '082211223344',
        'ON',
        '10009880728'
    );

INSERT INTO
    tbl_doktercabang (koders, kodokter)
VALUES
    ('SKI', 'SKIDR1001');

INSERT INTO
    tbl_dokter (
        koders,
        kodokter,
        nik,
        nadokter,
        jenis_kerja_sama,
        jenispegawai,
        nostr,
        hp,
        status,
        satset_practitioner_id
    )
VALUES
    (
        'SKI',
        'SKIDR1002',
        '3322071302900002',
        'dr. Yoga Yandika, Sp.A',
        2,
        1,
        '10 01 0 0 0 00-0001002',
        '082211223345',
        'ON',
        '10006926841'
    );

INSERT INTO
    tbl_doktercabang (koders, kodokter)
VALUES
    ('SKI', 'SKIDR1002');

INSERT INTO
    satset_practitioners (id, attributes)
VALUES
    ('10009880728', '{"id":"10009880728"}');

INSERT INTO
    tbl_dokter (
        koders,
        kodokter,
        nik,
        nadokter,
        jenis_kerja_sama,
        jenispegawai,
        nostr,
        hp,
        status,
        satset_practitioner_id
    )
VALUES
    (
        'SKI',
        'SKIPRT0001',
        '3313096403900009',
        'Sheila Annisa S.Kep',
        1,
        2,
        '10 01 0 0 0 00-0001002',
        '082211223355',
        'ON',
        '10014058550'
    );

INSERT INTO
    tbl_doktercabang (koders, kodokter)
VALUES
    ('SKI', 'SKIPRT0001');

INSERT INTO
    satset_practitioners (id, attributes)
VALUES
    ('10014058550', '{"id":"10014058550"}');

INSERT INTO
    tbl_dokter (
        koders,
        kodokter,
        nik,
        nadokter,
        jenis_kerja_sama,
        jenispegawai,
        nostr,
        hp,
        status,
        satset_practitioner_id
    )
VALUES
    (
        'SKI',
        'SKIPRT0002',
        '3578083008700010',
        'apt. Aditya Pradhana, S.Farm.',
        1,
        3,
        '',
        '082211223357',
        'ON',
        '10001915884'
    );

INSERT INTO
    tbl_doktercabang (koders, kodokter)
VALUES
    ('SKI', 'SKIPRT0002');

INSERT INTO
    satset_practitioners (id, attributes)
VALUES
    ('10001915884', '{"id":"10001915884"}');

INSERT INTO
    users (
        name,
        is_apoteker,
        koapoteker
    )
VALUES
    (
        'aditya',
        1,
        'SKIPRT0002'
    );

-- Data Resource Patient
INSERT INTO
    tbl_pasien (
        rekmed,
        idpas,
        noidentitas,
        namapas,
        jkel,
        tgllahir,
        tempatlahir,
        alamat,
        kodepos,
        propinsi,
        kabupaten,
        kecamatan,
        kelurahan,
        rw,
        rt,
        status,
        cust_id,
        nik,
        last_reservation,
        satset_patient_id
    )
VALUES
    (
        '0000077',
        'KTP',
        '9271060312000001',
        'Ardianto Putra',
        '1',
        '1996-08-15 00:00:00',
        'Bantul',
        'Jl. Parangtritis Km.7, Sewon, Bantul, DIY',
        '55715',
        '34',
        '3402',
        '340205',
        '3402051005',
        '02',
        '01',
        '2',
        '',
        '9271060312000001',
        '',
        'P02478375538'
    );

INSERT INTO
    satset_patients (id, attributes)
VALUES
    ('P02478375538', '{"id":"P02478375538"}');

-- Resource Encounter - Outpatient
INSERT INTO
    tbl_regist (
        koders,
        noreg,
        rekmed,
        tglmasuk,
        jam,
        jenispas,
        tujuan,
        kodepos,
        kodokter,
        koderuang,
        keluar,
        closerm,
        tglkeluar,
        jamkeluar
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        '0000077',
        '2025-04-24 10:27:06',
        '10:27:06',
        'PAS1',
        1,
        'PURO',
        'SKIDR1001',
        1,
        1,
        1,
        '2025-04-24 11:05:00',
        '11:05:00'
    );

INSERT INTO
    tbl_kasir (koders, nokwitansi, noreg, rekmed, tglbayar, jambayar)
VALUES
    ('SKI', 'SKI2025000000000001', 'SKIRJ20250000077', '0000077', '2025-04-24 11:15:00', '11:15:00');

-- Resource Condition, Observation, ClinicalImpression - Rekam Medis (Outpatient)
INSERT INTO
    tbl_rekammedisrs (
        koders,
        noreg,
        rekmed,
        kodepos,
        koperawat,
        tglperiksa,
        jam,
        kodokter,
        tglkonsul,
        jamdikonsul,
        alergi_lingkungan,
        alergi_makanan,
        alergi_obat,
        tdarah,
        tdarah1,
        nadi,
        nafas,
        suhu,
        oksigen,
        tinggibadan,
        beratbadan,
        bmi,
        bmiresult,
        riwayat_psikososial_dan_spiritual_data,
        prognosa,
        uronefrologi,
        keluhanawal,
        kondisi_pulang
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        '0000077',
        'PURO',
        'SKIPRT0001',
        '2025-04-24 10:30:00',
        '10:30:00',
        'SKIDR00001',
        '2025-04-24 10:35:00',
        '10:35:00',
        '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Debu Rumah","keterangan":null}]',
        '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Alergi daging bebek","keterangan":null}]',
        '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Azitromicin","keterangan":null},{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Paracetamol","keterangan":null}]',
        110,
        90,
        90,
        30,
        40,
        98,
        170,
        54,
        18.68,
        'Normal Weight',
        '{"status_mental":"Marah","status_mental_lainnya":null}',
        '03',
        '{"hipertensi":"1","derajat_hipertensi":"827069000|Stage 1 hypertension","mendapat_obat_hipertensi":"1","hipertensi_terkontrol":"1","batu_saluran_kemih":"1","lokasi_batu":"18639004|Left kidney","derajat_hidronefrosis":"258351006|Grade 1","diabetes_mellitus":"1","mendapat_obat_diabetes_mellitus":"1","diabetes_mellitus_terkontrol":"1","keparahan_batu_saluran_kemih":"709044004|Chronic kidney disease"}',
        'Penurunan output urin',
        'KELUAR002'
    );

-- Resource Condition - Diagnosa
INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000077', '0000077', 'N18.4', 1);

INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000077', '0000077', 'N20.0', 0);

-- Resource Procedure - Tindakan
INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000077', '0000077', '39.95', 1);

INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000077', '0000077', '98.51', 0);

-- Master Medication - Obat
INSERT INTO
    tbl_barang (
        kodebarang,
        namabarang,
        namageneric,
        satuan1
    )
VALUES
    (
        '0300',
        'PARACETAMOL 500MG TAB KF',
        'PARACETAMOL 500MG TAB KF',
        'TABLET'
    );

-- Resource MedicationRequest - E-Resep
INSERT INTO
    tbl_orderperiksa (
        koders,
        orderno,
        noreg,
        rekmed,
        tglorder,
        jamorder,
        proses,
        kodokter,
        asal,
        resep,
        resepok,
        username,
        gudang,
        obatpulang,
        kodepos
    )
VALUES
    (
        'SKI',
        'SKIER20250000000001',
        'SKIRJ20250000077',
        '0000077',
        '2025-04-24 10:35:00',
        '10:35:00',
        '1',
        'SKIDR1001',
        'Spesialis Urologi | Ruang Spesialis Urologi',
        1,
        1,
        'admin',
        'FARMASI',
        0,
        'PURO'
    );

INSERT INTO
    tbl_eresep (
        koders,
        noreg,
        orderno,
        kodeobat,
        namaobat,
        satuan,
        qty,
        harga,
        totalharga,
        aturanpakai,
        kronis
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        'SKIER20250000000001',
        '0300',
        'PARACETAMOL 500MG TAB KF',
        'TABLET',
        12,
        235,
        2830,
        '3 X 1',
        0
    );

-- Resource QuestionnaireResponse - Telaah Resep
INSERT INTO
    tbl_apotelaah (orderno, kode, aspek, unsur, resepno, ok)
VALUES
    (
        'SKIER20250000000001',
        1,
        'KELENGKAPAN PENGISIAN RESEP',
        'administrasi',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        2,
        'KEJELASAN PENULISAN RESEP',
        'administrasi',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        3,
        'TETAP OBAT (NAMA, BENTUK, KEKUATAN,JUMLAH)',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        4,
        'TEPAT FREKUENSI',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        5,
        'OBAT STABIL SECARA FISIK DAN KIMIA',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        6,
        'OBAT TERSEDIA',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        7,
        'TEPAT INDIKASI/DOSIS/WAKTU/RUTE',
        'klinis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        8,
        'DUPLIKASI TERAPI',
        'klinis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        9,
        'INTERAKSI',
        'klinis',
        '',
        1
    ),
    (
        'SKIER20250000000001',
        10,
        'KONTRADIKSI',
        'klinis',
        '',
        1
    ),
    (
        'RSAER20250000019324',
        11,
        'ROTD/TOKSISITAS',
        'klinis',
        '',
        1
    );

-- Resource MedicationDispense - Farmasi Penjualan
INSERT INTO
    tbl_apoposting (
        koders,
        resepno,
        eresepno,
        tglresep,
        noreg,
        rekmed,
        namapas,
        umurpas,
        gudang,
        poscredit,
        diskonrp,
        bayar,
        posting,
        keluar,
        kodepel,
        username
    )
VALUES
    (
        'SKI',
        'SKIR202506000000001',
        'SKIER20250000000001',
        '2025-04-24 10:38:00',
        'SKIRJ20250000077',
        '0000077',
        'Ardianto Putra',
        '28 tahun, 8 bulan, 9 hari',
        'FARMASI',
        2830,
        0,
        0,
        1,
        0,
        'RAJAL',
        'admin'
    );

INSERT INTO
    tbl_apohresep (
        koders,
        resepno,
        eresepno,
        noreg,
        rekmed,
        jenisjual,
        jenispas,
        pro,
        tglresep,
        jam,
        kodokter,
        gudang,
        bayar,
        posting,
        username,
        kodepel,
        tgl_telaah,
        user_telaah
    )
VALUES
    (
        'SKI',
        'SKIR202506000000001',
        'SKIER20250000000001',
        'SKIRJ20250000077',
        '0000077',
        1,
        1,
        'Ardianto Putra',
        '2025-04-24 10:38:00',
        '10:38:00',
        'SKIDR1001',
        'FARMASI',
        0,
        1,
        'admin',
        'RAJAL',
        '2025-04-24 10:39:00',
        'user_apoteker'
    );

INSERT INTO
    tbl_apodresep (
        resepno,
        eresepno,
        koders,
        kodebarang,
        namabarang,
        qty,
        satuan,
        discrp,
        price,
        hna,
        hpp,
        ppntype,
        totalrp,
        atpakai,
        exp_date,
        kronis
    )
VALUES
    (
        'SKIR202506000000001',
        'SKIER20250000000001',
        'SKI',
        '0300',
        'PARACETAMOL 500MG TAB KF',
        12,
        'TABLET',
        0,
        235,
        170,
        170,
        1,
        2830,
        '3 X 1',
        '2025-06-11',
        0
    );

-- Resource Encounter - Emergency
INSERT INTO
    tbl_regist (
        koders,
        noreg,
        rekmed,
        tglmasuk,
        jam,
        jenispas,
        tujuan,
        kodepos,
        kodokter,
        koderuang,
        keluar,
        closerm,
        tglkeluar,
        jamkeluar
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000078',
        '0000077',
        '2025-04-25 10:27:06',
        '10:27:06',
        'PAS1',
        1,
        'PUGD',
        'SKIDR1001',
        2,
        1,
        1,
        '2025-04-25 11:05:00',
        '11:05:00'
    );

-- Resource Observation - Triage (Emergency)
INSERT INTO
    tbl_triage (
        koders,
        noreg,
        rekmed,
        tanggal,
        jam,
        kodokter,
        perawat,
        sarana_datang,
        kondisi_pasien_tiba,
        nyeri,
        frekuensinyeri,
        level_kesadaran
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000078',
        '0000077',
        '2025-04-25 10:30:00',
        '10:30:00',
        'SKIDR00001',
        'SKIPRT0001',
        'Ambulance',
        'Urgent',
        1,
        2,
        'Voice'
    );

-- Resource Condition, Observation, QuestionnaireResponse, ClinicalImpression - Rekam Medis (Emergency)
INSERT INTO
    tbl_rekammedisrs (
        koders,
        noreg,
        rekmed,
        kodepos,
        koperawat,
        tglperiksa,
        jam,
        kodokter,
        tglkonsul,
        jamdikonsul,
        alergi_lingkungan,
        alergi_makanan,
        alergi_obat,
        tdarah,
        tdarah1,
        nadi,
        nafas,
        suhu,
        oksigen,
        tinggibadan,
        beratbadan,
        bmi,
        bmiresult,
        riwayat_psikososial_dan_spiritual_data,
        prognosa,
        keluhanawal,
        resiko_dekubitus,
        skrining_batuk,
        skrining_gizi,
        kondisi_pulang
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000078',
        '0000077',
        'PUGD',
        'SKIPRT0001',
        '2025-04-25 10:30:00',
        '10:30:00',
        'SKIDR00001',
        '2025-04-25 10:35:00',
        '10:35:00',
        '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Debu Rumah","keterangan":null}]',
        '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Alergi daging bebek","keterangan":null}]',
        '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Azitromicin","keterangan":null},{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Paracetamol","keterangan":null}]',
        110,
        90,
        90,
        30,
        40,
        98,
        170,
        54,
        18.68,
        'Normal Weight',
        '{"status_mental":"Marah","status_mental_lainnya":null}',
        '03',
        'Pusing',
        0,
        '[{"linkId":"1.1","text":"Apakah memiliki riwayat demam?","answer":"0"},{"linkId":"1.2","text":"Apakah berkeringat pada malam hari walaupun tanpa aktivitas?","answer":"0"},{"linkId":"1.3","text":"Apakah memiliki riwayat berpergian dari daerah wabah?","answer":"0"},{"linkId":"1.4","text":"Apakah memiliki riwayat pemakaian obat jangka panjang?","answer":"0"},{"linkId":"1.5","text":"Apakah memiliki riwayat BB turun tanpa sebab yang diketahui?","answer":"0"}]',
        '[{"linkId":"2.1","text":"Apakah ada  penurunan BB dalam waktu 6 bulan terakhir?","answer":"0"},{"linkId":"2.2","text":"Apakah ada penurunan asupan makanan karena nafsu makan berkurang?","answer":"0"},{"linkId":"2.3","text":"Apakah mengalami gejala gastrointestinal (seperti mual, muntah, diare, anorexia)?","answer":"0"},{"linkId":"2.4","text":"Apakah memiliki faktor pemberat (komorbid)?","answer":"0"},{"linkId":"2.5","text":"Apakah ada penurunan kapasitas fungsional?","answer":"0"}]',
        'KELUAR008'
    );

INSERT INTO
    tbl_darirj (
        noreg,
        noreginap,
        rekmed,
        tglmasuk,
        jammasuk,
        kodokter,
        kodepos
    )
VALUES
    (
        'SKIRJ20250000078',
        'SKIRI20250000079',
        '0000077',
        '2025-04-25 11:05:00',
        '11:05:00',
        'SKIDR00001',
        'PUGD'
    );

-- Resource MedicationRequest - E-Resep
INSERT INTO
    tbl_orderperiksa (
        koders,
        orderno,
        noreg,
        rekmed,
        tglorder,
        jamorder,
        proses,
        kodokter,
        asal,
        resep,
        resepok,
        username,
        gudang,
        obatpulang,
        kodepos
    )
VALUES
    (
        'SKI',
        'SKIER20250000000002',
        'SKIRJ20250000078',
        '0000077',
        '2025-04-25 10:35:00',
        '10:35:00',
        '1',
        'SKIDR1001',
        'Instalasi Gawat Darurat | BED 01',
        1,
        1,
        'admin',
        'FARMASI',
        0,
        'PUGD'
    );

INSERT INTO
    tbl_eresep (
        koders,
        noreg,
        orderno,
        kodeobat,
        namaobat,
        satuan,
        qty,
        harga,
        totalharga,
        aturanpakai,
        kronis
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000078',
        'SKIER20250000000002',
        '0300',
        'PARACETAMOL 500MG TAB KF',
        'TABLET',
        12,
        235,
        2830,
        '3 X 1',
        0
    );

-- Resource QuestionnaireResponse - Telaah Resep
INSERT INTO
    tbl_apotelaah (orderno, kode, aspek, unsur, resepno, ok)
VALUES
    (
        'SKIER20250000000002',
        1,
        'KELENGKAPAN PENGISIAN RESEP',
        'administrasi',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        2,
        'KEJELASAN PENULISAN RESEP',
        'administrasi',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        3,
        'TETAP OBAT (NAMA, BENTUK, KEKUATAN,JUMLAH)',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        4,
        'TEPAT FREKUENSI',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        5,
        'OBAT STABIL SECARA FISIK DAN KIMIA',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        6,
        'OBAT TERSEDIA',
        'farmasetis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        7,
        'TEPAT INDIKASI/DOSIS/WAKTU/RUTE',
        'klinis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        8,
        'DUPLIKASI TERAPI',
        'klinis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        9,
        'INTERAKSI',
        'klinis',
        '',
        1
    ),
    (
        'SKIER20250000000002',
        10,
        'KONTRADIKSI',
        'klinis',
        '',
        1
    ),
    (
        'RSAER20250000019324',
        11,
        'ROTD/TOKSISITAS',
        'klinis',
        '',
        1
    );

-- Resource MedicationDispense - Farmasi Penjualan
INSERT INTO
    tbl_apoposting (
        koders,
        resepno,
        eresepno,
        tglresep,
        noreg,
        rekmed,
        namapas,
        umurpas,
        gudang,
        poscredit,
        diskonrp,
        bayar,
        posting,
        keluar,
        kodepel,
        username
    )
VALUES
    (
        'SKI',
        'SKIR202506000000002',
        'SKIER20250000000002',
        '2025-04-25 10:38:00',
        'SKIRJ20250000078',
        '0000077',
        'Ardianto Putra',
        '28 tahun, 8 bulan, 9 hari',
        'FARMASI',
        2830,
        0,
        0,
        1,
        0,
        'RAJAL',
        'admin'
    );

INSERT INTO
    tbl_apohresep (
        koders,
        resepno,
        eresepno,
        noreg,
        rekmed,
        jenisjual,
        jenispas,
        pro,
        tglresep,
        jam,
        kodokter,
        gudang,
        bayar,
        posting,
        username,
        kodepel,
        tgl_telaah,
        user_telaah
    )
VALUES
    (
        'SKI',
        'SKIR202506000000002',
        'SKIER20250000000002',
        'SKIRJ20250000078',
        '0000077',
        1,
        1,
        'Ardianto Putra',
        '2025-04-25 10:38:00',
        '10:38:00',
        'SKIDR1001',
        'FARMASI',
        0,
        1,
        'admin',
        'RAJAL',
        '2025-04-25 10:39:00',
        'user_apoteker'
    );

INSERT INTO
    tbl_apodresep (
        resepno,
        eresepno,
        koders,
        kodebarang,
        namabarang,
        qty,
        satuan,
        discrp,
        price,
        hna,
        hpp,
        ppntype,
        totalrp,
        atpakai,
        exp_date,
        kronis
    )
VALUES
    (
        'SKIR202506000000002',
        'SKIER20250000000002',
        'SKI',
        '0300',
        'PARACETAMOL 500MG TAB KF',
        12,
        'TABLET',
        0,
        235,
        170,
        170,
        1,
        2830,
        '3 X 1',
        '2025-06-11',
        0
    );

-- Resource Condition - Diagnosa
INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000078', '0000077', 'N18.4', 1);

INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000078', '0000077', 'N20.0', 0);

-- Resource Procedure - Tindakan
INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000078', '0000077', '39.95', 1);

INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRJ20250000078', '0000077', '98.51', 0);

-- Resource Encounter - Inpatient
INSERT INTO
    tbl_regist (
        koders,
        noreg,
        rekmed,
        tglmasuk,
        jam,
        jenispas,
        tujuan,
        kodokter,
        koderuang,
        kodekamar,
        keluar,
        closerm,
        tglkeluar,
        jamkeluar
    )
VALUES
    (
        'SKI',
        'SKIRI20250000079',
        '0000077',
        '2025-04-25 11:05:00',
        '11:05:00',
        'PAS1',
        2,
        'SKIDR1001',
        'INAPB00177',
        'INAPB0017710',
        1,
        1,
        '2025-04-29 11:05:00',
        '11:05:00'
    );

INSERT INTO
    tbl_kasir (koders, nokwitansi, noreg, rekmed, tglbayar, jambayar)
VALUES
    ('SKI', 'SKI2025000000000003', 'SKIRI20250000079', '0000077', '2025-04-29 11:15:00', '11:15:00');

-- Resource Condition - Rekam Medis (Inpatient)
INSERT INTO
    tbl_rekammedisrs (
        koders,
        noreg,
        rekmed,
        tglperiksa,
        jam,
        kodokter,
        tglkonsul,
        jamdikonsul,
        kondisi_pulang
    )
VALUES
    (
        'SKI',
        'SKIRI20250000079',
        '0000077',
        '2025-04-25 12:30:00',
        '12:30:00',
        'SKIDR00001',
        '2025-04-25 12:30:00',
        '12:30:00',
        'KELUAR002'
    );

-- Resource Observation - TTV (Inpatient)
INSERT INTO
    tbl_tanda_vital (
        tanggal,
        noreg,
        rekmed,
        td1,
        td2,
        nadi,
        rr,
        suhu,
        spo2
    )
VALUES
    (
        '2025-04-25 12:30:00',
        'SKIRI20250000079',
        '0000077',
        110,
        90,
        90,
        30,
        40,
        98
    );

-- Resource Condition - Diagnosa
INSERT INTO
    tbl_icdtr (koders, noreg, rekmed, icdcode, utama)
VALUES
    ('SKI', 'SKIRI20250000079', '0000077', 'N18.4', 1);

-- Master Golongan Pemeriksaan Laboratorium
INSERT INTO
    tbl_hmaslab (id, koders, kodegol, namagol)
VALUES
    (1, 'SKI', 'HM', 'HEMATOLOGI');

-- Master Tarif Pemeriksaan Laboratorium
INSERT INTO
    tbl_tarifh (id, koders, kodetarif, tindakan, kodepos, hmaslab_id)
VALUES
    (1, 'SKI', 'TARIF00066', 'Trombosit', 'LABOR', 1);

-- Master Hasil Pemeriksaan Laboratorium
INSERT INTO
    tbl_labmashasil (koders, tarifh_id, kodeperiksa, kodelab, nmperiksa, satuan, nilainormalp1, nilainormalp2, nilainormalw1, nilainormalw2, nilainormala1, nilainormala2)
VALUES
    ('SKI', 1, 'TARIF00066', 'TARIF00066001', 'Trombosit', 'ribu/ul', 150, 400, 150, 400, 150, 450);

-- Order Pemeriksaan Laboratorium
INSERT INTO
    tbl_orderperiksa (koders, orderno, noreg, rekmed, tglorder, jamorder, proses, kodokter, asal, lab, labok, username, kodepos)
VALUES
    ('SKI', 'SKIEL2025000000001', 'SKIRJ20250000077', '0000077', '2025-04-24 10:35:00', '10:35:00', 1, 'SKIDR1001', 'Spesialis Urologi \| Ruang Spesialis Urologi', 1, 1, 'admin', 'PURO');

INSERT INTO
    tbl_elab (noreg, notr, kodetarif, tindakan, tarifrs, tarifdr)
VALUES
    ('SKIRJ20250000077', 'SKIEL2025000000001', '1', 'Trombosit', 35000, 0);

-- Spesimen Pemeriksaan Laboratorium
INSERT INTO
    tbl_spesimen (id, nolaborat, kode_jenis_spesimen, kode_metode_pengambilan, kode_petugas, qty, kode_satuan, tanggal_diambil, tanggal_diserahkan)
VALUES
    (1, 'SKIAL20250000000001', '119297000', '82078001', 'SKIPRT0001', 10, 'mL', '2025-04-24 12:00:00', '2025-04-24 12:10:00');

INSERT INTO
    tbl_spesimen_pemeriksaan (spesimen_id, pemeriksaan_id)
VALUES
    (1, 1);

-- Pemeriksaan Laboratorium
INSERT INTO
    tbl_hlab (koders, nolaborat, orderno, noreg, rekmed, tgllab, jam, posting, asal, drpengirim, drperiksa, kodepetugas, tglselesai, jamselesai, username)
VALUES
    ('SKI', 'SKIAL20250000000001', 'SKIEL2025000000001', 'SKIRJ20250000077', '0000077', '2025-04-24 10:35:00', '10:35:00', 1, 'Spesialis Urologi | Ruang Spesialis Urologi', 'SKIDR1001', 'SKIDR1002', 'SKIPRT0001', '2025-04-24 13:45:00', '13:45:00', 'admin');

INSERT INTO
    tbl_dlab (id, nolaborat, kodetarif, qty, tarifrs, tarifdr, tarifrp, totalrp, kesimpulan_pemeriksaan)
VALUES
    (1, 'SKIAL20250000000001', '1', '1', 35000, 0, 35000, 35000, 'High');

INSERT INTO
    tbl_dhasillabnew (nolaborat, dlab_id, kodeperiksa, kodelab, pemeriksaan, satuan, hasilc, normal1, normal2)
VALUES
    ('SKIAL20250000000001', 1, '1', 'TARIF00066001', 'Trombosit', 'ribu/ul', 405, 150, 400);

-- Master Tarif Pemeriksaan Radiologi
INSERT INTO
    tbl_tarifh (id, koders, kodetarif, tindakan, kodepos)
VALUES
    (2, 'SKI', 'RD-B000082', 'THORAX AP/PA', 'RADIO');

-- Order Pemeriksaan Radiologi
INSERT INTO
    tbl_orderperiksa (koders, orderno, noreg, rekmed, tglorder, jamorder, proses, kodokter, asal, lab, labok, username, kodepos)
VALUES
    ('SKI', 'SKIERD2025000000001', 'SKIRJ20250000077', '0000077', '2025-04-24 10:35:00', '10:35:00', 1, 'SKIDR1001', 'Spesialis Urologi \| Ruang Spesialis Urologi', 1, 1, 'admin', 'PURO');

INSERT INTO
    tbl_eradio (noreg, notr, kodetarif, tindakan, tarifrs, tarifdr)
VALUES
    ('SKIRJ20250000077', 'SKIERD2025000000001', '2', 'THORAX AP/PA', 139500, 40500);

-- Pemeriksaan Radiologi
INSERT INTO
    tbl_hradio (koders, noradio, orderno, noreg, rekmed, tglradio, jam, posting, asal, drpengirim, drperiksa, kodepetugas, tglfoto, jamfoto, tglselesai, jamselesai, username)
VALUES
    ('SKI', 'SKIRD-202500000001', 'SKIERD2025000000001', 'SKIRJ20250000077', '0000077', '2025-04-24 10:35:00', '10:35:00', 1, 'Spesialis Urologi | Ruang Spesialis Urologi', 'SKIDR1001', 'SKIDR1002', 'SKIPRT0001', '2025-04-24', '11:00:00', '2025-04-24 13:45:00', '13:45:00', 'admin');

INSERT INTO
    tbl_dradio (id, noradio, kodetarif, qty, tarifrs, tarifdr, tarif_rp, total_biaya)
VALUES
    (1, 'SKIRD-202500000001', '2', 1, 139500, 40500, 180000, 180000);

INSERT INTO
    tbl_expertise (noradio, dradio_id, catatan, klinis)
VALUES
    ('SKIRD-202500000001', 1, 'Left upper and middle lung zones show reticulonodular opacities.\nThe left apical lung zone shows a cavitary lesion (active TB).\nLeft apical pleural thickening.\nMild mediastinum widening is noted.\nNormal heart size.\nFree costophrenic angles.', 'Tidak ada kelainan dari gejala DB');

-- Riwayat Pengobatan yang dikonsumsi Pasien sebelumnya berasal dari Fasyankes tempat dilakukan pelayanan
INSERT INTO
    tbl_riwayat_pengobatan (tgl_diberikan, resep_id, dosis, status, noreg, rekmed, obat, created_at)
VALUES
    ('2025-06-04 08:59:30', 131592, '2 x 1', 'completed', 'SKIRJ20250000077', '0000077', 'BIOSANBE CAPS', '2026-01-22 11:00:00');

-- Riwayat Pengobatan yang dikonsumsi Pasien sebelumnya bukan berasal dari Fasyankes tempat dilakukan pelayanan
INSERT INTO
    tbl_riwayat_pengobatan (tgl_diberikan, kfa_code, dosis, status, noreg, rekmed, obat, created_at)
VALUES
    ('2025-06-04 08:59:30', '93015366', '3 x 1', 'active', 'SKIRJ20250000077', '0000077', 'Paracetamol 500 mg Tablet (PARACETAMOL TABLET 500 MG, STRIP)', '2026-01-22 11:00:00');
COMMIT;
