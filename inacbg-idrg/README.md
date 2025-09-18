# 📄 Dokumentasi Insert Data Diagnosa atau Prosedur IDRG

Tabel `tbl_idrg_transaction_icd` digunakan untuk menyimpan **diagnosa** (ICD-10) dan **prosedur** (ICD-9-CM) pasien berdasarkan kode standar internasional.  
Untuk Master Diagnosa atau Prosedur IDRG bisa di get dari tabel `tbl_idrg_icd`.
---

## 🏗 Struktur Tabel

| Kolom   | Tipe Data     | Keterangan | Contoh Data |
|---------|---------------|------------|-------------|
| rekmed  | VARCHAR       | Nomor rekam medis pasien | `19566` |
| noreg   | VARCHAR       | Nomor registrasi kunjungan pasien | `RJ2018A00570` |
| code    | VARCHAR       | Kode ICD (diagnosa/prosedur) | `N40.0` |
| utama   | INT           | Penanda diagnosa/prosedur utama (1 = utama, 0 = tambahan) | `1` |
| urut    | INT           | Urutan pencatatan diagnosa/prosedur | `1` |
| qty     | INT           | Jumlah tindakan (umumnya relevan untuk prosedur) | `1` |
| system  | VARCHAR       | Sistem kode yang digunakan `ICD_10_2010_IM` untuk diagnosa atau `ICD_9CM_2010_IM` untuk prosedur | `ICD_10_2010_IM` |

---

# 📄 Dokumentasi Insert Data Diagnosa atau Prosedur INACBG

Tabel `tbl_inacbg_transaction_icd` digunakan untuk menyimpan **diagnosa** (ICD-10) dan **prosedur** (ICD-9-CM) pasien berdasarkan kode standar internasional.  
Untuk Master Diagnosa atau Prosedur INACBG bisa di get dari tabel `tbl_inacbg_icd`.
---

## 🏗 Struktur Tabel

| Kolom   | Tipe Data     | Keterangan | Contoh Data |
|---------|---------------|------------|-------------|
| rekmed  | VARCHAR       | Nomor rekam medis pasien | `19566` |
| noreg   | VARCHAR       | Nomor registrasi kunjungan pasien | `RJ2018A00570` |
| code    | VARCHAR       | Kode ICD (diagnosa/prosedur) | `N40` |
| utama   | INT           | Penanda diagnosa/prosedur utama (1 = utama, 0 = tambahan) | `1` |
| urut    | INT           | Urutan pencatatan diagnosa/prosedur | `1` |
| system  | VARCHAR       | Sistem kode yang digunakan `ICD_10_2010` untuk diagnosa atau `ICD_9CM_2010` untuk prosedur | `ICD_10_2010` |

---
