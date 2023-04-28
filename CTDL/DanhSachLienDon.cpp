#include<iostream>
#include<string.h>
#include<stdio.h>
#include<iomanip>
using namespace std;
struct SinhVien {
	char maSV[20];
	char tenSV[30];
	float diem;
};

typedef struct SinhVien sv;

struct Node {
	sv data; // du lieu chua trong 1 nod
	struct Node *pNext; // con tro dung de lien ket giua cac not voi nhau
};

typedef struct Node NODE;

struct list {
	NODE *pHead; // node quan ly dau danh sach
	NODE *pTail; // node quan ly cuoi danh sach
};

typedef struct list LIST;

void khoiTao(LIST &l) {
	l.pHead = NULL;
	l.pTail = NULL;
}

NODE *khoiTaoNode(sv x) {
	NODE *p = new NODE; // cap phat vung nho
	p->data = x;
	p->pNext = NULL;
	return p;  // tra ve node p vua tao
}

// ham them node p vao dau danh sach
void themVaoDau(LIST &l, NODE *p) {
	if(l.pHead == NULL) {
		l.pHead = l.pTail = p;
	}else {
		p->pNext = l.pHead; //cho con tro cua node can them là node p lien ket voi not dau pHead
		l.pHead = p; // cap nhat lai pHead chinh la node p
	}
}

//ham them node p vao cuoi danh sach
void themVaoCuoi(LIST &l, NODE *p) {
	if(l.pHead == NULL) {
		l.pHead = l.pTail = p;
	}else {
		l.pTail->pNext = p; //cho con tro cua pTail lien ket voi node p
	    l.pTail = p;
	}
}

//ham them node p vao sau node q
void themNodePVaoSauNodeQ(LIST &l, NODE *p) {
    sv a;
    cout<<"\nNhap ma sv can chen sau: ";    fflush(stdin);   gets(a.maSV);
    NODE *q = khoiTaoNode(a);
    for(NODE *k = l.pHead; k!=NULL; k = k->pNext) {
        if(strcmp(k->data.maSV, a.maSV) == 0) {
            q = k;
            break;
        }
    }
    if(q == NULL) {
        cout << "\n_ Khong tim thay sinh vien co ma SV la " << a.maSV;
        return;
    }
    if(q == l.pTail) {
        themVaoCuoi(l, p);
    } else {
        p->pNext = q->pNext;
        q->pNext = p;
    }   
}

void xuat(LIST l) {
	cout<<"\n---------- Danh sach: ----------\n";
	cout<<setw(20)<<left<<"Ma SV";
	cout<<setw(20)<<left<<"Ten SV";
	cout<<setw(20)<<left<<"Diem";
	cout<<endl;
	for(NODE *k = l.pHead; k!=NULL; k = k->pNext) {
		cout<<setw(20)<<left<<k->data.maSV;
		cout<<setw(20)<<left<<k->data.tenSV;
		cout<<setw(20)<<left<<k->data.diem;
		cout<<endl;
	}
}

// tim sv theo ten
void timKiemSVTheoTen(LIST l) {
    char tenSV[30];
    cout<<"\n_ Nhap vao ten sinh vien can tim: ";   fflush(stdin);     gets(tenSV);
    
	NODE *p = l.pHead;
    int found = 0;
    while(p != NULL) {
        if(strcmp(p->data.tenSV,tenSV) == 0) {
            found = 1;
            cout<<"_ Thong tin sinh vien can tim: ";
            cout<<"\nMa SV: "<<p->data.maSV;
            cout<<"\nTen SV: "<<p->data.tenSV;
            cout<<"\nDiem TB: "<<p->data.diem;
            break;
        }
        p = p->pNext;
    }
    if(found == 0) {
        cout<<"\n_ Khong tim thay sinh vien co ten la "<<tenSV;
    }
}

//tim sv co diem max
void timMaxDiem(LIST l) {
    if (l.pHead == NULL) {
        cout << "\nDanh sach rong!";
        return;
    }
    
    sv max = l.pHead->data;
    for(NODE *k = l.pHead->pNext; k!=NULL; k = k->pNext) {
        if(k->data.diem > max.diem) {
            max = k->data;
        }
    }
    cout<<"\n_ Thong tin sv co diem TB lon nhat: ";
    cout<<endl;
    cout<<setw(20)<<left<<"Ma SV";
    cout<<setw(20)<<left<<"Ten SV";
    cout<<setw(20)<<left<<"Diem";
    cout<<endl;
    cout<<setw(20)<<left<<max.maSV;
    cout<<setw(20)<<left<<max.tenSV;
    cout<<setw(20)<<left<<max.diem;
}

// tim sv co diem min
void timMinDiem(LIST l) {
    if (l.pHead == NULL) {
        cout << "\nDanh sach rong!";
        return;
    }

    sv min = l.pHead->data;
    for(NODE *k = l.pHead->pNext; k!=NULL; k = k->pNext) {
        if(k->data.diem < min.diem) {
            min = k->data;
        }
    }
    cout<<"\n_ Thong tin sv co diem TB nho nhat: ";
    cout<<endl;
    cout<<setw(20)<<left<<"Ma SV";
    cout<<setw(20)<<left<<"Ten SV";
    cout<<setw(20)<<left<<"Diem";
    cout<<endl;
    cout<<setw(20)<<left<<min.maSV;
    cout<<setw(20)<<left<<min.tenSV;
    cout<<setw(20)<<left<<min.diem;
}

// xoa sv theo ten
void xoaSinhVienTheoTen(LIST &l, char ten[]) {
    if (l.pHead == NULL) {
        cout << "\nDanh sach rong!";
        return;
    }

    NODE *prev = NULL;
    NODE *p = l.pHead;
    while (p != NULL && strcmp(p->data.tenSV, ten) != 0) {
        prev = p;
        p = p->pNext;
    }
    if (p == NULL) {
        cout << "_ Khong tim thay sinh vien co ten " << ten << " trong danh sach!";
        return;
    }
    if (prev == NULL) { // xoa phan tu dau tien
        l.pHead = p->pNext;
        delete p;
    } else {
        prev->pNext = p->pNext;
        if (p == l.pTail) { // xoa phan tu cuoi cung
            l.pTail = prev;
        }
        delete p;
    }
    cout << "_ Da xoa thanh cong sinh vien co ten " << ten << " trong danh sach!";
}


// xoa vi tri bat ky
void xoaVT(LIST &l, int k) {
	NODE *p = l.pHead;
    if(l.pHead == NULL) {
        cout << "\nDanh sach rong!";
        return;
    }else if (k == 1) {
        l.pHead = p->pNext;
        delete p;
    }else {
        for (int i = 1; i < k-1 && p->pNext != NULL; i++) {
            p = p->pNext;
        }
        if (p->pNext == NULL) {
            cout << "\n_ Vi tri xoa khong hop le!";
            return;
        }
        NODE *q = p->pNext;
        p->pNext = q->pNext;
        delete q;
    }
}

// xoa sv co diem max
void xoaMaxDiem(LIST &l) {
    if(l.pHead == NULL) {
        cout << "\nDanh sach rong!";
        return;
    }
    
    // Tim diem trung binh cao nhat
    float maxDiem = l.pHead->data.diem;
    for(NODE *k = l.pHead->pNext; k!=NULL; k = k->pNext) {
        if(k->data.diem > maxDiem) {
            maxDiem = k->data.diem;
        }
    }

    // Xoa tat ca sinh vien co diem trung binh cao nhat
    NODE *p = l.pHead;
    NODE *prev = NULL;
    while(p != NULL) {
        if(p->data.diem == maxDiem) {
            if(prev == NULL) {
                l.pHead = p->pNext;
            } else {
                prev->pNext = p->pNext;
            }
            if(p == l.pTail) {
                l.pTail = prev;
            }
            NODE *tmp = p;
            p = p->pNext;
            delete tmp;
        } else {
            prev = p;
            p = p->pNext;
        }
    }
    cout<<"\n_ Da xoa tat ca sinh vien co diem trung binh cao nhat!";
}

// chen 1 sv truoc sv co diem max
void chenSVTruocSVMax(LIST &l) {
	if (l.pHead == NULL) {
		cout << "\nDanh sach rong!";
		return;
	}
	
	sv b;
	cout << "\n_ Nhap thong tin sv can chen truoc: "<<endl;
	cout << "\nNhap ma sv: ";     fflush(stdin);   gets(b.maSV);
	cout << "Nhap ten sv: ";    fflush(stdin);   gets(b.tenSV);
	cout << "Nhap diem: ";                       cin>>b.diem;
	NODE *c = khoiTaoNode(b);
	
	NODE *p, *q;
	p = q = l.pHead;
	
	while(p != NULL) {
		if (p->data.diem > q->data.diem) {
			q = p;
		}
		p = p->pNext;
	}
	
	if(q == l.pHead) {
		themVaoDau(l, c);
	}else {
		NODE *prew = l.pHead;
		while(prew->pNext != q) {
			prew = prew->pNext;
		}
		prew->pNext = c;
		c->pNext = q;
	}
}


int main() {
	LIST l;
	khoiTao(l); // khoi tao danh sach lien ket don
    int n;
    sv a;
	cout<<"\nNhap so luong sinh vien:";
	cin>>n;
	for(int i=1; i<=n; i++) {
		cout<<"\nNhap ma sv: ";    fflush(stdin);   gets(a.maSV);
		cout<<"\nNhap ten sv: ";    fflush(stdin);   gets(a.tenSV);
		cout<<"\nNhap diem: ";                      cin>>a.diem;
		NODE *p = khoiTaoNode(a); //khoi tao 1 node so nguyen
	    themVaoCuoi(l,p); //them nod p vao dau danh sach lien ket don
	}
	xuat(l);
//	them node p vao sau node q
	sv b;
	cout<<"\nNhap thong tin sv can chen:";
	cout<<"\nNhap ma sv: ";     fflush(stdin);   gets(b.maSV);
	cout<<"\nNhap ten sv: ";    fflush(stdin);   gets(b.tenSV);
	cout<<"\nNhap diem: ";                       cin>>b.diem;
	NODE *c = khoiTaoNode(b);
	themNodePVaoSauNodeQ(l,c);
	cout<<endl;
	xuat(l);
//  tim sv theo ten
    timKiemSVTheoTen(l);
    cout<<endl;
//  tim max, min theo diem
	timMaxDiem(l);
	timMinDiem(l);
//  xoa sv theo ten
    char tenSVXoa[30];
    cout<<endl<<"\n_ Nhap ten sv can xoa: ";    fflush(stdin);   gets(tenSVXoa);
    xoaSinhVienTheoTen(l, tenSVXoa);
    cout<<endl;
    xuat(l);
//  xoa sv tai vi tri thu k
    int k;
    cout<<endl;
    cout<<"\n_ Nhap vao vi tri can xoa: ";
    cin>>k;
	xoaVT(l,k);
	xuat(l);
//  xoa sv co diem max
	xoaMaxDiem(l);
	cout<<endl;
	xuat(l);
//  chen 1 sv truoc sv diem max
    chenSVTruocSVMax(l);
    cout<<endl;
    xuat(l);
}
/*
3
SV01
Nguyen Kim Anh
2.88
SV02
Nguyen Van A
3.5
SV03
Trinh Gia Linh
2.4
SV04
Bui Xuan Hung
3.75
SV02
Trinh Gia Linh
Nguyen Kim Anh
1
SV05
Hoang Manh Hung
2.88
*/
