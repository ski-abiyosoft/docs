# Dokumentasi Data Satu Sehat

## Daftar Isi

- [Perkenalan](#perkenalan)
- [1. Resource Organization - Provider](#1-resource-organization---provider)
- [2. Resource Organization - Department](#2-resource-organization---department)
- [3. Resource Location - Ruang Poli, Bangsal Inap, Ruang Inap dan Kamar Inap](#3-resource-location---ruang-poli-bangsal-inap-ruang-inap-dan-kamar-inap)
- [4. Resource Practitioner - Dokter dan Perawat](#4-resource-practitioner---dokter-dan-perawat)
- [5. Resource Patient](#5-resource-patient)
- [6. Resource Encounter - Kunjungan (Outpatient, Emergency dan Inpatient)](#6-resource-encounter---Kunjungan-outpatient-emergency-dan-inpatient))
- [7. Resource Observation - Triage (Emergency)](#7-resource-observation---triage-emergency)
- [8. Resource Condition, Observation, QuestionnaireResponse, ClinicalImpression - Rekam Medis (Outpatient, Emergency dan Inpatient)](#8-resource-condition-observation-questionnaireresponse-clinicalimpression---rekam-medis-outpatient-emergency-dan-inpatient)
- [9. Resource Observation - TTV (Inpatient)](#9-resource-observation---ttv-inpatient)
- [10. Resource Condition - Diagnosa](#10-resource-condition---diagnosa)
- [11. Resource Procedure - Tindakan](#11-resource-procedure---tindakan)
- [12. Resource MedicationRequest - E-Resep](#12-resource-medicationrequest---e-resep)
- [13. Resource QuestionnaireResponse - Telaah Resep](#13-resource-questionnaireresponse---telaah-resep)
- [14. Resource MedicationDispense - Farmasi Penjualan](#14-resource-medicationdispense---farmasi-penjualan)

## Perkenalan

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

## 3. Resource Location - Ruang Poli, Bangsal Inap, Ruang Inap dan Kamar Inap

### Contoh Data Ruang Poli Spesialis Urologi:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_ruangpoli` menggunakan `koderuang`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_ruangpoli`

| Nama Kolom         | Keterangan                                               | Contoh Data                                  |
|--------------------|----------------------------------------------------------|----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                        |
| `kopoli`           | Kode Poli                                                | 'PURO'                                       |
| `kodeunit`         | Kode Unit Satu Sehat                                     | 'SKI-GT1-B1-P1-URO'                          |
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
| `attributes`       | Data Resource Location (Satu Sehat)                      | '{"id":"46a18b96-d8bb-48f4-a9e0-1b79ff30fa79"}' |

### Contoh Data Bangsal Inap:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_bangsal` menggunakan `bangsalid`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_bangsal`

| Nama Kolom         | Keterangan                                               | Contoh Data                                  |
|--------------------|----------------------------------------------------------|----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                        |
| `kodeunit`         | Kode Unit Satu Sehat                                     | 'SKI-GB1-R-RI-SDW'                           |
| `bangsalid`        | Kode Bangsal                                             | 'BL00000001'                                 |
| `nama_bangsal`     | Nama Bangsal                                             | 'SADEWA'                                     |
| `deskripsi`        | Deskripsi Bangsal                                        | 'BANGSAL RAWAT INAP PASIEN DEWASA DAN ANAK SADEWA - LANTAI 1 - GEDUNG BARAT'  |
| `longitude`        | Titik Koordinat Longitude Bangsal                        | '-4.807.779.235.890.210'                     |
| `latitude`         | Titik Koordinat Latitude Bangsal                         | '10.536.385.747.905.800'                     |
| `altitude`         | Titik Koordinat Altitude Bangsal                         | '0'                                          |
| `aktif`            | Status Aktif (1 jika Aktif, 0 jika Tidak Aktif)          | 1                                            |
| `satset_location_id`| ID Resource Location (Satu Sehat)                       | 'X'                                          |

**Jika sudah pernah mengirim Resource Location - Bangsal Inap maka wajib insert ke `satset_locations`**

**Tabel:** `satset_locations`

| Nama Kolom         | Keterangan                                               | Contoh Data                                     |
|--------------------|----------------------------------------------------------|-------------------------------------------------|
| `id`               | ID Resource Location (Satu Sehat)                        | 'X'                                             |
| `attributes`       | Data Resource Location (Satu Sehat)                      | '{"id":"X"}'                                    |

### Contoh Data Ruang Inap:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_ruang` menggunakan `koderuang`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_ruang`

| Nama Kolom         | Keterangan                                               | Contoh Data                                  |
|--------------------|----------------------------------------------------------|----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                        |
| `bangsalid`        | Kode Bangsal                                             | 'BL00000001'                                 |
| `kodeunit`         | Kode Unit Satu Sehat                                     | 'SKI-GB1-R-RI-SDW1'                          |
| `koderuang`        | Kode Ruang                                               | 'INAPB00177'                                 |
| `namaruang`        | Nama Ruang                                               | 'SADEWA 1'                                   |
| `fasilitas`        | Deskripsi Ruang                                          | 'RUANG RAWAT INAP PASIEN DEWASA DAN ANAK SADEWA - LANTAI 1 - GEDUNG BARAT'  |
| `longitude`        | Titik Koordinat Longitude Ruang                          | '-4.807.779.235.890.210'                     |
| `latitude`         | Titik Koordinat Latitude Ruang                           | '10.536.385.747.905.800'                     |
| `altitude`         | Titik Koordinat Altitude Ruang                           | '0'                                          |
| `satset_location_id`| ID Resource Location (Satu Sehat)                       | 'X'                                          |

**Jika sudah pernah mengirim Resource Location - Bangsal Inap maka wajib insert ke `satset_locations`**

**Tabel:** `satset_locations`

| Nama Kolom         | Keterangan                                               | Contoh Data                                     |
|--------------------|----------------------------------------------------------|-------------------------------------------------|
| `id`               | ID Resource Location (Satu Sehat)                        | 'X'                                             |
| `attributes`       | Data Resource Location (Satu Sehat)                      | '{"id":"X"}'                                    |

### Contoh Data Kamar Inap:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_kamar` menggunakan `kodekamar`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_kamar`

| Nama Kolom         | Keterangan                                               | Contoh Data                                  |
|--------------------|----------------------------------------------------------|----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                        |
| `koderuang`        | Kode Ruang                                               | 'INAPB00177'                                 |
| `kodeunit`         | Kode Unit Satu Sehat                                     | 'SKI-GB1-RI-B1-SDW1-VIP'                     |
| `kodekamar`        | Kode Kamar                                               | 'INAPB0017710'                               |
| `namakamar`        | Nama Kamar                                               | 'TT - 01'                                    |
| `description`      | Deskripsi Kamar                                          | 'Tempat Tidur 1 - Sadewa 1 - Kelas VIP - Lantai 1 - Gedung Barat'  |
| `longitude`        | Titik Koordinat Longitude Kamar                          | '-4.807.779.235.890.210'                     |
| `latitude`         | Titik Koordinat Latitude Kamar                           | '10.536.385.747.905.800'                     |
| `altitude`         | Titik Koordinat Altitude Kamar                           | '0'                                          |
| `aktif`            | Status Aktif (1 jika Aktif, 0 jika Tidak Aktif)          | 1                                            |
| `satset_location_id`| ID Resource Location (Satu Sehat)                       | 'X'                                          |

**Jika sudah pernah mengirim Resource Location - Bangsal Inap maka wajib insert ke `satset_locations`**

**Tabel:** `satset_locations`

| Nama Kolom         | Keterangan                                               | Contoh Data                                     |
|--------------------|----------------------------------------------------------|-------------------------------------------------|
| `id`               | ID Resource Location (Satu Sehat)                        | 'X'                                             |
| `attributes`       | Data Resource Location (Satu Sehat)                      | '{"id":"X"}'                                    |

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

### Contoh Data Apoteker:
**Prosedur insert yang sama seperti Dokter Spesialis Urologi.**

**Tabel:** `tbl_dokter`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `kodokter`         | Kode Dokter                                              | 'SKIPRT0002'                                  |
| `nik`              | Nomor Induk Kependudukan Dokter                          | '3313096403900009'                            |
| `nadokter`         | Nama Dokter                                              | 'apt. Aditya Pradhana, S.Farm.'               |
| `jenis_kerja_sama` | 1 jika Umum, 2 jika Spesialis                            | 1                                             |
| `jenispegawai`     | 1 jika Dokter, 2 jika Perawat, 3 Jika Petugas Non-Medis  | 3                                             |
| `nostr`            | Nomor STR (Surat Tanda Registrasi) Dokter                | ''                                            |
| `hp`               | Nomor Handphone Dokter                                   | '082211223357'                                |
| `status`           | Status Dokter (ON jika aktif, OFF jika tidak aktif)      | 'ON'                                          |
| `satset_practitioner_id` | ID Resource Practitioner (Satu Sehat)              | '10001915884'                                 |

**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_doktercabang` menggunakan `koders` dan `kodokter`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_doktercabang`

| Nama Kolom         | Keterangan                                               | Contoh Data   |
|--------------------|----------------------------------------------------------|---------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'         |
| `kodokter`         | Kode Dokter                                              | 'SKIPRT0002'  |

**Jika sudah pernah mengirim Resource Location - Ruang Poli maka wajib insert ke satset_practitioners
nama tabel: `satset_practitioners`**

**Tabel: satset_practitioners**

| Nama Kolom         | Keterangan                                               | Contoh Data            |
|--------------------|----------------------------------------------------------|------------------------|
| `id`               | ID Resource Practitioner (Satu Sehat)                    | '10001915884'          |
| `attributes`       | Data Resource Practitioner (Satu Sehat)                  | '{"id":"10001915884"}' |

**Tabel: users**
**Sebelum melakukan insert, lakukan pengecekan dengan `users` menggunakan `name`. Jika sudah ada, jangan insert.**

| Nama Kolom         | Keterangan                                               | Contoh Data                     |
|--------------------|----------------------------------------------------------|---------------------------------|
| `name`             | Username                                                 | 'aditya'                        |
| `is_apoteker`      | 1 Jika Apoteker, 0 Jika Tidak Apoteker                   | 1                               |
| `koapoteker`       | Kode Apoteker                                            | 'SKIPRT0002'                    |

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

## 6. Resource Encounter - Kunjungan (Outpatient, Emergency dan Inpatient)

### Contoh Data Encounter (Outpatient dan Emergency):
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
| `koderuang`        | Id Ruang                                                 | 1                                             |
| `keluar`           | Status Keluar                                            | 1                                             |
| `closerm`          | Status Selesai Pelayanan                                 | 1                                             |
| `tglkeluar`        | Tanggal Keluar                                           | '2025-04-24 11:05:00'                         |
| `jamkeluar`        | Jam Keluar                                               | '11:05:00'                                    |

---

### Contoh Data Encounter (Inpatient):
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_regist` menggunakan `noreg`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_regist`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRI20250000079'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `tglmasuk`         | Tanggal Masuk                                            | '2025-04-25 11:05:00'                         |
| `jam`              | Jam Masuk                                                | '11:05:00'                                    |
| `jenispas`         | Jenis Pasien (PAS1 jika Perorangan, PAS2 jika Asuransi)  | 'PAS1'                                        |
| `tujuan`           | Tujuan (1 jika Rawat Jalan, 2 jika Rawat Inap)           | 2                                             |
| `kodepos`          | Kode Unit Poli (Kosongkan jika Rawat Inap)               | ''                                            |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `koderuang`        | Kode Ruang                                               | 'INAPB00177'                                  |
| `kodekamar`        | Kode Kamar                                               | 'INAPB0017710'                                |
| `keluar`           | Status Keluar                                            | 1                                             |
| `closerm`          | Status Selesai Pelayanan                                 | 1                                             |
| `tglkeluar`        | Tanggal Keluar                                           | '2025-04-29 11:05:00'                         |
| `jamkeluar`        | Jam Keluar                                               | '11:05:00'                                    |

---

## 7. Resource Observation - Triage (Emergency)

### Contoh Data Triage:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_triage` menggunakan `noreg`. Jika sudah ada, jangan insert.**

**Tabel Bantu:** `Skala Nyeri`

| Kode  | Skala   | Keterangan         |
|-------|---------|--------------------|
| 1     | 0       | Tidak Nyeri        |
| 2     | 2       | Nyeri Ringan       |
| 3     | 4       | Nyeri Sedang       |
| 4     | 6       | Nyeri Sedang       |
| 5     | 8       | Nyeri Berat        |
| 6     | 10      | Nyeri Sangat Berat |

**Tabel:** `tbl_triage`

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000078'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `tanggal`          | Tanggal Triage                                           | '2025-04-25 10:30:00'                         |
| `jam`              | Jam Triage                                               | '10:30:00'                                    |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `perawat`          | Kode Perawat (Perawat Penanggung Jawab Pelayanan)        | 'SKIPRT0001'                                  |
| `sarana_datang`    | Prognosa ("Ambulance" jika "Ambulance", "Mobil" jika "Mobil", "Motor" jika "Motor", "Lain-lain" jika "Lain-lain") | 'Ambulance' |
| `kondisi_pasien_tiba` | Prognosa ("Resusitasi" jika "Resusitasi", "Emergency" jika "Emergency", "Urgent" jika "Urgent", "Less Urgent" jika "Less Urgent", "Non Urgent" jika "Non Urgent", "Death On Arrival" jika "Death On Arrival") | 'Urgent' |
| `nyeri`            | Kode Skala Nyeri (untuk cara pengisian lihat ditabel bantu diatas) | 1                                             |
| `frekuensinyeri`   | Prognosa (0 jika "Tidak Ada", 1 jika "Jarang", 2 jika "Hilang Timbul", 3 jika "Terus Menerus") | 2       |
| `level_kesadaran`  | Prognosa ("Alert" jika "Sadar Baik / Alert", "Voice" jika "Respon dengan Kata-kata / Voice", "Pain" jika "Hanya Respon Jika Dirangsang / Pain", "Unresponsive" jika "Pasien Tidak Sadar / Unresponsive", "Gelisah" jika "Bingung / Gelisah", "Acute Confusional State" jika "Acute Confusional State") | 'Voice'          |

---

## 8. Resource Condition, Observation, QuestionnaireResponse, ClinicalImpression - Rekam Medis (Outpatient, Emergency dan Inpatient)

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
| `derajat_hipertensi`       | Derajat ("827069000\|Stage 1 hypertension" jika Stage 1 hypertension, "827068008\|Stage 2 hypertension" jika Stage 2 hypertension, "OI000042\|Stage 3 hypertension" jika Stage 3 hypertension, "56218007\|Systolic hypertension" jika Systolic hypertension) | "827069000\|Stage 1 hypertension"   |
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
| `lokasi_batu`                     | Lokasi Batu ("18639004\|Left kidney" jika Left kidney, "9846003\|Right kidney" jika Right kidney, "25308007\|Right ureter" jika Right ureter, "26559004\|Left ureter" jika Left ureter, "89837001\|Urinary bladder" jika Urinary bladder) | "18639004\|Left kidney" |
| `derajat_hidronefrosis`           | Derajat Hidronefrosis ("258351006\|Grade 1" jika Grade 1, "258352004\|Grade 2" jika Grade 2, "258353009\|Grade 3" jika Grade 3, "258354003\|Grade 4" jika Grade 4, "OV000352\|Tidak ada hidronefrosis" jika Tidak ada hidronefrosis) | "258351006|Grade 1" |
| `keparahan_batu_saluran_kemih`    | Keparahan Batu Saluran Kemih ("68566005\|Urinary tract infection" jika Urinary tract infection, "55189008\|Non-infected" jika Non-infected, "709044004\|Chronic kidney disease" jika Chronic kidney disease) | "709044004\|Chronic kidney disease" |

**Format Data Anamenesis Uronefrologi dan Pemeriksaan Uronefrologi**

'{"hipertensi":"1","derajat_hipertensi":"827069000|Stage 1 hypertension","mendapat_obat_hipertensi":"1","hipertensi_terkontrol":"1","batu_saluran_kemih":"1","lokasi_batu":"18639004|Left kidney","derajat_hidronefrosis":"258351006|Grade 1","diabetes_mellitus":"1","mendapat_obat_diabetes_mellitus":"1","diabetes_mellitus_terkontrol":"1","keparahan_batu_saluran_kemih":"709044004|Chronic kidney disease"}'

**Format Data Status Mental**

Nilai Status Mental: Cemas, Takut, Marah, Sedih, Lain-lain (Free Text)

Jika Lain-lain (Free Text):

'{"status_mental":"Lain-lain (Free Text)","status_mental_lainnya":"Tidak diketahui"}'

Selain itu:

'{"status_mental":"Marah","status_mental_lainnya":null}'


**Tabel:** `tbl_rekammedisrs` **(Outpatient)**

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
| `prognosa`         | Prognosa ("02" jika "Bonam (Baik)", "03" jika "Malam (Buruk/Jelek)", "04" jika "Dubia Ad Sanam/Bolam (Tidak tentu/Ragu-ragu, Cenderung Sembuh/Baik)", "05" jika "Dubia Ad Malam (Tidak tentu/Ragu-ragu, Cenderung Buruk/Jelek)") | '03' |
| `uronefrologi`     | Anamenesis Uronefrologi dan Pemeriksaan Uronefrologi     | '{"hipertensi":"1","derajat_hipertensi":"827069000\|Stage 1 hypertension","mendapat_obat_hipertensi":"1","hipertensi_terkontrol":"1","batu_saluran_kemih":"1","lokasi_batu":"18639004\|Left kidney","derajat_hidronefrosis":"258351006\|Grade 1","diabetes_mellitus":"1","mendapat_obat_diabetes_mellitus":"1","diabetes_mellitus_terkontrol":"1","keparahan_batu_saluran_kemih":"709044004\|Chronic kidney disease"}' |
| `keluhanawal`      | Keluhan Utama                                            | 'Penurunan output urin'                       |
| `kondisi_pulang`   | Kondisi Pulang ("KELUAR001" jika "SEMBUH", "KELUAR002" jika "BELUM SEMBUH", "KELUAR003" jika "MENINGGAL <\48 JAM DALAM OPNAME", "KELUAR004" jika "MENINGGAL >\48 JAM DALAM OPNAME", "KELUAR005" jika "ATAS PERMINTAAN SENDIRI", "KELUAR006" jika "DIRUJUK", "KELUAR007" jika "MENERUSKAN DENGAN RAWAT JALAN", "KELUAR008" jika "MENERUSKAN DENGAN RAWAT INAP") | 'KELUAR002' |

---

**Tabel Bantu:** `Skrining Batuk`

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "1.1"                                                          |
| `text`     | Pertanyaan                            | "Apakah memiliki riwayat demam?"                               |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "1.2"                                                          |
| `text`     | Pertanyaan                            | "Apakah berkeringat pada malam hari walaupun tanpa aktivitas?" |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "1.3"                                                          |
| `text`     | Pertanyaan                            | "Apakah memiliki riwayat berpergian dari daerah wabah?"        |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "1.4"                                                          |
| `text`     | Pertanyaan                            | "Apakah memiliki riwayat pemakaian obat jangka panjang?"       |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "1.5"                                                          |
| `text`     | Pertanyaan                            | "Apakah memiliki riwayat BB turun tanpa sebab yang diketahui?" |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

**Format Data Skrining Batuk**

'[{"linkId":"1.1","text":"Apakah memiliki riwayat demam?","answer":"0"},{"linkId":"1.2","text":"Apakah berkeringat pada malam hari walaupun tanpa aktivitas?","answer":"0"},{"linkId":"1.3","text":"Apakah memiliki riwayat berpergian dari daerah wabah?","answer":"0"},{"linkId":"1.4","text":"Apakah memiliki riwayat pemakaian obat jangka panjang?","answer":"0"},{"linkId":"1.5","text":"Apakah memiliki riwayat BB turun tanpa sebab yang diketahui?","answer":"0"}]'

**Tabel Bantu:** `Skrining Gizi`

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "2.1"                                                          |
| `text`     | Pertanyaan                            | "Apakah ada  penurunan BB dalam waktu 6 bulan terakhir?"       |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "2.2"                                                          |
| `text`     | Pertanyaan                            | "Apakah ada penurunan asupan makanan karena nafsu makan berkurang?" |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "2.3"                                                          |
| `text`     | Pertanyaan                            | "Apakah mengalami gejala gastrointestinal (seperti mual, muntah, diare, anorexia)?" |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "2.4"                                                          |
| `text`     | Pertanyaan                            | "Apakah memiliki faktor pemberat (komorbid)?"                  |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

| Nama Kolom | Keterangan                            | Contoh Data                                                    |
|------------|---------------------------------------|----------------------------------------------------------------|
| `linkId`   | Nomor                                 | "2.5"                                                          |
| `text`     | Pertanyaan                            | "Apakah ada penurunan kapasitas fungsional?"                   |
| `answer`   | Jawaban ("1" jika Ya, "0" jika Tidak) | "0"                                                            |

**Format Data Skrining Gizi**

'[{"linkId":"2.1","text":"Apakah ada  penurunan BB dalam waktu 6 bulan terakhir?","answer":"0"},{"linkId":"2.2","text":"Apakah ada penurunan asupan makanan karena nafsu makan berkurang?","answer":"0"},{"linkId":"2.3","text":"Apakah mengalami gejala gastrointestinal (seperti mual, muntah, diare, anorexia)?","answer":"0"},{"linkId":"2.4","text":"Apakah memiliki faktor pemberat (komorbid)?","answer":"0"},{"linkId":"2.5","text":"Apakah ada penurunan kapasitas fungsional?","answer":"0"}]'

**Tabel:** `tbl_rekammedisrs` **(Emergency)**

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRJ20250000078'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `kodepos`          | Kode Unit Poli                                           | 'PUGD'                                        |
| `koperawat`        | Kode Perawat (Perawat Penanggung Jawab Pelayanan)        | 'SKIPRT0001'                                  |
| `tglperiksa`       | Tanggal Periksa Perawat                                  | '2025-04-25 10:30:00'                         |
| `jam`              | Jam Periksa Perawat                                      | '10:30:00'                                    |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `tglkonsul`        | Tanggal Periksa DPJP                                     | '2025-04-25 10:35:00'                         |
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
| `prognosa`         | Prognosa ("02" jika "Bonam (Baik)", "03" jika "Malam (Buruk/Jelek)", "04" jika "Dubia Ad Sanam/Bolam (Tidak tentu/Ragu-ragu, Cenderung Sembuh/Baik)", "05" jika "Dubia Ad Malam (Tidak tentu/Ragu-ragu, Cenderung Buruk/Jelek)") | '03' |
| `keluhanawal`      | Keluhan Utama                                            | 'Penurunan output urin'                       |
| `resiko_dekubitus` | Resiko Dekubitus (1 jika Ya, 0 jika Tidak)               | 0                                             |
| `skrining_batuk`   | Pemeriksaan Skrining Batuk                               | '[{"linkId":"1.1","text":"Apakah memiliki riwayat demam?","answer":"0"},{"linkId":"1.2","text":"Apakah berkeringat pada malam hari walaupun tanpa aktivitas?","answer":"0"},{"linkId":"1.3","text":"Apakah memiliki riwayat berpergian dari daerah wabah?","answer":"0"},{"linkId":"1.4","text":"Apakah memiliki riwayat pemakaian obat jangka panjang?","answer":"0"},{"linkId":"1.5","text":"Apakah memiliki riwayat BB turun tanpa sebab yang diketahui?","answer":"0"}]'                                            |
| `skrining_gizi`    | Pemeriksaan Skrining Gizi                                | '[{"linkId":"2.1","text":"Apakah ada  penurunan BB dalam waktu 6 bulan terakhir?","answer":"0"},{"linkId":"2.2","text":"Apakah ada penurunan asupan makanan karena nafsu makan berkurang?","answer":"0"},{"linkId":"2.3","text":"Apakah mengalami gejala gastrointestinal (seperti mual, muntah, diare, anorexia)?","answer":"0"},{"linkId":"2.4","text":"Apakah memiliki faktor pemberat (komorbid)?","answer":"0"},{"linkId":"2.5","text":"Apakah ada penurunan kapasitas fungsional?","answer":"0"}]'                                            |
| `kondisi_pulang`   | Kondisi Pulang ("KELUAR001" jika "SEMBUH", "KELUAR002" jika "BELUM SEMBUH", "KELUAR003" jika "MENINGGAL <\48 JAM DALAM OPNAME", "KELUAR004" jika "MENINGGAL >\48 JAM DALAM OPNAME", "KELUAR005" jika "ATAS PERMINTAAN SENDIRI", "KELUAR006" jika "DIRUJUK", "KELUAR007" jika "MENERUSKAN DENGAN RAWAT JALAN", "KELUAR008" jika "MENERUSKAN DENGAN RAWAT INAP") | 'KELUAR008' |

**Tabel:** `tbl_darirj` **(Jika Di Transfer Ke Rawat Inap)**

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `noreg`            | Nomor Registrasi IGD/Rawat Jalan                         | 'SKIRJ20250000078'                            |
| `noreginap`        | Nomor Registrasi Rawat Inap                              | 'SKIRI20250000079'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `tglmasuk`         | Tanggal Periksa Perawat                                  | '2025-04-25 11:05:00'                         |
| `jammasuk`         | Jam Periksa Perawat                                      | '11:05:00'                                    |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `kodepos`          | Kode Unit Poli                                           | 'PUGD'                                        |

---

**Tabel:** `tbl_rekammedisrs` **(Inpatient)**

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `koders`           | Kode Rumah Sakit                                         | 'SKI'                                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRI20250000079'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `tglperiksa`       | Tanggal Periksa Perawat                                  | '2025-04-25 12:30:00'                         |
| `jam`              | Jam Periksa Perawat                                      | '12:30:00'                                    |
| `kodokter`         | Kode DPJP (Dokter Penanggung Jawab Pelayanan)            | 'SKIDR00001'                                  |
| `tglkonsul`        | Tanggal Periksa DPJP                                     | '2025-04-25 12:30:00'                         |
| `jamdikonsul`      | Jam Periksa DPJP                                         | '12:30:00'                                    |
| `kondisi_pulang`   | Kondisi Pulang ("KELUAR001" jika "SEMBUH", "KELUAR002" jika "BELUM SEMBUH", "KELUAR003" jika "MENINGGAL <\48 JAM DALAM OPNAME", "KELUAR004" jika "MENINGGAL >\48 JAM DALAM OPNAME", "KELUAR005" jika "ATAS PERMINTAAN SENDIRI", "KELUAR006" jika "DIRUJUK", "KELUAR007" jika "MENERUSKAN DENGAN RAWAT JALAN", "KELUAR008" jika "MENERUSKAN DENGAN RAWAT INAP") | 'KELUAR002' |

## 9. Resource Observation - TTV (Inpatient)

### Contoh Data TTV:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_tanda_vital` menggunakan `noreg` dan `tanggal`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_tanda_vital` **(Inpatient)**

| Nama Kolom         | Keterangan                                               | Contoh Data                                   |
|--------------------|----------------------------------------------------------|-----------------------------------------------|
| `tanggal`          | Tanggal Periksa Perawat                                  | '2025-04-26 10:30:00'                         |
| `noreg`            | Nomor Registrasi                                         | 'SKIRI20250000079'                            |
| `rekmed`           | Nomor Rekam Medis Pasien                                 | '0000077'                                     |
| `td1`              | Tekanan Darah Sistole                                    | 110                                           |
| `td2`              | Tekanan Darah Diastole                                   | 90                                            |
| `nadi`             | Nadi                                                     | 90                                            |
| `rr`               | Respiratory Rate                                         | 30                                            |
| `suhu`             | Suhu                                                     | 40                                            |
| `spo2`             | SpO2                                                     | 98                                            |

## 10. Resource Condition - Diagnosa

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

## 11. Resource Procedure - Tindakan

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

## 12. Resource MedicationRequest - E-Resep

### Contoh Data Medication PARACETAMOL 500MG TAB KF:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_orderperiksa` dan `tbl_eresep` menggunakan `orderno`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_orderperiksa`

| Nama Kolom     | Keterangan                                          | Contoh Data                                    |
| -------------- | --------------------------------------------------- | ---------------------------------------------- |
| `koders`       | Kode Rumah Sakit                                    | 'SKI'                                          |
| `orderno`      | Nomor Order Pemeriksaan                             | 'SKIER20250000000001'                          |
| `noreg`        | Nomor Registrasi                                    | 'SKIRJ20250000077'                             |
| `rekmed`       | Nomor Rekam Medis Pasien                            | '0000077'                                      |
| `tglorder`     | Tanggal Order Pemeriksaan                           | '2025-04-24 10:35:00'                          |
| `jamorder`     | Jam Order Pemeriksaan                               | '10:35:00'                                     |
| `proses`       | Status Proses Order (1 = Sudah diproses)            | 1                                              |
| `kodokter`     | Kode Dokter yang mengorder                          | 'SKIDR1001'                                    |
| `asal`         | Asal Unit/Poli dan Ruangan Order                    | 'Spesialis Urologi \| Ruang Spesialis Urologi' |
| `resep`        | Flag Resep (1 = Ya)                                 | 1                                              |
| `resepok`      | Flag Resep OK (1 = Ya)                              | 1                                              |
| `username`     | Username Petugas Input                              | 'admin'                                        |
| `gudang`       | Kode Gudang                                         | 'FARMASI'                                      |
| `obatpulang`   | Flag Obat Pulang (1 = Ya, 0 = Tidak)                | 0                                              |
| `kodepos`      | Kode Unit/Poli Order                                | 'PURO'                                         |

**Tabel:** `tbl_eresep`

| Nama Kolom     | Keterangan                                              | Contoh Data                |
| -------------- | ------------------------------------------------------- | -------------------------- |
| `koders`       | Kode Rumah Sakit                                        | 'SKI'                      |
| `noreg`        | Nomor Registrasi Pasien                                 | 'SKIRJ20250000077'         |
| `orderno`      | Nomor Order Pemeriksaan                                 | 'SKIER20250000000001'      |
| `kodeobat`     | Kode Obat                                               | '0300'                     |
| `namaobat`     | Nama Obat                                               | 'PARACETAMOL 500MG TAB KF' |
| `satuan`       | Satuan Obat                                             | 'TABLET'                   |
| `qty`          | Jumlah Obat yang Diresepkan                             | 12                         |
| `harga`        | Harga Satuan Obat                                       | 235                        |
| `totalharga`   | Total Harga Obat (harga x qty)                          | 2830                       |
| `aturanpakai`  | Aturan Pakai Obat                                       | '3 X 1'                    |
| `kronis`       | Indikasi Obat untuk Penyakit Kronis (1 = Ya, 0 = Tidak) | 0                          |

## 13. Resource QuestionnaireResponse - Telaah Resep

### Contoh Data Telaah:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_apotelaah` menggunakan `orderno`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_apotelaah`

| Nama Kolom     | Keterangan                                                                       | Contoh Data                               |
| -------------- | -------------------------------------------------------------------------------- | ------------------------------------------ |
| `orderno`      | Nomor Order Pemeriksaan atau Resep                                               | 'SKIER20250000000001'                      |
| `kode`         | Kode Penilaian Telaah (kode unik per aspek yang diambil dari tbl_aspektelaah)    | 1                                          |
| `aspek`        | Nama Aspek yang diambil dari tbl_aspektelaah                                     | 'KELENGKAPAN PENGISIAN RESEP'              |
| `unsur`        | Kategori atau Jenis Unsur yang diambil dari tbl_aspektelaah (administrasi, farmasetis, klinis) | 'administrasi'               |
| `resepno`      | Nomor Resep Terkait (kosong jika belum dikaitkan langsung ke `resepno`)          | ''                                         |
| `ok`           | Status Penilaian (1 = Sesuai, 0 = Tidak Sesuai)                                  | 1                                          |

## 14. Resource MedicationDispense - Farmasi Penjualan

### Contoh Data Medication PARACETAMOL 500MG TAB KF:
**Sebelum melakukan insert, lakukan pengecekan dengan `tbl_apoposting`, `tbl_apohresep` dan `tbl_apodresep` menggunakan `resepno`. Jika sudah ada, jangan insert.**

**Tabel:** `tbl_apoposting`

| Nama Kolom     | Keterangan                                     | Contoh Data              |
| -------------- | ---------------------------------------------- | --------------------------- |
| `koders`       | Kode Rumah Sakit                               | 'SKI'                       |
| `resepno`      | Nomor Resep                                    | 'SKIR202506000000001'       |
| `eresepno`     | Nomor E-Resep                                  | 'SKIER20250000000001'       |
| `tglresep`     | Tanggal & Waktu Resep                          | '2025-04-24 10:38:00'       |
| `noreg`        | Nomor Registrasi Pasien                        | 'SKIRJ20250000077'          |
| `rekmed`       | Nomor Rekam Medis                              | '0000077'                   |
| `namapas`      | Nama Pasien                                    | 'Ardianto Putra'            |
| `umurpas`      | Umur Pasien (format usia)                      | '28 tahun, 8 bulan, 9 hari' |
| `gudang`       | Kode Gudang                                    | 'FARMASI'                   |
| `poscredit`    | Jumlah Biaya Resep (Total)                     | 2830                        |
| `diskonrp`     | Diskon dalam Rupiah                            | 0                           |
| `bayar`        | Jumlah yang Dibayar Pasien                     | 0                           |
| `posting`      | Status Posting (1 = Sudah)                     | 1                           |
| `keluar`       | Flag Obat Keluar (1 = Sudah Keluar)            | 0                           |
| `kodepel`      | Kode Pelayanan (RAJAL, RANAP, APS)             | 'RAJAL'                     |
| `username`     | Username Petugas                               | 'admin'                     |

**Tabel:** `tbl_apohresep`

| Nama Kolom     | Keterangan                                                  | Contoh Data           |
| -------------- | ----------------------------------------------------------- | --------------------- |
| `koders`       | Kode Rumah Sakit                                            | 'SKI'                 |
| `resepno`      | Nomor Resep                                                 | 'SKIR202506000000001' |
| `eresepno`     | Nomor E-Resep                                               | 'SKIER20250000000001' |
| `noreg`        | Nomor Registrasi Pasien                                     | 'SKIRJ20250000077'    |
| `rekmed`       | Nomor Rekam Medis                                           | '0000077'             |
| `jenisjual`    | Jenis Penjualan (1)                                         | 1                     |
| `jenispas`     | Jenis Pasien (1 = Rajal, 2 = Ranap)                         | 1                     |
| `pro`          | Nama Pasien                                                 | 'Ardianto Putra'      |
| `tglresep`     | Tanggal Resep                                               | '2025-04-24 10:38:00' |
| `jam`          | Jam Resep                                                   | '10:38:00'            |
| `kodokter`     | Kode Dokter                                                 | 'SKIDR1001'           |
| `gudang`       | Kode Gudang                                                 | 'FARMASI'             |
| `bayar`        | Bayar (1 = Sudah)                                           | 1                     |
| `posting`      | Status Posting Resep (1 = Sudah)                            | 1                     |
| `username`     | Username Petugas                                            | 'admin'               |
| `kodepel`      | Kode Pelayanan (RAJAL, RANAP, APS)                          | 'RAJAL'               |
| `tgl_telaah`   | Tanggal Telaah Obat oleh Apoteker                           | '2025-04-24 10:39:00' |
| `user_telaah`  | Username Apoteker yang Menelaah                             | 'user_apoteker'       |

**Tabel:** `tbl_apodresep`

| Nama Kolom     | Keterangan                                     | Contoh Data             |
| -------------- | ---------------------------------------------- | -------------------------- |
| `resepno`      | Nomor Resep                                    | 'SKIR202506000000001'      |
| `eresepno`     | Nomor E-Resep                                  | 'SKIER20250000000001'      |
| `koders`       | Kode Rumah Sakit                               | 'SKI'                      |
| `kodebarang`   | Kode Obat                                      | '0300'                     |
| `namabarang`   | Nama Obat                                      | 'PARACETAMOL 500MG TAB KF' |
| `qty`          | Jumlah Obat yang Diberikan                     | 12                         |
| `satuan`       | Satuan Obat                                    | 'TABLET'                   |
| `discrp`       | Diskon dalam Rupiah                            | 0                          |
| `price`        | Harga Jual per Satuan                          | 235                        |
| `hna`          | Harga Netto Apotek (Harga Beli)                | 170                        |
| `hpp`          | Harga Pokok Penjualan                          | 170                        |
| `ppntype`      | Tipe PPN (1 = PPN Aktif, 0 = Non-PPN)          | 1                          |
| `totalrp`      | Total Harga Obat (Setelah diskon, jika ada)    | 2830                       |
| `atpakai`      | Aturan Pakai Obat                              | '3 X 1'                    |
| `exp_date`     | Tanggal Kedaluwarsa Obat                       | '2025-06-11'               |
| `kronis`       | Obat untuk Penyakit Kronis (1 = Ya, 0 = Tidak) | 0                          |
