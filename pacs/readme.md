# 📑 ORDER - POST (WS PACS)

Data yang dikirimkan ke **WS PACS**.

---

## 🔑 Catatan Penting
- `accession_number` digunakan sebagai **primary key** / **unique id** setiap pemeriksaan.
- Maksimal panjang `accession_number` adalah **16 huruf**.

---

## 📌 Struktur Data

| No | Data                | Level      | Keterangan                                                                 |
|----|---------------------|------------|----------------------------------------------------------------------------|
| 1  | patient_id          | Mandatory  | Nomor RM pasien                                                            |
| 2  | patient_name        | Mandatory  | Nama pasien                                                                |
| 3  | patient_sex         | Mandatory  | F, M, O (Other)                                                            |
| 4  | patient_birthday    | Mandatory  | Tanggal lahir pasien                                                       |
| 5  | patient_weight      | -          | Berat badan pasien                                                         |
| 6  | patient_class       | -          | E (Emergency), I (Inpatient), O (Outpatient)                               |
| 7  | ward                | -          | Ruangan pasien                                                             |
| 8  | attending_doctor    | -          | Dokter penanggung jawab pasien                                             |
| 9  | referring_doctor    | -          | Dokter yang meminta order radiologi                                        |
| 10 | order_control       | Mandatory  | NW (Baru), RO (Update), CA (Batal)                                         |
| 11 | order_department    | -          | Contoh: AN (Anestesiologi), ER (Emergency Room IGD), NS (Bedah Saraf), OS (Ortopedi) |
| 12 | accession_number    | Mandatory  | Nomor foto unik untuk setiap pemeriksaan                                   |
| 13 | study_code          | -          | Kode pemeriksaan dari SIMRS                                                |
| 14 | study_name          | Mandatory  | Nama pemeriksaan dari SIMRS                                                |
| 15 | order_datetime      | -          | Tanggal dan waktu order                                                    |
| 16 | scheduled_datetime  | -          | Tanggal dan waktu foto                                                     |
| 17 | clinic_comments     | -          | Komentar klinis saat order                                                 |
| 18 | sickness_name       | -          | Nama penyakit                                                              |
| 19 | reason_for_study    | -          | Alasan pemeriksaan                                                         |
| 20 | body_part           | -          | Bagian tubuh yang diperiksa                                                |
| 21 | ordering_doctor     | -          | Dokter radiologi yang mengerjakan                                          |
| 22 | exam_room           | -          | Ruangan tempat foto dilakukan                                              |
| 23 | modality            | Mandatory  | Kode internasional alat pencitraan                                         |
| 24 | operator_name       | -          | Nama petugas operator                                                      |
| 25 | insurance           | -          | Rencana pembayaran pemeriksaan                                             |
| 26 | exam_urgent         | -          | 1 (Urgent), 0 (Normal)                                                     |

---
