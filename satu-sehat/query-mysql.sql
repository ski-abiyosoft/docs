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
    kodepos IN ('PURO', 'IRJ');

DELETE FROM branch_department
WHERE
    koders = 'SKI'
    AND kodepos IN ('PURO', 'IRJ');

DELETE FROM satset_organizations
WHERE
    id IN ('9e440888-2ab1-4f97-9b29-80eff581344f', 'c9c04a20-da73-431a-a503-b5bddc7002b1', '0c4b3add-74a1-4ea7-839b-d5caf8e645f0');

-- Data Resource Location - Ruang Poli
DELETE FROM tbl_ruangpoli
WHERE
    koderuang = '01PURL';

DELETE FROM satset_locations
WHERE
    id IN ('46a18b96-d8bb-48f4-a9e0-1b79ff30fa79');

-- Data Resource Practitioner - Dokter dan Perawat
DELETE FROM tbl_dokter
WHERE
    kodokter IN ('SKIDR1001', 'SKIPRT0001');

DELETE FROM tbl_doktercabang
WHERE
    kodokter IN ('SKIDR1001', 'SKIPRT0001');

DELETE FROM satset_practitioners
WHERE
    id IN ('10009880728', '10014058550');

-- Data Resource Patient
DELETE FROM tbl_pasien
WHERE
    rekmed = '0000077';

DELETE FROM satset_patients
WHERE
    id IN ('P02478375538');

-- Data Resource Encounter - Outpatient
DELETE FROM tbl_regist
WHERE
    noreg = 'SKIRJ20250000077';

-- Resource Condition, Observation, ClinicalImpression - Rekam Medis
DELETE FROM tbl_rekammedisrs
WHERE
    noreg = 'SKIRJ20250000077';

-- Resource Condition, Procedure - Diagnosa dan Tindakan
DELETE FROM tbl_icdtr
WHERE
    noreg = 'SKIRJ20250000077'
    AND icdcode IN ('N18.4', 'N20.0', '39.95', '98.51');

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
        satset_organization_id
    )
VALUES
    (
        'SKI',
        'RUMAH SAKIT SISTEMKESEHATAN.ID',
        '01-100100',
        'info@ski.co.id',
        'ski.co.id',
        'Jl. Kaliurang Km 10, Ngaglik, Sleman, Daerah Istimewa Yogyakarta 55581',
        'Sleman',
        '55581',
        '34',
        '3404',
        '340405',
        '3404051004',
        '9e440888-2ab1-4f97-9b29-80eff581344f'
    );

INSERT INTO
    satset_organizations (id, type, attributes)
VALUES
    ('9e440888-2ab1-4f97-9b29-80eff581344f', '', '{"id":"9e440888-2ab1-4f97-9b29-80eff581344f"}');


-- Data Resource Organization - Department
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
    satset_organizations (id, type, organizationable_id, organizationable_type, attributes)
VALUES
    ('c9c04a20-da73-431a-a503-b5bddc7002b1', 'Poly', 1, 'App\\Models\\SatSet\\BranchDepartment', '{"id":"c9c04a20-da73-431a-a503-b5bddc7002b1"}');

-- Data Resource Organization - Department
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
    (2, 'SKI', 'PURO');

INSERT INTO
    satset_organizations (id, type, organizationable_id, organizationable_type, attributes)
VALUES
    ('0c4b3add-74a1-4ea7-839b-d5caf8e645f0', 'Poly', 2, 'App\\Models\\SatSet\\BranchDepartment', '{"id":"0c4b3add-74a1-4ea7-839b-d5caf8e645f0"}');

-- Data Resource Location - Ruang Poli
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
    ('46a18b96-d8bb-48f4-a9e0-1b79ff30fa79', '{"id":"46a18b96-d8bb-48f4-a9e0-1b79ff30fa79"}');

-- Data Resource Practitioner - Dokter dan Perawat
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
        '7308122501850002',
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
        '9372081501960003',
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
        '9372081501960003',
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

-- Resource Condition, Observation, ClinicalImpression - Rekam Medis
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
    tbl_icdtr (
        koders,
        noreg,
        rekmed,
        icdcode,
        utama
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        '0000077',
        'N18.4',
        1
    );

INSERT INTO
    tbl_icdtr (
        koders,
        noreg,
        rekmed,
        icdcode,
        utama
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        '0000077',
        'N20.0',
        0
    );

-- Resource Procedure - Tindakan
INSERT INTO
    tbl_icdtr (
        koders,
        noreg,
        rekmed,
        icdcode,
        utama
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        '0000077',
        '39.95',
        1
    );

INSERT INTO
    tbl_icdtr (
        koders,
        noreg,
        rekmed,
        icdcode,
        utama
    )
VALUES
    (
        'SKI',
        'SKIRJ20250000077',
        '0000077',
        '98.51',
        0
    );

COMMIT;
