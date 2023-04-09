#create database unilever;
use unilever;
create table TaiKhoan(
	username char primary key,
    passwords char,
    constraint lk foreign key (username) references QuanLiNguoiDung(email)
);
create table QuanLiNguoiDung(
	email char primary key,
    hoten char,
    chucvu char,
    khuvuc char,
    nguoibaocao char, 
    sodienthoai char,
    quanly char
);
create table QuyenTruyCap();
create table QuanLiChucVu(

);
create table QuanLiLichViengTham(
	id_lichviengtham char primary key,
	ngaybatdau date,
    ngayketthuc date,
	mucdich char,
    nguoitao char,
    trangthai char,
    nhaphanphoi char
);
create table CongViec(
	id_congviec char primary key,
    tieude char,
    nguoithuchien char,
    nguoibaocao char,
    mota char,
    ngaytao date,
    ngaybatdau date,
    ngayketthuc date
);
create table BinhLuan(
	id_binhluan char primary key,
    id_congviec char,
    nguoibinhluan char,
    noidungbinhluan char,
    constraint lk1 foreign key (id_congviec) references CongViec(id_congviec)
);
create table DanhSachKhach(
	emailkhach char,
    id_congviec char,
    hotenkhach char,
    tinhtrang char,
    primary key (emailkhach, id_congviec),
    constraint lk2 foreign key (emailkhach) references QuanLiNguoiDung(email),
    constraint lk3 foreign key (id_congviec) references CongViec(id_congviec)
);