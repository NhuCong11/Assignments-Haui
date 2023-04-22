#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<string.h>
using namespace std;
class Phieu;
class TaiSan {
	private:
		char tenTS[50];
		int soLuong;
		char tinhTrang[30];
	public:
		void nhap();
		void xuat();
	friend class Phieu;
	friend void suaPhieu(Phieu &a);
	friend void sapXepTang(Phieu &a);
};

void TaiSan::nhap() {
	cout<<"\nNhap ten tai san: ";      fflush(stdin);    gets(tenTS);
	cout<<"\nNhap so luong: ";                         cin>>soLuong;
	cout<<"\nNhap trinh trang: ";    fflush(stdin);    gets(tinhTrang);
}

void TaiSan::xuat() {
	cout<<setw(30)<<left<<tenTS;
	cout<<setw(20)<<left<<soLuong;
	cout<<setw(30)<<left<<tinhTrang;
	cout<<endl;
}

class Phong {
	private:
		char maPhong[10];
		char tenPhong[50];
		char truongPhong[30];
	public:
		void nhap();
		void xuat();
};

void Phong::nhap() {
	cout<<"\nNhap ten phong kiem ke: ";      fflush(stdin);       gets(tenPhong);
	cout<<"\nNhap ma phong: ";               fflush(stdin);       gets(maPhong);
	cout<<"\nNhap ten truong phong: ";       fflush(stdin);       gets(truongPhong);
}

void Phong::xuat() {
	cout<<"Kiem ke tai phong: "<<tenPhong;
	cout<<"\t\tMa phong: "<<maPhong;
	cout<<"\nTruong phong: "<<truongPhong;
}

class NhanVien {
	private:
		char tenNhanVien[30];
		char chucVu[30];
	public:
		void nhap();
		void xuat();
};

void NhanVien::nhap() {
	cout<<"\nNhap ten nhan vien kiem ke: ";       fflush(stdin);       gets(tenNhanVien);
	cout<<"\nNhap chuc vu: ";                     fflush(stdin);       gets(chucVu);
}

void NhanVien::xuat() {
	cout<<"Nhan vien kiem ke: "<<tenNhanVien;
	cout<<"\t\tChuc vu: "<<chucVu;
}

class Phieu {
	private:
		char maPhieu[20];
		char ngayKiemKe[20];
		NhanVien a;
		Phong b;
		TaiSan DS[50];
		int n;
	public:
		void nhap();
		void xuat();
	friend void suaPhieu(Phieu &a);
	friend void sapXepTang(Phieu &a);
};

void Phieu::nhap() {
	cout<<"Nhap ma phieu: ";        fflush(stdin);     gets(maPhieu);
	cout<<"\nNhap ngay kiem ke: ";  fflush(stdin);     gets(ngayKiemKe);
	a.nhap();
	b.nhap();
	cout<<"\nNhap vao so luong tai san: ";
	cin>>n;
	for(int i=0; i<n; i++) {
		cout<<"\nNhap thong tin tai san "<<i+1<<": ";
		DS[i].nhap();
	}
}

void Phieu::xuat() {
	cout<<endl;
	cout<<"-------------------- PHIEU KIEM KE TAI SAN -----------------------";
	cout<<endl;
	cout<<"Ma phieu: "<<maPhieu;
	cout<<"\t\t\t\t\tNgay kiem ke: "<<ngayKiemKe;
	cout<<endl;
	a.xuat();
	cout<<endl;
	b.xuat();
	cout<<endl;
	cout<<endl;
	cout<<setw(30)<<left<<"Ten tai san";
	cout<<setw(20)<<left<<"So luong";
	cout<<setw(30)<<left<<"Tinh trang";
	cout<<endl;
	for(int i=0; i<n; i++) {
		DS[i].xuat();
	}
	int tongSL=0;
	for(int i=0; i<n; i++) {
		tongSL += DS[i].soLuong;
	}
	cout<<endl;
	cout<<"So tai san da kiem ke: "<<n;
	cout<<"\t\tTong so luong: "<<tongSL;
}

void suaPhieu(Phieu &a) {
	int dem=0;
	for(int i=0;i<a.n; i++) {
		if(strcmp(a.DS[i].tenTS,"May vi tinh")==0) {
			dem++;
			a.DS[i].soLuong = 20;
		}
	}
	
	if(dem==0) {
		cout<<"\n_ Warning!: Khong co tai san nao ten 'May vi tinh'";
	}
}

void sapXepTang(Phieu &a) {
	for(int i=0; i<a.n-1; i++) {
		for(int j=i+1; j<a.n; j++) {
			if(a.DS[i].soLuong > a.DS[j].soLuong) {
				TaiSan temp = a.DS[i];
				a.DS[i] = a.DS[j];
				a.DS[j] = temp;
			}
		}
	}
}

int main() {
	Phieu x;
	x.nhap();
	x.xuat();
	cout<<endl;
	cout<<endl;
	suaPhieu(x);
	cout<<"\n_ Phieu sau khi sua thong tin so luong tai san 'May vi tinh'(neu co):";
	cout<<endl;
	x.xuat();
	cout<<endl;
	cout<<endl;
	cout<<"\n_ Phieu sau khi sap xep tang dan cua so luong: ";
	sapXepTang(x);
	x.xuat();
}
