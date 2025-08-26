<div align="center">

<h1 align="center">
 WS PACS.
</h1>

![Version](https://img.shields.io/badge/version-1.5.1-brightgreen?style=for-the-badge)
![Requirements](https://img.shields.io/badge/php-%3E%3D%208.2.19-4F5D95?style=for-the-badge)
[![GitHub](https://img.shields.io/badge/GitHub-Repo-6f42c1?style=for-the-badge)](https://github.com/ski-abiyosoft/pacs)

</div>

## Daftar Isi

- [Perkenalan](#-perkenalan)
- [Fitur](#-fitur)

## 📚 Perkenalan

Web Service Pengiriman Data PACS Untuk Menjembatani HMS.

## 🌟 Fitur

### 📑 POSTING ORDER

#### Method: GET

#### Format Request:

{BASE_URL}/order-store?accession_number={ACCESSION_NUMBER}

#### 🔑 Catatan Penting
- `accession_number` digunakan sebagai **primary key** / **unique id** setiap pemeriksaan.
- Maksimal panjang `accession_number` adalah **16 huruf**.

#### 📌 Struktur Data

| No | Kolom               | Level      | Keterangan                                                                 | Contoh Data  |
|----|---------------------|------------|----------------------------------------------------------------------------|--------------|
| 1  | patient_id          | Mandatory  | Nomor RM pasien                                                            | "123jj3"     |
| 2  | patient_name        | Mandatory  | Nama pasien                                                                | "John Doe"   |
| 3  | patient_sex         | Mandatory  | F, M, O (Other)                                                            | "M"          |
| 4  | patient_birthday    | Mandatory  | Tanggal lahir pasien                                                       | "1990-01-01" |
| 5  | patient_weight      | -          | Berat badan pasien                                                         | "70"         |
| 6  | patient_class       | -          | E (Emergency), I (Inpatient), O (Outpatient)                               | "O"          |
| 7  | ward                | -          | Ruangan pasien                                                             | "Ward 101"   |
| 8  | attending_doctor    | -          | Dokter penanggung jawab pasien                                             | "Dr. Smith"  |
| 9  | referring_doctor    | -          | Dokter yang meminta order radiologi                                        | "Dr. Johnson" |
| 10 | order_control       | Mandatory  | NW (Baru), RO (Update), CA (Batal)                                         | "NW"         |
| 11 | order_department    | -          | Contoh: AN (Anestesiologi), ER (Emergency Room IGD), NS (Bedah Saraf), OS (Ortopedi) | "ER"   |
| 12 | accession_number    | Mandatory  | Nomor foto unik untuk setiap pemeriksaan                                   | "12ab1"      |
| 13 | study_code          | -          | Kode pemeriksaan dari SIMRS                                                | "CT123"      |
| 14 | study_name          | Mandatory  | Nama pemeriksaan dari SIMRS                                                | "Head CT Scan"   |
| 15 | order_datetime      | -          | Tanggal dan waktu order                                                    | "2025-01-01 10:00:00" |
| 16 | scheduled_datetime  | -          | Tanggal dan waktu foto                                                     | "2025-01-01 11:00:00" |
| 17 | clinic_comments     | -          | Komentar klinis saat order                                                 | "None"       |
| 18 | sickness_name       | -          | Nama penyakit                                                              | "Headache"   |
| 19 | reason_for_study    | -          | Alasan pemeriksaan                                                         | "Diagnostic" |
| 20 | body_part           | -          | Bagian tubuh yang diperiksa                                                | "Head"       |
| 21 | ordering_doctor     | -          | Dokter radiologi yang mengerjakan                                          | "Dr. Brown"  |
| 22 | exam_room           | -          | Ruangan tempat foto dilakukan                                              | "Room 201"   |
| 23 | modality            | Mandatory  | Kode internasional alat pencitraan                                         | "CT"         |
| 24 | operator_name       | -          | Nama petugas operator                                                      | "Operator1"  |
| 25 | insurance           | -          | Rencana pembayaran pemeriksaan                                             | "BPJS"       |
| 26 | exam_urgent         | -          | 1 (Urgent), 0 (Normal)                                                     | "0"          |

---

### 🔍 LIHAT ORDER

Mengambil data order berdasarkan nomor Accession Number.

Data yang diterima berupa path URL foto tanpa protokol (http/https) dan domain/ip, agar mudah disesuaikan jika ada perubahan domain/ip.

#### Method: GET

#### Format Request:

{BASE_URL}/order-show/{ACCESSION_NUMBER}

### 📋 LIHAT HASIL BACA

Mengambil data hasil baca radiologi berdasarkan nomor Accession Number.

Data yang dikembalikan berisi informasi lengkap hasil baca, dokter yang mengisi dan mengkonfirmasi, serta status laporan.

#### Method: GET

#### Format Request:

{BASE_URL}/report-show/{ACCESSION_NUMBER}
