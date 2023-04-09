create database unilever;
use unilever;

create table ChucVu(
	id char(10) primary key,
    tenchucvu char(50)
);
alter table ChucVu add column ngaytao date;
create table NhomChucVu(
	id char(10) primary key,
    tenhom char(50)
);
create table ChiTietChucVu(
	id_tenchucvu char(10),
    id_tennhom char(10),
    primary key(id_tenchucvu, id_tennhom),
    constraint lk1 foreign key (id_tenchucvu) references ChucVu(id),
    constraint lk2 foreign key (id_tennhom) references NhomChucVu(id)
);

create table KhuVuc(
	id char(10) primary key,
    ten char(20)
);

create table DanhSachNguoiDung(
	email char(50) primary key,
    hoten char(50),
    #chucvu char(10),
    khuvuc char(100),
    #nguoibaocao char(50), 
    sodienthoai char(50)
    #quanly char(50)
);
alter table DanhSachNguoiDung add column chucvu char(10);
alter table DanhSachNguoiDung add constraint lk6 foreign key (chucvu) references ChucVu(id);
alter table DanhSachNguoiDung modify column khuvuc char(10);
alter table DanhSachNguoiDung add column vaitro char(20);
alter table DanhSachNguoiDung add constraint lk16 foreign key (khuvuc) references KhuVuc(id);
alter table DanhSachNguoiDung add column trangthai char(20);

create table QuanLiNguoiDung(
	nguoidung char(50),
    quanly char(50),
    primary key(nguoidung, quanly),
    constraint lk3 foreign key (nguoidung) references DanhSachNguoiDung(email),
    constraint lk4 foreign key (quanly) references DanhSachNguoiDung(email)
);
alter table QuanLiNguoiDung add column nguoibaocao char(50);
alter table QuanLiNguoiDung add constraint lk13 foreign key (nguoibaocao) references DanhSachNguoiDung(email);

create table LichViengTham(
	id_lichviengtham char(10) primary key,
	ngaybatdau date,
    ngayketthuc date,
	mucdich char(100),
    nguoitao char(50),
    trangthai char(20),
    nhaphanphoi char(50),
    constraint lk5 foreign key (nguoitao) references DanhSachNguoiDung(email)
);

create table KhachMoi(
	id_lichvieng char(10),
    mailkhach char(50),
    tinhtrang char(50),
    primary key(id_lichvieng, mailkhach),
    constraint lk7 foreign key (id_lichvieng) references LichViengTham(id_lichviengtham),
    constraint lk8 foreign key (mailkhach) references DanhSachNguoiDung(email)
);

create table CongViec(
	id_congviec char(10) primary key,
    tieude char(50),
    nguoithuchien char(50),
    nguoibaocao char(50),
    mota char(100),
    ngaytao date,
    ngaybatdau date,
    ngayketthuc date,
    tinhtrang char(20),
    constraint lk9 foreign key (nguoithuchien) references DanhSachNguoiDung(email),
    constraint lk10 foreign key (nguoibaocao) references DanhSachNguoiDung(email)
);

create table TaiKhoan(
	username char(50) primary key,
    passwords char(20),
    constraint lk11 foreign key (username) references DanhSachNguoiDung(email)
);

create table BinhLuan(
	id_binhluan datetime primary key,
    id_congviec char(10),
    nguoibinhluan char(50),
    noidungbinhluan text,
    constraint lk12 foreign key (id_congviec) references CongViec(id_congviec)
);

create table Module(
	id char(10) primary key,
    ten char(30)
);
create table QuyenTruyCap(
	id char(10) primary key,
    ten char(50)
);
create table ChiTietQuyenTruyCap(
	module char(10),
    quyen char(20),
    primary key(module, quyen),
    constraint lk14 foreign key (module) references Module(id),
    constraint lk15 foreign key (quyen) references QuyenTruyCap(id)
);
