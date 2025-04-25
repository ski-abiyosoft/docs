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
| `satset_organization_id` | ID Resource Organization (Satu Sehat)                      | '9e440888-2ab1-4f97-9b29-80eff581344f' |

**Jika sudah pernah mengirim Resource Organization - Provider maka wajib insert ke `satset_organizations`**

**Tabel:** `satset_organizations`

| Nama Kolom            | Keterangan                                                    | Contoh Data                                      |
|-----------------------|---------------------------------------------------------------|--------------------------------------------------|
| `id`                  | ID Resource Organization (Satu Sehat)                         | '9e440888-2ab1-4f97-9b29-80eff581344f'           |
| `type`                | Jenis Organization                                            | ''                                               |
| `attributes`          | Data Resource Organization (Satu Sehat)                       | '{"id": "9e440888-2ab1-4f97-9b29-80eff581344f"}' |

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
| `attributes`            | Data Resource Organization (Satu Sehat)                      | '{"id": "c9c04a20-da73-431a-a503-b5bddc7002b1"}'|

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
| `attributes`            | Data Resource Organization (Satu Sehat)                      | '{"id": "0c4b3add-74a1-4ea7-839b-d5caf8e645f0"}'|

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
| `attributes`       | Data Resource Location (Satu Sehat)                      | '{"id": "46a18b96-d8bb-48f4-a9e0-1b79ff30fa79"}'|


---

## 4. Resource Practitioner - Dokter

### Contoh Data Dokter Spesialis Urologi:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_dokter` menggunakan `kodokter`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_dokter`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `kodokter`         | Kode Dokter                                              | 'RSRDR00001'                                  |
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
| `kodokter`         | Kode Dokter                                              | 'RSRDR00001'                                  |

**Jika sudah pernah mengirim Resource Location - Ruang Poli maka wajib insert ke satset_practitioners
nama tabel: `satset_practitioners`**

**Tabel: satset_practitioners**

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `id`               | ID Resource Practitioner (Satu Sehat)                    | '10009880728'                                 |
| `attributes`       | Data Resource Practitioner (Satu Sehat)                  | '{"id": "10009880728"}'                       |

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
| `status`           | Status Perkawinan Pasien                                 | '1'                                           |
| `cust_id`          | Kosongkan                                                | ''                                            |
| `nik`              | NIK Pasien                                               | '9271060312000001'                            |
| `last_reservation` | Kosongkan                                                | ''                                            |
| `satset_patient_id`| ID Resource Patient (Satu Sehat)                         | 'P02478375538'                                |

**Jika sudah pernah mengirim Resource Patient maka wajib insert ke `satset_patients`**

**Tabel:** `satset_patients`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `id`               | ID Resource Patient (Satu Sehat)                         | 'P02478375538'                                |
| `attributes`       | Data Resource Patient (Satu Sehat)                       | '{"id": "P02478375538"}'                      |

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
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'RSRDR00001'                                  |
| `koderuang`        | Kode Ruang                                               | 1                                             |
| `keluar`           | Status Keluar                                            | 1                                             |
| `closerm`          | Status Selesai Pelayanan                                 | 1                                             |
| `tglkeluar`        | Tanggal Keluar                                           | '2025-04-24 11:05:00'                         |
| `jamkeluar`        | Jam Keluar                                               | '11:05:00'                                    |
