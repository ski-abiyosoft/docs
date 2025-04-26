# Dokumentasi Data Satu Sehat

## Deskripsi

Dokumentasi ini menjelaskan tentang bagaimana cara melakukan insert data ke dalam tabel-tabel terkait dalam satu sehat.

---

## 1. Resource Organization - Provider

### Contoh Data Provider:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_namers` menggunakan `koders`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_namers`

| Nama Kolom         | Keterangan                                                       | Contoh Data                            |
|--------------------|------------------------------------------------------------------|----------------------------------------|
| `koders`           | Kode Rumah Sakit                                                 | 'SKI'                                  |
| `namars`           | Nama Rumah Sakit                                                 | 'RUMAH SAKIT SISTEMKESEHATAN.ID'       |
| `phone`            | Nomor Telepon Rumah Sakit                                        | '00-000010'                            |
| `email`            | Alamat Email Rumah Sakit                                         | 'ski@info.com'                         |
| `website`          | Website Rumah Sakit                                              | 'ski.com'                              |
| `alamat`           | Alamat Rumah Sakit                                               | 'Jl. Magelang No.188, Karangwaru, Kec. Tegalrejo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55242' |
| `kota`             | Kota Rumah Sakit                                                 | 'Yogyakarta'                           |
| `postalCode`       | Kode Pos Rumah Sakit                                             | '55242'                                |
| `province`         | Kode Provinsi Rumah Sakit                                        | '34'                                   |
| `city`             | Kode Kota/Kabupaten Rumah Sakit                                  | '3471'                                 |
| `district`         | Kode Kecamatan Rumah Sakit                                       | '347101'                               |
| `village`          | Kode Kelurahan/Desa Rumah Sakit                                  | '3471011002'                           |
| `rw`               | RW Rumah Sakit                                                   | '00'                                   |
| `rt`               | RT Rumah Sakit                                                   | '00'                                   |
| `satset_organization_id` | ID Resource Organization (Satu Sehat)                      | '9e440888-2ab1-4f97-9b29-80eff581344f' |

**Jika sudah pernah mengirim Resource Organization - Provider maka wajib insert ke `satset_organizations`**

**Tabel:** `satset_organizations`

| Nama Kolom            | Keterangan                                                    | Contoh Data                                      |
|-----------------------|---------------------------------------------------------------|--------------------------------------------------|
| `id`                  | ID Resource Organization (Satu Sehat)                         | '9e440888-2ab1-4f97-9b29-80eff581344f'           |
| `type`                | Jenis Organization                                            | ''                                               |
| `attributes`          | Data Resource Organization (Satu Sehat)                       | '{"id":"9e440888-2ab1-4f97-9b29-80eff581344f"}'  |

---

## 2. Resource Organization - Department

### Contoh Data Department Instalasi Rawat Jalan:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_namapos` menggunakan `kodepos`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_namapos`

| Nama Kolom        | Keterangan                                                | Contoh Data             |
|-------------------|-----------------------------------------------------------|-------------------------|
| `kodepos`         | Kode Unit                                                 | 'IRJ'                   |
| `kodeunit`        | Kode Unit Satu Sehat                                      | 'IRJ'                   |
| `namapost`        | Nama Unit                                                 | 'Instalasi Rawat Jalan' |
| `jenispost`       | Part Of (Kode Unit)                                       | null                    |
| `is_farmacy`      | 1 jika Unit Farmasi, 0 jika bukan                         | 0                       |
| `is_uronefrologi` | 1 jika Unit Urologi atau Penyakit Dalam, 0 jika bukan     | 0                       |


**Sebelum melakukan insert, lakukan pengecekan dengan `branch_department` menggunakan `koders` dan `kodepos`. Jika sudah ada, jangan insert.**

**Tabel:** `branch_department`

| Nama Kolom        | Keterangan                                                | Contoh Data |
|-------------------|-----------------------------------------------------------|-------------|
| `id`              | ID unik                                                   | 1           |
| `koders`          | Kode RS                                                   | 'SKI'       |
| `kodepos`         | Kode Unit RS                                              | 'IRJ'       |

**Jika sudah pernah mengirim Resource Organization - Department maka wajib insert ke `satset_organizations`**

**Tabel:** `satset_organizations`

| Nama Kolom              | Keterangan                                                   | Contoh Data                                     |
|-------------------------|--------------------------------------------------------------|-------------------------------------------------|
| `id`                    | ID Resource Organization (Satu Sehat)                        | 'c9c04a20-da73-431a-a503-b5bddc7002b1'          |
| `type`                  | Jenis Organization                                           | 'Poly'                                          |
| `organizationable_id`   | ID Branch Department (Branch Department yang telah diinsert) | 1                                               |
| `organizationable_type` | Nama Model Branch Department di Laravel                      | 'App\Models\SatSet\BranchDepartment'            |
| `attributes`            | Data Resource Organization (Satu Sehat)                      | '{"id":"c9c04a20-da73-431a-a503-b5bddc7002b1"}' |

### Contoh Data Department Spesialis Urologi:
**Prosedur insert yang sama seperti Instalasi Rawat Jalan.**

**Tabel:** `tbl_namapos`

| Nama Kolom        | Keterangan                                                | Contoh Data        |
|-------------------|-----------------------------------------------------------|--------------------|
| `kodepos`         | Kode Unit                                                 | 'PURO'             |
| `kodeunit`        | Kode Unit Satu Sehat                                      | 'PURO'             |
| `namapost`        | Nama Unit                                                 | 'Spesialis Urologi'|
| `jenispost`       | Part Of (Kode Unit)                                       | 'IRJ'              |
| `is_farmacy`      | 1 jika Unit Farmasi, 0 jika bukan                         | 0                  |
| `is_uronefrologi` | 1 jika Unit Urologi atau Penyakit Dalam, 0 jika bukan     | 1                  |
| `ifilter`          | P jika Poli, A jika APS, M jika penunjang medis           | 'P'                |


**Sebelum melakukan insert, lakukan pengecekan dengan `branch_department` menggunakan `koders` dan `kodepos`. Jika sudah ada, jangan insert.**

**Tabel:** `branch_department`

| Nama Kolom        | Keterangan                                                | Contoh Data |
|-------------------|-----------------------------------------------------------|-------------|
| `id`              | ID unik                                                   | 2           |
| `koders`          | Kode RS                                                   | 'SKI'       |
| `kodepos`         | Kode Unit RS                                              | 'PURO'      |

**Jika sudah pernah mengirim Resource Organization - Department maka wajib insert ke `satset_organizations`**

**Tabel:** `satset_organizations`

| Nama Kolom              | Keterangan                                                   | Contoh Data                                     |
|-------------------------|--------------------------------------------------------------|-------------------------------------------------|
| `id`                    | ID Resource Organization (Satu Sehat)                        | '0c4b3add-74a1-4ea7-839b-d5caf8e645f0'          |
| `type`                  | Jenis Organization                                           | 'Poly'                                          |
| `organizationable_id`   | ID Branch Department (Branch Department yang telah diinsert) | 2                                               |
| `organizationable_type` | Nama Model Branch Department di Laravel                      | 'App\Models\SatSet\BranchDepartment'            |
| `attributes`            | Data Resource Organization (Satu Sehat)                      | '{"id":"0c4b3add-74a1-4ea7-839b-d5caf8e645f0"}' |

---

## 3. Resource Location - Ruang Poli

### Contoh Data Ruang Spesialis Urologi:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_ruangpoli` menggunakan `koderuang`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_ruangpoli`
| Nama Kolom         | Keterangan                                               | Contoh Data                                  |
|--------------------|----------------------------------------------------------|----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                        |
| `kopoli`           | Kode Unit Poli                                           | 'PURO'                                       |
| `koderuang`        | Kode Ruang                                               | '01PURL'                                     |
| `namaruang`        | Nama Ruang                                               | 'Ruang Spesialis Urologi'                    |
| `description`      | Deskripsi Ruang                                          | 'Ruang konsultasi dan tindakan urologi SKI'  |
| `longitude`        | Titik Koordinat Longitude Ruang                          | '-4.807.779.235.890.210'                     |
| `latitude`         | Titik Koordinat Latitude Ruang                           | '10.536.385.747.905.800'                     |
| `altitude`         | Titik Koordinat Altitude Ruang                           | '0'                                          |
| `satset_location_id`| ID Resource Location (Satu Sehat)                       | '46a18b96-d8bb-48f4-a9e0-1b79ff30fa79'       |

**Jika sudah pernah mengirim Resource Location - Ruang Poli maka wajib insert ke `satset_locations`**

**Tabel:** `satset_locations`

| Nama Kolom         | Keterangan                                               | Contoh Data                                     |
|--------------------|----------------------------------------------------------|-------------------------------------------------|
| `id`               | ID Resource Location (Satu Sehat)                        | '46a18b96-d8bb-48f4-a9e0-1b79ff30fa79'          |
| `attributes`       | Data Resource Location (Satu Sehat)                      | '{"id":"46a18b96-d8bb-48f4-a9e0-1b79ff30fa79"}'|


---

## 4. Resource Practitioner - Dokter dan Perawat

### Contoh Data Dokter Spesialis Urologi:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_dokter` menggunakan `kodokter`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_dokter`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `kodokter`         | Kode Dokter                                              | 'SKIDR00001'                                  |
| `nik`              | Nomor Induk Kependudukan Dokter                          | '7209061211900001'                            |
| `nadokter`         | Nama Dokter                                              | 'dr. Alexander'                               |
| `jenis_kerja_sama` | 1 jika Umum, 2 jika Spesialis                            | 2                                             |
| `jenispegawai`     | 1 jika Dokter, 2 jika Perawat                            | 1                                             |
| `nostr`            | Nomor STR (Surat Tanda Registrasi) Dokter                | '10 00 0 0 0 00-0000001'                      |
| `hp`               | Nomor Handphone Dokter                                   | '082211223344'                                |
| `status`           | Status Dokter (ON jika aktif, OFF jika tidak aktif)      | 'ON'                                          |
| `satset_practitioner_id` | ID Resource Practitioner (Satu Sehat)              | '10009880728'                                 |

**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_doktercabang` menggunakan `koders` dan `kodokter`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_doktercabang`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `kodokter`         | Kode Dokter                                              | 'SKIDR00001'                                  |

**Jika sudah pernah mengirim Resource Location - Ruang Poli maka wajib insert ke satset_practitioners
nama tabel: `satset_practitioners`**

**Tabel: satset_practitioners**

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `id`               | ID Resource Practitioner (Satu Sehat)                    | '10009880728'                                 |
| `attributes`       | Data Resource Practitioner (Satu Sehat)                  | '{"id":"10009880728"}'                        |

### Contoh Data Perawat Spesialis Urologi:
**Prosedur insert yang sama seperti Dokter Spesialis Urologi.**

**Tabel:** `tbl_dokter`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `kodokter`         | Kode Dokter                                              | 'SKIPRT0001'                                  |
| `nik`              | Nomor Induk Kependudukan Dokter                          | '3313096403900009'                            |
| `nadokter`         | Nama Dokter                                              | 'Sheila Annisa S.Kep'                         |
| `jenis_kerja_sama` | 1 jika Umum, 2 jika Spesialis                            | 1                                             |
| `jenispegawai`     | 1 jika Dokter, 2 jika Perawat                            | 2                                             |
| `nostr`            | Nomor STR (Surat Tanda Registrasi) Dokter                | '10 00 0 0 0 00-0000002'                      |
| `hp`               | Nomor Handphone Dokter                                   | '082211223355'                                |
| `status`           | Status Dokter (ON jika aktif, OFF jika tidak aktif)      | 'ON'                                          |
| `satset_practitioner_id` | ID Resource Practitioner (Satu Sehat)              | '10014058550'                                 |

**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_doktercabang` menggunakan `koders` dan `kodokter`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_doktercabang`

| Nama Kolom         | Keterangan                                               | Contoh Data   |
|--------------------|----------------------------------------------------------|---------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'         |
| `kodokter`         | Kode Dokter                                              | 'SKIPRT0001'  |

**Jika sudah pernah mengirim Resource Location - Ruang Poli maka wajib insert ke satset_practitioners
nama tabel: `satset_practitioners`**

**Tabel: satset_practitioners**

| Nama Kolom         | Keterangan                                               | Contoh Data            |
|--------------------|----------------------------------------------------------|------------------------|
| `id`               | ID Resource Practitioner (Satu Sehat)                    | '10014058550'          |
| `attributes`       | Data Resource Practitioner (Satu Sehat)                  | '{"id":"10014058550"}' |

---

## 5. Resource Patient

### Contoh Data Pasien:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_pasien` menggunakan `rekmed`. Jika sudah ada, jangan insert.**

**Nama Tabel:** `tbl_pasien`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `rekmed`           | Rekmed Pasien                                            | '0000077'                                     |
| `idpas`            | Jenis Identitas Pasien (KTP jika NIK, KK jika KK, SIM jika SIM, PASPORT jika PASPORT, KITAS jika KITAS, K_PELAJAR jika K_PELAJAR, KMAHASISWA jika KMAHASISWA, TANPA_IDENTITAS jika TANPA IDENTITAS)                    | 'KTP'                                         |
| `noidentitas`      | Nomor Identitas Pasien (NIK)                             | '9271060312000001'                            |
| `namapas`          | Nama Pasien                                              | 'Ardianto Putra'                              |
| `jkel`             | Jenis Kelamin (0 jika Tidak Diketahui, 1 jika Laki-laki, 2 jika Perempuan) | '1'                                          |
| `tgllahir`         | Tanggal Lahir Pasien                                     | '1992-01-09 00:00:00'                         |
| `tempatlahir`      | Tempat Lahir Pasien                                      | 'Yogyakarta'                                  |
| `alamat`           | Alamat Pasien                                            | 'Jl. Magelang No.188, Karangwaru, Kec. Tegalrejo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55242' |
| `kodepos`          | Kode Pos Pasien                                          | '55242'                                       |
| `propinsi`         | Kode Provinsi Pasien                                     | '34'                                          |
| `kabupaten`        | Kode Kabupaten Pasien                                    | '3471'                                        |
| `kecamatan`        | Kode Kecamatan Pasien                                    | '347101'                                      |
| `kelurahan`        | Kode Kelurahan/Desa Pasien                               | '3471011002'                                  |
| `rw`               | RW Pasien                                                | '00'                                          |
| `rt`               | RT Pasien                                                | '00'                                          |
| `status`           | Status Perkawinan Pasien (1 Jika Belum Kawin, 2 jika Kawin, 3 jika Cerai Hidup, 4 jika Cerai Mati) | '1' |
| `cust_id`          | Kosongkan                                                | ''                                            |
| `nik`              | NIK Pasien                                               | '9271060312000001'                            |
| `last_reservation` | Kosongkan                                                | ''                                            |
| `satset_patient_id`| ID Resource Patient (Satu Sehat)                         | 'P02478375538'                                |

**Jika sudah pernah mengirim Resource Patient maka wajib insert ke `satset_patients`**

**Tabel:** `satset_patients`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `id`               | ID Resource Patient (Satu Sehat)                         | 'P02478375538'                                |
| `attributes`       | Data Resource Patient (Satu Sehat)                       | '{"id":"P02478375538"}'                      |

---

## 6. Resource Encounter - Outpatient

### Contoh Data Encounter:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_regist` menggunakan `noreg`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_regist`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000077'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `tglmasuk`         | Tanggal Masuk                                            | '2025-04-24 10:27:06'                         |
| `jam`              | Jam Masuk                                                | '10:27:06'                                    |
| `jenispas`         | Jenis Pasien (PAS1 jika Perorangan, PAS2 jika Asuransi)  | 'PAS1'                                        |
| `tujuan`           | Tujuan (1 jika Rawat Jalan, 2 jika Rawat Inap)           | 1                                             |
| `kodepos`          | Kode Unit Poli                                           | 'PURO'                                        |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `koderuang`        | Kode Ruang                                               | 1                                             |
| `keluar`           | Status Keluar                                            | 1                                             |
| `closerm`          | Status Selesai Pelayanan                                 | 1                                             |
| `tglkeluar`        | Tanggal Keluar                                           | '2025-04-24 11:05:00'                         |
| `jamkeluar`        | Jam Keluar                                               | '11:05:00'                                    |

---

## 7. Resource Condition, Observation, ClinicalImpression - Rekam Medis

### Contoh Data Rekam Medis:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_rekammedisrs` menggunakan `noreg`. Jika sudah ada, jangan insert.**

**Rumus:** `Nilai IMT`

tinggi_badan = tinggi_badan / 100

imt = berat_badan / (tinggi_badan * tinggi_badan)

**Contoh: `Nilai IMT`**

tinggi_badan = 170 / 100

imt = 54 / (1.7 * 1.7)

imt = 18.68

**Tabel Bantu:** `Hasil IMT`

| IMT                       | Keterangan    |
|---------------------------|---------------|
| imt > 1 && imt < 18.5     | Under Weight  |
| imt > 18.5 && imt <= 25   | Normal Weight |
| imt > 25 && imt <= 30     | Over Weight   |
| imt > 30 && imt < 1000    | Obese         |

**Format Data Alergi Lingkungan**

'[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Debu Rumah","keterangan":null}]'

**Format Data Alergi Makanan**

'[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Alergi daging bebek","keterangan":null}]'

**Format Data Alergi Obat**

Jika Alergi hanya 1

'[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Azitromicin","keterangan":null}]'

Jika Alergi lebih dari 1

'[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Azitromicin","keterangan":null},{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Paracetamol","keterangan":null}]'

**Tabel Bantu:** `Anamenesis Uronefrologi`

**Hipertensi**

| Nama Kolom                 | Keterangan                                               | Contoh Data                                   |
|----------------------------|----------------------------------------------------------|-----------------------------------------------|
| `hipertensi`               | Hipertensi (1 jika Ya, 0 jika Tidak)                     | "1"                                           |
| `derajat_hipertensi`       | Derajat (827069000|Stage 1 hypertension jika Stage 1 hypertension, 827068008|Stage 2 hypertension jika Stage 2 hypertension, OI000042|Stage 3 hypertension jika Stage 3 hypertension, 56218007|Systolic hypertension jika Systolic hypertension) | "827069000|Stage 1 hypertension"   |
| `mendapat_obat_hipertensi` | Mendapat Obat (1 jika Ya, 0 jika Tidak)                  | "1"                                           |
| `hipertensi_terkontrol`    | Terkontrol (1 jika Ya, 0 jika Tidak)                     | "1"                                           |

**Diabetes Mellitus**

| Nama Kolom                        | Keterangan                                               | Contoh Data                                   |
|-----------------------------------|----------------------------------------------------------|-----------------------------------------------|
| `diabetes_mellitus`               | Diabetes Mellitus (1 jika Ya, 0 jika Tidak)              | "1"                                           |
| `mendapat_obat_diabetes_mellitus` | Mendapat Obat (1 jika Ya, 0 jika Tidak)                  | "1"                                           |
| `diabetes_mellitus_terkontrol`    | Terkontrol (1 jika Ya, 0 jika Tidak)                     | "1"                                           |

**Tabel Bantu:** `Pemeriksaan Uronefrologi`

**Pemeriksaan Uronefrologi**

| Nama Kolom                        | Keterangan                                               | Contoh Data                                   |
|-----------------------------------|----------------------------------------------------------|-----------------------------------------------|
| `batu_saluran_kemih`              | Batu Saluran Kemih (1 jika Ya, 0 jika Tidak)             | "1"                                           |
| `lokasi_batu`                     | Lokasi Batu (18639004|Left kidney jika Left kidney, 9846003|Right kidney jika Right kidney, 25308007|Right ureter jika Right ureter, 26559004|Left ureter jika Left ureter, 89837001|Urinary bladder jika Urinary bladder) | "18639004|Left kidney" |
| `derajat_hidronefrosis`           | Derajat Hidronefrosis (258351006|Grade 1 jika Grade 1, 258352004|Grade 2 jika Grade 2, 258353009|Grade 3 jika Grade 3, 258354003|Grade 4 jika Grade 4, OV000352|Tidak ada hidronefrosis jika Tidak ada hidronefrosis) | "258351006|Grade 1" |
| `keparahan_batu_saluran_kemih`    | Keparahan Batu Saluran Kemih (68566005|Urinary tract infection jika Urinary tract infection, 55189008|Non-infected jika Non-infected, 709044004|Chronic kidney disease jika Chronic kidney disease) | "709044004|Chronic kidney disease" |

**Format Data Anamenesis Uronefrologi dan Pemeriksaan Uronefrologi**

'{"hipertensi":"1","derajat_hipertensi":"827069000|Stage 1 hypertension","mendapat_obat_hipertensi":"1","hipertensi_terkontrol":"1","batu_saluran_kemih":"1","lokasi_batu":"18639004|Left kidney","derajat_hidronefrosis":"258351006|Grade 1","diabetes_mellitus":"1","mendapat_obat_diabetes_mellitus":"1","diabetes_mellitus_terkontrol":"1","keparahan_batu_saluran_kemih":"709044004|Chronic kidney disease"}'

**Format Data Status Mental**

Nilai Status Mental: Cemas, Takut, Marah, Sedih, Lain-lain (Free Text)

Jika Lain-lain (Free Text):

'{"status_mental":"Lain-lain (Free Text)","status_mental_lainnya":"Tidak diketahui"}'

Selain itu:

'{"status_mental":"Marah","status_mental_lainnya":null}'

**Tabel:** `tbl_rekammedisrs`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000077'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `kodepos`          | Kode Unit Poli                                           | 'PURO'                                        |
| `koperawat`        | Kode Perawat (Perawat Penanggung Jawab Pelayanan)        | 'SKIPRT0001'                                  |
| `tglperiksa`       | Tanggal Periksa Perawat                                  | '2025-04-24 10:30:00'                         |
| `jam`              | Jam Periksa Perawat                                      | '10:30:00'                                    |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `tglkonsul`        | Tanggal Periksa DPJP                                     | '2025-04-24 10:35:00'                         |
| `jamdikonsul`      | Jam Periksa DPJP                                         | '10:35:00'                                    |
| `alergi_lingkungan`| Alergi Lingkungan                                        | '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Debu Rumah","keterangan":null}]' |
| `alergi_makanan`   | Alergi Makanan                                           | '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Alergi daging bebek","keterangan":null}]' |
| `alergi_obat`      | Alergi Obat                                              | '[{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Azitromicin","keterangan":null},{"allergy_intolerance_id":null,"code":null,"display":null,"alergi":"Paracetamol","keterangan":null}]' |
| `tdarah`           | Tekanan Darah Sistole                                    | 110                                           |
| `tdarah1`          | Tekanan Darah Diastole                                   | 90                                            |
| `nadi`             | Nadi                                                     | 90                                            |
| `nafas`            | Respiratory Rate                                         | 30                                            |
| `suhu`             | Suhu                                                     | 40                                            |
| `oksigen`          | SpO2                                                     | 98                                            |
| `tinggibadan`      | Tinggi Badan                                             | 170                                           |
| `beratbadan`       | Berat Badan                                              | 54                                            |
| `bmi`              | Nilai IMT                                                | 18.68                                         |
| `bmiresult`        | Hasil IMT                                                | 'Normal Weight'                               |
| `riwayat_psikososial_dan_spiritual_data` | Status Mental                      | '{"status_mental":"Marah","status_mental_lainnya":null}' |
| `prognosa`         | Prognosa (02 jika Bonam (Baik), 03 jika Malam (Buruk/Jelek), 04 Dubia Ad Sanam/Bolam (Tidak tentu/Ragu-ragu, Cenderung Sembuh/Baik), 05 jika Dubia Ad Malam (Tidak tentu/Ragu-ragu, Cenderung Buruk/Jelek)) | '03' |
| `uronefrologi`     | Anamenesis Uronefrologi dan Pemeriksaan Uronefrologi     | '{"hipertensi":"1","derajat_hipertensi":"827069000\|Stage 1 hypertension","mendapat_obat_hipertensi":"1","hipertensi_terkontrol":"1","batu_saluran_kemih":"1","lokasi_batu":"18639004\|Left kidney","derajat_hidronefrosis":"258351006\|Grade 1","diabetes_mellitus":"1","mendapat_obat_diabetes_mellitus":"1","diabetes_mellitus_terkontrol":"1","keparahan_batu_saluran_kemih":"709044004\|Chronic kidney disease"}' |
| `keluhanawal`      | Keluhan Utama                                            | 'Penurunan output urin'                       |
| `kondisi_pulang`   | Kondisi Pulang (KELUAR001 jika SEMBUH, KELUAR002 jika BELUM SEMBUH, KELUAR003 jika MENINGGAL <\48 JAM DALAM OPNAME, KELUAR004 jika MENINGGAL >\48 JAM DALAM OPNAME, KELUAR005 jika ATAS PERMINTAAN SENDIRI, KELUAR006 jika DIRUJUK, KELUAR007 jika MENERUSKAN DENGAN RAWAT JALAN, KELUAR008 jika MENERUSKAN DENGAN RAWAT INAP) | 'KELUAR002' |

## 8. Resource Condition - Diagnosa

### Contoh Data Diagnosa Penyakit Ginjal Kronis (CKD):
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_icdtr` menggunakan `noreg` dan `icdcode`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_icdtr`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000077'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `icdcode`          | Kode ICD 10                                              | 'N18.4'                                       |
| `utama`            | Status Utama (1 jika diagnosa utama, 0 jika bukan)       | 1                                             |

### Contoh Data Diagnosa Batu Ginjal:
**Prosedur insert yang sama seperti Diagnosa Penyakit Ginjal Kronis (CKD).**

**Tabel:** `tbl_icdtr`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000077'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `icdcode`          | Kode ICD 10                                              | 'N20.0'                                       |
| `utama`            | Status Utama (1 jika diagnosa utama, 0 jika bukan)       | 0                                             |

## 9. Resource Procedure - Tindakan

### Contoh Data Tindakan Hemodialysis:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_icdtr` menggunakan `noreg` dan `icdcode`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_icdtr`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000077'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `icdcode`          | Kode ICD 9                                               | '39.95'                                       |
| `utama`            | Status Utama (1 jika diagnosa utama, 0 jika bukan)       | 0                                             |

### Contoh Data Tindakan ESWL:
**Prosedur insert yang sama seperti Tindakan Hemodialysis.**

**Tabel:** `tbl_icdtr`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000077'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `icdcode`          | Kode ICD 9                                               | '98.51'                                       |
| `utama`            | Status Utama (1 jika diagnosa utama, 0 jika bukan)       | 0                                             |
