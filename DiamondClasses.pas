unit DiamondClasses;

interface

uses
  Forms, Windows, Classes, SysUtils, Graphics;

{.$DEFINE OLD_VER}
//{$IFDEF OLD_VER}^{$ENDIF}

type
  TDeger=set of Byte;
  TTekHucre=class;
  THucrelerGrubu=class;  //daha sonra tan�mlanan nesneleri temsil eden de�i�kenleri tan�mlamak i�in burada yaz�l�r..
  TDiamond=class;
  TBulmacaCozumSonucu=(bcsDolmadi,bcsYanlisCozuldu,bcsCozuldu);
  TIncelenenNesneOlayi=procedure(const Sender:TObject;const SiraNo,ToplamSayi:Byte)of object;

  TObjectList=class(TList) //TMatrixListten t�retildi farkl� olan yerler i�aretli
  private                  //hem 2 boyutlu, hemde 1 boyutlu dizi gibi kullan�labilir...
    FColumnCount:Integer;
    FAutoCalculateColumnCount,FAutoPack:Boolean;
    FRefreshEvent:TNotifyEvent;
    function GETListArray(RecNo: Integer): Pointer;
    function GETObjectArray(RecNo: Integer): TObject;    //<- bu eklendi
    function GETListMatrix(Row, Col: Integer): Pointer;
    function GETObjecMatrix(Row, Col: Integer): TObject; //<- bu eklendi
    function GETRowCount: Integer;
    procedure SETFAutoCalculateColumnCount(const Value: Boolean);
    procedure SETAutoPack(const Value: Boolean);
    procedure SETColumnCount(const Value: Integer);
    procedure SETListArray(RecNo: Integer; const Value: Pointer);
    procedure SETObjectArray(RecNo: Integer; const Value: TObject);
    procedure SETListMatrix(Row, Col: Integer; const Value: Pointer);
    procedure SETObjecMatrix(Row, Col: Integer; const Value: TObject);
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    procedure Clear;override; //<-+  ekleme var
    procedure ClearRegion(Left,Top,Right,Bottom:Integer);overload;   //Bir kare b�lgeyi temizler
    procedure ClearRegion(const LeftTop,RightBottom:TPoint);overload;
    procedure ClearRegion(const Region:TRect);overload;
    constructor Create;       //<-- de�i�im var
    function RecWherePoint(const RecNo:Integer):TPoint;
    function RecNo(const Row,Col:Integer):Integer;
    procedure Refresh;
    property ListArray[RecNo:Integer]:Pointer read GETListArray write SETListArray;
    property ObjectArray[RecNo:Integer]:TObject read GETObjectArray write SETObjectArray;    //<- bu eklendi
    property ListMatrix[Row,Col:Integer]:Pointer read GETListMatrix write SETListMatrix; default;
    property ObjectMatrix[Row,Col:Integer]:TObject read GETObjecMatrix write SETObjecMatrix; //<- bu eklendi
  published
    property AutoCalculateColumnCount:Boolean read FAutoCalculateColumnCount write SETFAutoCalculateColumnCount;
    property AutoPack:Boolean read FAutoPack write SETAutoPack;
    property ColumnCount:Integer read FColumnCount write SETColumnCount;
    property RowCount:Integer read GETRowCount;
    property RefreshEvent:TNotifyEvent read FRefreshEvent write FRefreshEvent;
  end;

  TTekHucre=class  //...
  private
    _Deger,_Satir,_Sutun,SayiDene,ASiraNo,_Satirlari,SGen:Byte;  //SayiDene deneme yan�lmada uygulanan son de�eri tutar
    _Degerler:TDeger;
    Gruplar:TList; //H�crenin i�inde bulundu�u gruplar
    Sahip:TDiamond;
    ADenemeDegeriVerildi:Boolean;
    function SayiOku: String;
    function KumedekiSayilar: String;
    procedure DegerYaz(const Sayi: Byte);
    function RenkOku:TColor;
    function DegerAyarla(const Sayi: Byte):Boolean;
    function OkuSatirlar(const SatirNo:Byte):String;
  public
    constructor HucreOlustur(const Satir,Sutun:Byte;const Sahibi:TDiamond=nil);
    destructor Destroy; override;
    function BuGruptamiyim(const HucrelerGrubu:THucrelerGrubu):Boolean;
    function DegerUygunmu(const Degeri:Byte):Boolean;
    property Degerler:TDeger read _Degerler;
    property Satirlar[const SatirNo:Byte]:String read OkuSatirlar;
  protected
    function DegerDegisti:Boolean; //Sayi tek kal�rsa sonu� true d�ner
    function SayiCikar(const Sayi:Byte):Boolean; //De�i�en de�er sonras� 1 tane say� kal�rsa true d�ner
    function SayiEkle(const Sayi:Byte):Boolean;
    procedure GrubaGirdi(const Grup:THucrelerGrubu);
    procedure Sifirla;
  published
    property Deger:Byte read _Deger write DegerYaz;
    property DenemeDegeriVerildi:Boolean read ADenemeDegeriVerildi;
    property Renk:TColor read RenkOku;
    property SatirNo:Byte read _Satir;
    property SutunNo:Byte read _Sutun;
    property Sayi:String read SayiOku;
    property Sayilar:String read KumedekiSayilar;
    property SiraNo:Byte read ASiraNo;
  end;

  THucrelerGrubu=class    //��z�m algoritmalar� bu s�n�ftad�r.
  private
    ASiraNo:Byte;
    ARenk:TColor;
    AListe:TList;
    AHesaplanacakHucreler:TList;//H�creler �zerinde ��z�m i�lemi i�in gerekli
    Sahip:TDiamond;
    DegerDegisti:Boolean;
    function DegersizElemanSayisi:Byte;//Grupta kactane eleman�n de�eri yok onu bulur...
  public
    constructor Olustur(const Sahibi:TDiamond);
    destructor Destroy; override;
    procedure Temizle;
    procedure HucreEkle(const TekHucre:TTekHucre);
  protected
    function Tara:Boolean;
    function FarkliSayiyiBulma:Boolean;//1. teknikle tarama yapar...
    function KumedenSinirlanmisElemanlariCikar
     (const incelenecekElemanSayisi:Byte=2):Boolean;//2. teknikle tarama
    function DigerKumedenGelenSinirlama(const HucrelerGrubu:THucrelerGrubu):Boolean;//3. teknikle tarama
  published
    property SiraNo:Byte read ASiraNo;
    property Renk:TColor read ARenk write ARenk;
  end;

  TDiamond=class //...
  private
    AOtomatikCoz:Boolean;
    ATaramaSeviyesi:Byte;
    ABoyut:Byte;
    AHucre: TObjectList; //Her h�creyi temsil eder
    AGruplar:TObjectList; //Satir, S�tun ve Kare gruplar�n� temsil eder... (Tek h�creler listesi)
    ADegeriVerilenler:TList;//Bulmacaya verilen ilk de�erler
    AGeciciListe:TStringList;
    AHizliCoz:Boolean;
    AIncelenenNesneOlayi:TIncelenenNesneOlayi;
    ADenemeyiDurdur:Boolean;
    Denenenler:TList;//Deneme yap�l�rken son olarak de�er verilmi� h�cre...
    //...->
    idx:array of Byte;//dinamik dizi, �ok boyutlu for d�ng�s� i�in kullan�l�r...
    Secili_idxler:TDeger;//se�ilmi� olan indexler bu k�meye yerle�tirilir...
    procedure idx_Baslat;//T�m elemanlara s�f�r veriliyor...
    function idx_Art(const KacSeciliEleman,KacToplamEleman:Byte):Boolean;//Bir sonraki for d�ng�s� de�erlerini elde eder...
    function idx_Sonraki(const KacSeciliEleman,KacToplamEleman:Byte):Boolean;//for d�ng�s� de�erleri birbirinden farkl� bir sonraki de�erler elde eder...
    //<-... Bu aral�k �zellikleri gruplarda �zel tarama yapabilmek i�in gerekli de�er ve metotlard�r..
    procedure YazBoyut(const Deger:Byte);
    procedure YAZTaramaSeviyesi(const Deger:Byte);
    function DegerOku(Satir,Sutun:Byte):Byte;
    function HucreRengiOku(Satir, Sutun: Byte): TColor;
    function HucreSayisiOku(Satir,Sutun:Byte):String;
    function HucreSayilariOku(Satir,Sutun:Byte):String;
    function DegeriVerilenmiOku(Satir,Sutun:Byte):Boolean;
    function DegeriDenenenmiOku(Satir,Sutun:Byte):Boolean;
    procedure Tara;
    procedure Temizle;
    procedure DegerYaz(Satir,Sutun,Degeri:Byte);
    procedure OtomatikCozYaz(const Deger: Boolean);
    procedure GruplariIncelenecek(const TekHucre:TTekHucre);
    procedure DenemeSayilariniTekrarYaz(const KacElemanHaric:Integer=0);
    function KacTaneDegerGirildiOku:Byte;
  public
    constructor Create;
    destructor Destroy; override;
    function BoyutAyarla(const Boyutu:Byte):Boolean;
    function BulmacaDogrumu:Boolean;
    function BulmacaDolumu:Boolean;
    procedure DegerDegisti; virtual; //bir de�er yaz�ld��� zaman yap�lmas� gereken kodlar sonra kullan�labilir...
    function Coz:TBulmacaCozumSonucu;
    function Dene:Boolean; //say�lar� deneme yan�lma ile ��zer...
    function DenemeyiGeriAtlat(KacAdimGeri:Integer=1):Integer;//..
    procedure DenemeyiBitir;
    procedure DenemeyiBaslangicaAl;//say�lar� denemek i�in ba�lan�� noktas�na ayarlar...
    procedure GeriAl(KacTane:Integer=1);//girilen de�erlerden ka�tanesi iptal edilecekse o i�lem yap�l�r...
    function GruplariOlustur:Boolean; virtual; //gruplar farkl� �ekillerde de olu�turulabilir..
    procedure DosyadanOku(const DosyaAdi:TFileName);
    procedure DosyayaKaydet(const DosyaAdi:TFileName);
    procedure YeniBulmacaOlustur(const DenemeSayilariniSil:Boolean=True);
    property Deger[Satir,Sutun:Byte]:Byte read DegerOku write DegerYaz; default;
    property HucreRengi[Satir,Sutun:Byte]:TColor read HucreRengiOku;
    property HucreSayilari[Satir,Sutun:Byte]:String read HucreSayilariOku;
    property HucreSayisi[Satir,Sutun:Byte]:String read HucreSayisiOku;
    property DegeriVerilenmi[Satir,Sutun:Byte]:Boolean read DegeriVerilenmiOku;
    property DegeriDenenenmi[Satir,Sutun:Byte]:Boolean read DegeriDenenenmiOku;
  protected
    function DegeriDisaridanmiVerildi(const TekHucre:TTekHucre):Boolean;
  published
    property Hucre:TObjectList read AHucre;
    property Boyut:Byte read ABoyut write YazBoyut;
    property DenemeyiDurdur:Boolean read ADenemeyiDurdur write ADenemeyiDurdur;
    property KacTaneDegerGirildi:Byte read KacTaneDegerGirildiOku;
    property Gruplar:TObjectList read AGruplar;
    property HizliCoz:Boolean read AHizliCoz write AHizliCoz;
    property OnIncelenenNesneOlayi:TIncelenenNesneOlayi read AIncelenenNesneOlayi write AIncelenenNesneOlayi;
    property OtomatikCoz:Boolean read AOtomatikCoz write OtomatikCozYaz;
    property TaramaSeviyesi:Byte read ATaramaSeviyesi write YAZTaramaSeviyesi;
  end;


function BoyutAyarla(const Boyutu:Byte):Boolean;
function KacSayiVar(const Deger:TDeger):Word;
function KumedekiTekKalanSayi(const Deger:TDeger):Byte;

var __Boyut:Byte=9;   //Ka� say� bulmaca olacak...

const BosKume=[];

implementation

type
  PHucreDegeri=^THucreDegeri;
  THucreDegeri=record
    Satir,Sutun,Deger:Byte;
  end;
  PHucreDegerleri=^THucreDegerleri;
  THucreDegerleri=array[0..MaxListSize - 1]of THucreDegeri;

function BoyutAyarla(const Boyutu:Byte):Boolean;
var i:Byte;
begin
  i:=Trunc(Sqrt(Boyutu));
  Result:=((i*i)=Boyutu);
  if Result then __Boyut:=Boyutu
  else MessageBox(Application.Handle,'Verilen boyutland�rma de�eri ge�ersizdir...','Hata',MB_ICONERROR);
end;

function KacSayiVar(const Deger:TDeger):Word; //k�mede ka� say� oldu�unu bulur
var Dizi:PByteArray; i:Integer;
 function BitSayisi(a:Byte):Byte;
 begin
   Result:=0;
   while a>0 do begin
     Result:=Result+(a and 1);
     a:=a shr 1;
   end;
 end;
begin
  Dizi:=@Deger;
  Result:=0;      {SizeOf(TDeger)=32 Byte}
  for i:=0 to 31 do Result:=Result+BitSayisi(Dizi^[i]);
end;

function KumedekiTekKalanSayi(const Deger:TDeger):Byte;//E�er k�mede sadece 1 de�er varsa onu bulur
var
  Dizi:array[1..32]of Byte absolute Deger;
  i,j,k:Byte;
begin
  Result:=0; j:=0;
  for i:=1 to 32 do begin
    case Dizi[i] of
      0:;
      1,2,4,8,16,32,64,128:if j<>0 then begin
        Result:=0;Exit;
      end else j:=i;
    else
      Result:=0;
      Exit;
    end;
  end;
  if j<>0 then begin
    i:=Dizi[j]; k:=0;
    while i>0 do begin inc(k); i:=i div 2;end;
    Result:=(j-1)*8+k-1
  end;
end;

function Pop(const Liste:TList):Pointer;//Sondan eleman �eker
begin
  if Liste.Count>0 then begin
    Result:=Liste.List{$IFDEF OLD_VER}^{$ENDIF}[Liste.Count-1];
    Liste.List{$IFDEF OLD_VER}^{$ENDIF}[Liste.Count-1]:=nil;//TObjectListten �ekilene nesneye dokunmamas� i�in
    Liste.Delete(Liste.Count-1);
  end else Result:=nil;
end;

function LastElement(const Liste:TList):Pointer;//Son eleman� verir
begin
  Result:=nil;
  if Assigned(Liste) and (Liste.Count>0) then Result:=Liste[Liste.Count-1];
end;

{ TObjectList }

procedure TObjectList.Clear;
var i:Integer; Obj:TObject;
begin
  for i:=0 to Count-1 do begin      //<-
    Obj:=Items[i];                  //<-
    Items[i]:=nil;                  //<-
    if Assigned(Obj) then Obj.Free; //<-
  end;                              //<-
  inherited Clear;
  Refresh;
end;

procedure TObjectList.ClearRegion(Left, Top, Right, Bottom: Integer);
var Row,Col,k:Integer; tmp:Pointer;
begin
  if Left>Right then begin k:=Left;Left:=Right;Right:=k;end;
  if Top>Bottom then begin k:=Top;Top:=Bottom;Bottom:=k;end;
  for Col:=Left to Right do
   for Row:=Top to Bottom do begin
     k:=RecNo(Row,Col);
     if k>=0 then begin
       tmp:=List{$IFDEF OLD_VER}^{$ENDIF}[k];
       List{$IFDEF OLD_VER}^{$ENDIF}[k]:=nil;
       Notify(tmp,lnDeleted);
     end;
  end;
  Refresh;
end;

procedure TObjectList.ClearRegion(const LeftTop, RightBottom: TPoint);
begin
  ClearRegion(LeftTop.x, LeftTop.y, RightBottom.x, RightBottom.y);
end;

procedure TObjectList.ClearRegion(const Region: TRect);
begin
  ClearRegion(Region.Left,Region.Top,Region.Right,Region.Bottom);
end;

constructor TObjectList.Create;
begin
  FColumnCount:=1;
  FAutoCalculateColumnCount:=False; //<--
  FAutoPack:=False;                 //<--
end;

procedure TObjectList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  case Action of
    lnAdded:;  //Bir adres eklendi�inde e�er nil de�ilse buras� �al���r
    lnExtracted:;  //Bir adres listeden silinir (function:Pointer {Ptr}) ve buras� �al���r
    lnDeleted:if Assigned(Ptr) then TObject(Ptr).Free; //Bir adres listeden silinir (procedure) ve buras� �al���r
  end;
  Refresh;
end;

function TObjectList.RecWherePoint(const RecNo: Integer): TPoint;
begin
  if RecNo>=Count then begin
    Result.x:=-1;Result.y:=-1;
  end else begin
    Result.x:=RecNo mod FColumnCount; //Col
    Result.y:=RecNo div FColumnCount; //Row
  end;
end;

function TObjectList.RecNo(const Row, Col: Integer): Integer;
begin
  Result:=(Row*FColumnCount)+Col;
  if Result>=Count then Result:=-1;
end;

procedure TObjectList.Refresh;
var NewColumnCount:Integer;
begin
  if FAutoCalculateColumnCount then begin
    NewColumnCount:=Round(Sqrt(Count));//+1;
    if FColumnCount<>NewColumnCount then begin
      FColumnCount:=NewColumnCount;
      if FColumnCount<1 then FColumnCount:=1;
    end;
  end;
  if FAutoPack then Pack;
  if Assigned(FRefreshEvent) then FRefreshEvent(Self);
end;

function TObjectList.GETListArray(RecNo: Integer): Pointer;
begin
  if (RecNo<0) or (RecNo>=Count) then Result:=nil
  else Result:=List{$IFDEF OLD_VER}^{$ENDIF}[RecNo];
end;

procedure TObjectList.SETListArray(RecNo: Integer; const Value: Pointer);
begin
  if (RecNo < 0) or (RecNo >= Count) then MessageBox(Application.Handle,
   PChar(Format('Listede 0-%d aras�nda de�erle elemanlara eri�ilebilir',
    [Count,RecNo])),'Hata',MB_ICONERROR)
  else List{$IFDEF OLD_VER}^{$ENDIF}[RecNo]:=Value;
end;

function TObjectList.GETListMatrix(Row, Col: Integer): Pointer;
begin
  Result:=GETListArray(RecNo(Row,Col));
end;

procedure TObjectList.SETListMatrix(Row, Col: Integer;
  const Value: Pointer);
begin
  SETListArray(RecNo(Row,Col),Value);
end;

procedure TObjectList.SETColumnCount(const Value: Integer);
begin
  if not FAutoCalculateColumnCount then begin //AKolonSayisiOtomatikOlsun:=False;
    if Value<1 then MessageBox(Screen.ActiveForm.Handle,'S�tun say�s� 1''den k���k olmaz.','Hata',MB_ICONERROR)
    else begin
      FColumnCount:=Value;
      if FColumnCount<1 then FColumnCount:=1;
      Refresh;
    end;
  end;
end;

procedure TObjectList.SETFAutoCalculateColumnCount(const Value: Boolean);
begin
  FAutoCalculateColumnCount:=Value;
  Refresh;
end;

function TObjectList.GETRowCount: Integer;
begin
  Result:=Count div FColumnCount;
  if (Count mod FColumnCount)>0 then inc(Result);
end;

procedure TObjectList.SETAutoPack(const Value: Boolean);
begin
  FAutoPack := Value;
  if Value then Pack;
end;

function TObjectList.GETObjectArray(RecNo: Integer): TObject;
begin
  if (RecNo<0) or (RecNo>=Count) then Result:=nil
  else Result:=List{$IFDEF OLD_VER}^{$ENDIF}[RecNo];
end;

procedure TObjectList.SETObjectArray(RecNo: Integer; const Value: TObject);
begin
  if (RecNo < 0) or (RecNo >= Count) then MessageBox(Application.Handle,
   PChar(Format('Listede 0-%d aras�nda de�erle elemanlara eri�ilebilir',
    [Count,RecNo])),'Hata',MB_ICONERROR)
  else List{$IFDEF OLD_VER}^{$ENDIF}[RecNo]:=Value;
end;

function TObjectList.GETObjecMatrix(Row, Col: Integer): TObject;
begin
  Result:=GETListArray(RecNo(Row,Col));
end;

procedure TObjectList.SETObjecMatrix(Row, Col: Integer; const Value: TObject);
begin
  SETListArray(RecNo(Row,Col),Value);
end;

{ TTekHucre }

function TTekHucre.DegerAyarla(const Sayi: Byte):Boolean;   //0 siler, x Say�ya ayarlar.
//var i,j,k:Integer; Yed:Byte;  TekHucre:TTekHucre; HucrelerGrubu:THucrelerGrubu;
begin   //Yeni de�er eski de�erin ayn�s� ise i�leme gerek yok
  Result:=(Sayi=_Deger);
  if Result then Exit;
  //olabilen de�erleden biri ve s�n�r i�inde olmal�
  Result:=(Sayi in (_Degerler+[0])) and (Sayi<=Sahip.ABoyut);
  if not Result then Exit//MessageBox(Application.Handle,PChar(Format('Verilen %d de�eri atanam�yor.',[Sayi])),'Hata',MB_ICONERROR)
  else if (_Deger<>0) and (Sayi=0) then begin //De�eri varsa ve silinmesi i�in 0 verilmi�se
    (*Yed:=_Deger; 
    Sifirla; //de�erler s�f�rlan�yor...
{    if Assigned(Sahip.FDegeriVerilenler.Extract(Self)) then //kendisi de�eri verilenlerdeyse oradan s�k�lmeli
     for i:=0 to Gruplar.Count-1 do Gruplar.Add(Self);//Gruplara eklenmeli{}
    for i:=0 to Gruplar.Count-1 do begin
      HucrelerGrubu:=THucrelerGrubu(Gruplar[i]);
      for j:=0 to HucrelerGrubu.AListe.Count-1 do begin
        TekHucre:=TTekHucre(HucrelerGrubu.AListe[j]);
        if Sahip.ADegeriVerilenler.IndexOf(TekHucre)<0 then //<- de�eri elle verilen de�ilse
         TekHucre.SayiEkle(Yed);//H�creye ait k�meye say� eklenir
      end;
    end; //Gruplara say�lar eklendikten sonra k�me i�inden ��kar�lmas� gerekenler ��kar�l�r
    for i:=0 to Gruplar.Count-1 do begin
      HucrelerGrubu:=THucrelerGrubu(Gruplar[i]);
      for j:=0 to HucrelerGrubu.AListe.Count-1 do begin
        TekHucre:=TTekHucre(HucrelerGrubu.AListe[j]);
        if TekHucre._Deger>0 then _Degerler:=_Degerler-[TekHucre._Deger];
        for k:=0 to Sahip.ADegeriVerilenler.Count -1 do begin
          TekHucre:=TTekHucre(Sahip.ADegeriVerilenler[k]);
          if TekHucre.BuGruptamiyim(HucrelerGrubu)then //de�eri verilenle ayn� grupta ise
           if TekHucre._Deger>0 then _Degerler:=_Degerler-[TekHucre._Deger];
        end;
        DegerDegisti;
      end;
    end;
{//        TekHucre:=TTekHucre(FListe[j]);
//        _Degerler:=_Degerler-[TekHucre._Deger];//Gruplardaki di�er say�lar k�meden at�l�yor
//        TekHucre.SayiEkle(Yed); //sayi di�er k�melere ekleniyor
//      end;
     Result:=(_Degerler<>BosKume);
     if not Result then begin
       MessageBox(Application.Handle,'De�er silme i�lemi ba�ar�s�z. Bulmacada hata var.','Hata',MB_ICONERROR);
       DegerAyarla(Yed);
     end else DegerDegisti;
    end;{}      (**)
  end else if (_Deger=0) and (Sayi<>0) then begin //De�eri yoksa ve de�er verilmi�se
    _Deger:=Sayi;
    _Degerler:=[Sayi];  //elle de�eri verilenlerin k�mesi bo� kal�r, hesaplama ile elde edilenlerde say� kal�r
    DegerDegisti;
  end;
end;

function TTekHucre.OkuSatirlar(const SatirNo:Byte):String;
var i,j:Integer;
begin
  Result:='';
  for i:=1 to _Satirlari do begin
    j:=(SatirNo-1)*3+i;
    if j in Degerler then Result:=Result+IntToStr(j)
    else Result:=Result+' '; 
  end;
end;

function TTekHucre.DegerDegisti:Boolean;
var i,j:Integer; TekHucre:TTekHucre; HucrelerGrubu:THucrelerGrubu;
begin
  Result:=False;
  if _Deger=0 then begin
    _Deger:=KumedekiTekKalanSayi(_Degerler);
    Result:=_Deger<>0;
  end;
  Sahip.GruplariIncelenecek(Self);
  if _Deger>0{Result{} then //<- i�inde tek rakam kalm��.. di�erlerinden bu say� ��kar�lmal�d�r
   for i:=0 to Gruplar.Count-1 do begin
     HucrelerGrubu:=THucrelerGrubu(Gruplar[i]);
     for j:=0 to HucrelerGrubu.AListe.Count-1 do begin
       TekHucre:=TTekHucre(HucrelerGrubu.AListe[j]);
          {Self<>TekHucre{}
       if TekHucre._Deger=0 then TekHucre.SayiCikar(_Deger);//Say� gruptaki di�er k�melerden ��kart�l�yor...
     end;
   end;
end;

procedure TTekHucre.DegerYaz(const Sayi: Byte);
begin
  if (_Deger>0) and (Sayi>0) then DegerAyarla(0); //E�er ba�ka bir say� varsa 0 say� �nce silinir
  DegerAyarla(Sayi);//Verilen de�er yerle�tirilir
end;

function TTekHucre.RenkOku:TColor;
var i:Integer;
begin
  Result:=0;
  for i:=0 to Gruplar.Count-1 do      //a xnor b
   Result:=not(not Result xor not THucrelerGrubu(Gruplar.Items[i]).ARenk);
end;

destructor TTekHucre.Destroy;
begin
  Gruplar.Free;
end;

procedure TTekHucre.GrubaGirdi(const Grup:THucrelerGrubu);
var i:Integer;
begin
  i:=Gruplar.IndexOf(Grup);
  if i<0 then Gruplar.Add(Grup);
end;

constructor TTekHucre.HucreOlustur(const Satir,Sutun: Byte;const Sahibi:TDiamond=nil);
begin
  Sahip:=Sahibi;
  Gruplar:=TList.Create;
  Sifirla;
  SayiDene:=0;
  _Satir:=Satir;_Sutun:=Sutun;
  _Satirlari:=0;
  SGen:=0;
  if Assigned(Sahip) then begin
    _Satirlari:=Round(Sqrt(Sahip.Boyut));
    SGen:=Round(Sahip.Boyut/_Satirlari);
  end;
end;

function TTekHucre.SayiOku: String;
begin
  if _Deger>0 then Result:=IntToStr(_Deger)
  else Result:='';
end;

function TTekHucre.KumedekiSayilar: String;
var i:Integer;
begin
  if _Deger=0 then begin
    Result:='';
    for i:=0 to Sahip.ABoyut do if i in _Degerler then Result:=Format('%s,%d',[Result,i]);
    if Result<>'' then Delete(Result,1,1); 
  end else Result:=IntToStr(_Deger);
end;

function TTekHucre.SayiCikar(const Sayi:Byte):Boolean;
//k�meden say� ��kar�l�r...
begin
  Result:=False;
  if Sayi in _Degerler then begin
    _Degerler:=_Degerler-[Sayi];
    Result:=DegerDegisti;
  end;
end;

function TTekHucre.SayiEkle(const Sayi: Byte): Boolean;
//k�meye say� eklenir...
begin
  Result:=not (Sayi in _Degerler);
  //e�er verilmek istenen de�er k�mede yoksa
  //ve de�eri otomatik verilen de�ilse  
  if Result and not(_Degerler<>BosKume) then begin
    if (_Deger<>0) then Result:=DegerAyarla(0)
    else _Degerler:=_Degerler+[Sayi];
    DegerDegisti;
  end;
end;

procedure TTekHucre.Sifirla;
begin
  _Degerler:=[1..Sahip.ABoyut];
  _Deger:=0;
  ADenemeDegeriVerildi:=False;
end;

function TTekHucre.BuGruptamiyim(const HucrelerGrubu: THucrelerGrubu): Boolean;
begin
  Result:=Gruplar.IndexOf(HucrelerGrubu)>=0;
end;

function TTekHucre.DegerUygunmu(const Degeri: Byte): Boolean;
begin
//verilmek istenen de�er uygunmu kontrol edilir...
//mesala 5 de�eri verilirse gruplardan birine 2 de�eri giremeyebilir. 
  Result:=True;
end;

{ THucrelerGrubu }

constructor THucrelerGrubu.Olustur(const Sahibi:TDiamond);
begin
  Sahip:=Sahibi;
  AListe:=TList.Create;
  AListe.Capacity:=Sahibi.ABoyut;
  AHesaplanacakHucreler:=TList.Create;
  AHesaplanacakHucreler.Capacity:=Sahibi.ABoyut;
  ARenk:=clWhite;
end;

destructor THucrelerGrubu.Destroy;
begin
  AListe.Free;
  AHesaplanacakHucreler.Free;
end;

function THucrelerGrubu.DegersizElemanSayisi: Byte;
var i:Integer;
begin
  Result:=0;
  for i:=0 to AListe.Count-1 do
   if TTekHucre(Aliste[i])._Deger=0 then Inc(Result);//De�eri olmayan h�cre say�s�
end;

procedure THucrelerGrubu.Temizle;
begin
  AListe.Clear;
  AListe.Capacity:=Sahip.ABoyut;
end;

procedure THucrelerGrubu.HucreEkle(const TekHucre: TTekHucre);
var i:Integer;
begin
  i:=AListe.IndexOf(TekHucre);
  if i<0 then AListe.Add(TekHucre); //Hucre yoksa grupta eklenir..
  TekHucre.GrubaGirdi(Self); //Guruba eklendi�i h�creye belirtilir..
end;

function THucrelerGrubu.Tara: Boolean;
var i,n:Integer; HucrelerGrubu:THucrelerGrubu;
begin
  if not Sahip.AOtomatikCoz then DegerDegisti:=False;//otomatik ��zmezse False yaps�n
{Bu h�creler k�mesi incelemeye al�nd���ndan de�i�im iptal olur...
B�ylece grupta tekrar de�i�im olursa incelemeye yeniden al�n�r...{} 

{1. teknik olan k�mede tek kalan sayi algoritmas� TTekHucre nesnesi kendi ba��na
halleder...{}
  Result:=Sahip.ATaramaSeviyesi>0; //Tarama Seviyesi 0 ise hi� tarama olmaz
{2. teknik farkl� eleman� bulmay� sa�lar oda tamamland�}
  Result:=Result and FarkliSayiyiBulma; //Tarama Seviyesi 1 ve daha b�y�kse farkl� de�er ta��yan k�medeki say�y� bulan kod �al���r.
  if not Sahip.AOtomatikCoz then begin{otomatik ��z�mde devre d���d�r.
  Sahip bile�en bu metodu kullanmak i�in �nce otomatik ��z �zelli�ini devreden ��kar�r..{}
    i:=1;n:=DegersizElemanSayisi-2{2 eksi�ine kadar inceleme yap�lmal�};
    if Sahip.ATaramaSeviyesi>1 then while (i<n) and not Result do begin//Tarama Seviyesi 1'den b�y�kse
      Result:=KumedenSinirlanmisElemanlariCikar(i); //3. algoritma uygulan�yor...
      Inc(i);
    end;
    if(Sahip.ATaramaSeviyesi>2)then begin//Hala ��z�m yoksa bir sonraki algoritma seviyesine ge�ilir
      i:=0;
      while not Result and(i<Sahip.AGruplar.Count)do begin
        HucrelerGrubu:=Sahip.AGruplar.Items[i];
        if Self<>HucrelerGrubu then
         Result:=DigerKumedenGelenSinirlama(HucrelerGrubu);//B�t�n di�er gruplarla k�yaslanma olur
        Inc(i);
      end;
    end;
  end;
end;

function THucrelerGrubu.FarkliSayiyiBulma: Boolean;
//H�creye uyan say� k�mesinde farkl� bir sayi kal�rsa, o say�y� bulur.
var i,j:Integer; Fark:TDeger; TekHucre,DigerHucre:TTekHucre;
begin //tarama seviyesi >=1'de aktif olur
  Result:=False;
  for i:=0 to AListe.Count-2 do begin
    TekHucre:=TTekHucre(AListe[i]);
    if (TekHucre._Deger>0) then Continue; //Zaten de�eri bulunmu�sa hesaba katma
    Fark:=TekHucre._Degerler;
    for j:=0 to AListe.Count -1 do begin
      DigerHucre:=TTekHucre(AListe[j]);
      if (i=j) or (DigerHucre._Deger>0) then Continue;//kendisi veya de�eri bulunmu� ba�ka bir h�creyse hesaba katma
      Fark:=Fark-DigerHucre._Degerler;
    end;
    j:=KumedekiTekKalanSayi(Fark); //k�menin
    if j>0 then Result:=TekHucre.DegerAyarla(j);
  end;
end;

function THucrelerGrubu.KumedenSinirlanmisElemanlariCikar(
 const incelenecekElemanSayisi: Byte): Boolean;
//Gruptaki h�crelerden, uymayan say�lar ortadan kald�r�l�yor...
var i:Integer; BirlesimKumesi:TDeger; TekHucre:TTekHucre;
  BuGrubuAtla,BirBoyuttaSifiriSay:Boolean;

 function idx_Pos(const Deger:Byte):Integer;
 begin
   Result:=0;
   while (Result<incelenecekElemanSayisi) and (Sahip.idx[Result]<>Deger) do Inc(Result);
   if (Result>=incelenecekElemanSayisi) then Result:=-1;
 end;

 procedure KumeDegeriniSil(const BirlesimKumesi:TDeger;const i:Byte);
 //S�n�rland�rma yapmak gerekti�inde Kume de�eri idx ve i listesi haricinde kalanlardan silinir...
 var j:Integer; Sonuc:TDeger;  Kontrol:Boolean;
 begin
   for j:=0 to AListe.Count-1 do begin
     TekHucre:=AListe[j];
     if (idx_Pos(j)>=0) or (i=j) or (TekHucre._Deger>0) then Continue;
     //Say� grubunun d���ndakilerden ve de�eri belli olmayanlardan say�lar ��kart�l�yor...
     Sonuc:=TekHucre._Degerler-BirlesimKumesi;
     Kontrol:=TekHucre._Degerler<>Sonuc;//De�er �zerinde etki olu�tu�u i�in de�i�im onaylan�r...
     if Kontrol then begin
       TekHucre._Degerler:=Sonuc; //K�me s�n�rland�r�l�r
       TekHucre.DegerDegisti; //De�er de�i�imi onaylan�r
       Result:=True;
     end;
   end;
 end;

begin//tarama seviyesi >=2'de aktif olur
  Result:=False;
  BirBoyuttaSifiriSay:=(incelenecekElemanSayisi>1);
  Sahip.idx_Baslat;
  while Sahip.idx_Sonraki(incelenecekElemanSayisi,AListe.Count-1) do begin //indexler 1'er artt�r�larak incelemeye al�n�yor...
    if not BirBoyuttaSifiriSay and (Sahip.idx[0]=1) then begin
      BirBoyuttaSifiriSay:=True;
      Sahip.idx[0]:=0;
    end;//e�er tek boyutta inceleme varsa 0. (ilk) eleman�n atlanmas� engellenir...
    BuGrubuAtla:=False;
    BirlesimKumesi:=BosKume;
    for i:=0 to incelenecekElemanSayisi-1 do begin
      TekHucre:=AListe[Sahip.idx[i]];
      BuGrubuAtla:=TekHucre._Deger>0;
      if BuGrubuAtla then Break;
      BirlesimKumesi:=BirlesimKumesi+TekHucre._Degerler;//K�meler birle�tiriliyor..
    end;
    if BuGrubuAtla or (KacSayiVar(BirlesimKumesi)>incelenecekElemanSayisi+1) //s�n�rland�rma yap�lam�yorsa veya
     then Continue;//Se�ili say� grubunda de�eri olan hucre varsa o se�ilenler atlan�r..
    for i:=0 to AListe.Count-1 do begin
      if idx_Pos(i)>=0 then Continue; //H�cre zaten inceleme grubunda ise atla
      if BirlesimKumesi=BirlesimKumesi+TTekHucre(AListe[i])._Degerler then
       KumeDegeriniSil(BirlesimKumesi,i); //K�me elemanlar� di�er hucre de�erlerinden silinir...
    end;
  end;
end;

function THucrelerGrubu.DigerKumedenGelenSinirlama(const HucrelerGrubu:THucrelerGrubu):Boolean;
var
  i,j:Integer; TekHucre:TTekHucre; OrtakKume:TDeger;
  OrtakHucreDisindaYok:Boolean;//Ortak olan say�, ortak h�crelerin haricindeki h�crelerde varm� yokmu
begin//Tarama seviyesi >=3'te aktif olur
{Ortak h�crelerin (say�s� 1'den fazla olmal�) alaca�� de�erlerin,birle�im k�mesinde bulunan say�sal de�erler incelenmelidir}
  Result:=False;
  AHesaplanacakHucreler.Clear;
  OrtakKume:=BosKume;
  for i:=0 to AListe.Count-1 do begin //...buray� h�zland�rmak gerek
    TekHucre:=AListe[i];
    if TekHucre._Deger=0 then //de�eri olmayan h�cre incelenir...
     if HucrelerGrubu.AListe.IndexOf(TekHucre)>=0 then begin
       AHesaplanacakHucreler.Add(TekHucre);
       OrtakKume:=OrtakKume+TekHucre._Degerler;//sadece bu say�lar i�in yoklama olacak
    end;
  end;  //hesaplanacak h�crelerin say�s� 1 olsa zaten 1. algoritma o i�i halleder..
  if(AHesaplanacakHucreler.Count<2)or(OrtakKume=BosKume)then Exit;//inceleme gerekli ise
  for i:=1 to Sahip.ABoyut do if i in OrtakKume then begin // say�lar denetleniyor
    OrtakHucreDisindaYok:=True;
    for j:=0 to AListe.Count-1 do begin//say�lar h�crelerden denetleniyor
      TekHucre:=AListe[j];          
      if(TekHucre._Deger=0)and(AHesaplanacakHucreler.IndexOf(TekHucre)<0)then begin //H�cre ortak de�ilse
        OrtakHucreDisindaYok:=not(i in TekHucre._Degerler);//e�er o say� varsa BendeYok olumsuz de�er almal�
        if not OrtakHucreDisindaYok then Break;//Say� d��ar�da da ��karsa onu ge�
      end;
    end;
    if OrtakHucreDisindaYok then//Bu say� di�er grupta ortak olmayan elemanlardan at�lmal�
    for j:=0 to HucrelerGrubu.AListe.Count-1 do begin
      TekHucre:=HucrelerGrubu.AListe[j];
      if AHesaplanacakHucreler.IndexOf(TekHucre)<0 then //ortak olmayan h�creden
       Result:=Result or TTekHucre(HucrelerGrubu.AListe[j]).SayiCikar(i);//bu sayi ��kar
    end else begin
      OrtakHucreDisindaYok:=True;
      for j:=0 to HucrelerGrubu.AListe.Count-1 do begin//say�lar h�crelerden denetleniyor
        TekHucre:=HucrelerGrubu.AListe[j];
        if(TekHucre._Deger=0)and(AHesaplanacakHucreler.IndexOf(TekHucre)<0)then begin //H�cre ortak de�ilse
          OrtakHucreDisindaYok:=not(i in TekHucre._Degerler);//e�er o say� varsa BendeYok olumsuz de�er almal�
          if not OrtakHucreDisindaYok then Break;//Say� d��ar�da da varsa onu ge�
        end;
      end;
      if OrtakHucreDisindaYok then//Bu say� bu gurupta ortak olmayan h�crelerden at�lmal�
      for j:=0 to AListe.Count-1 do begin
        TekHucre:=AListe[j];
        if AHesaplanacakHucreler.IndexOf(TekHucre)<0 then //ortak olmayan h�creden
         Result:=Result or TTekHucre(AListe[j]).SayiCikar(i);//bu sayi ��kar
      end;
    end;
  end;
end;

{ TDiamond }

procedure TDiamond.idx_Baslat;
var i:Integer;
begin
  for i:=0 to ABoyut-1 do idx[i]:=0;
  Secili_idxler:=[0];
end;

function TDiamond.idx_Art(const KacSeciliEleman,KacToplamEleman: Byte): Boolean;
//Dizide soldan art�� yap�l�r...
var i:Integer;
begin
  Result:=False;
  i:=0;
  repeat
    Inc(idx[i]);
    if idx[i]<=KacToplamEleman then Break //eleman say� s�n�r� kontrol�
    else begin
      idx[i]:=0;
      Inc(i);
      if (i>=KacSeciliEleman) then Exit; //Secili eleman say� s�n�r� a�arsa (for boyut say�s�)
    end;
  until False;
  Result:=True;
end;

function TDiamond.idx_Sonraki(const KacSeciliEleman,KacToplamEleman:Byte): Boolean;
var i:Integer; Birak:Boolean;
begin
  Result:=False;
  repeat
    Birak:=True;
    if not idx_Art(KacSeciliEleman,KacToplamEleman) then Exit; //De�erler bitti ve artam�yor ise bitir
    Secili_idxler:=BosKume;
    for i:=0 to KacSeciliEleman-1 do begin
      if idx[i] in Secili_idxler then begin //index no ba�kas�yla ayn� ise bir sonraki index'e ge�ilir
        Birak:=False;
        Break;
      end else Include(Secili_idxler,idx[i]);//aksi halde K�meye girer...
    end;
  until Birak;
  Result:=True;
end;

procedure TDiamond.YazBoyut(const Deger:Byte);
begin
  if ABoyut<>Deger then BoyutAyarla(Deger);
end;

procedure TDiamond.YAZTaramaSeviyesi(const Deger:Byte);
var i:Integer;
begin
  if Deger<>ATaramaSeviyesi then begin
    if Deger>ATaramaSeviyesi then
     for i:=0 to AGruplar.Count-1 do//b�t�n gruplar tekrar incelenecek
      THucrelerGrubu(AGruplar.Items[i]).DegerDegisti:=True;
    ATaramaSeviyesi:=Deger;
  end; 
end;

function TDiamond.DegerOku(Satir, Sutun: Byte): Byte;
begin
  Result:=TTekHucre(AHucre[Satir,Sutun])._Deger;
end;

function TDiamond.HucreRengiOku(Satir,Sutun:Byte):TColor;
begin
  Result:=TTekHucre(AHucre[Satir,Sutun]).Renk;
end;

procedure TDiamond.DegerYaz(Satir, Sutun, Degeri: Byte);
var TekHucre:TTekHucre; i:Integer; //DegerlerDolu:Boolean;
begin
  if (Satir>=ABoyut) or (Sutun>=ABoyut) or (Degeri>ABoyut) then
   MessageBox(Application.Handle,
    PChar(Format('(%d,%d)=%d de�eri s�n�rlar d���nda kald���ndan atanam�yor.',
     [Satir,Sutun,Degeri])),'Hata',MB_ICONERROR)
  else begin
    TekHucre:=AHucre[Satir,Sutun];
    if (TekHucre._Deger>0) and (Degeri>0) and (TekHucre._Deger<>Degeri) then begin
      DegerYaz(Satir,Sutun,0);//�nce de�er silinir
      DegerYaz(Satir,Sutun,Degeri);//sonra yeni de�er yaz�l�r
    end else if Degeri=0 then begin
      //MessageBox(Application.Handle,'De�er silme i�lemi bu versiyonda yoktur...','Uyar�',MB_ICONWARNING);
      i:=ADegeriVerilenler.IndexOf(TekHucre);
      if (i>=0) then begin
        ADegeriVerilenler.Exchange(i,ADegeriVerilenler.Count-1);//Silinecek eleman sona at�l�r..
        GeriAl;//i�lem bir geri al�n�rarak son de�er silinir
      end;
    end else begin   //s�f�r de�ilse yeni de�eri
      if (TekHucre._Deger{=0'd�r}<>Degeri) and TekHucre.DegerUygunmu(Degeri) and TekHucre.DegerAyarla(Degeri) then begin//de�er yaz�l�yor...
        if ADegeriVerilenler.IndexOf(TekHucre)<0 then ADegeriVerilenler.Add(TekHucre);//inceleme du��ndaki listeye al�nd�
        for i:=0 to TekHucre.Gruplar.Count-1 do   //h�cre incelenmemek i�in gruplardan ��kart�l�yor...
          THucrelerGrubu(TekHucre.Gruplar[i]).AListe.Extract(TekHucre);//H�cre inceleme grubundan ��kart�l�r...
      end;
    end;
    DegerDegisti;
  end;
  if AOtomatikCoz then Tara;
end;

function TDiamond.BoyutAyarla(const Boyutu: Byte):Boolean;
var Satir,Sutun,i:Byte; n:Integer;
begin
  i:=Trunc(Sqrt(Boyutu));
  Result:=((i*i)=Boyutu);
  if Result then begin
    ABoyut:=Boyutu;
    SetLength(idx,Boyutu);//i dinamik dizisi boyuta g�re ayarlan�yor..
    Temizle;
    n:=Sqr(Boyutu);   //h�cre say�s�
    AHucre.Capacity:=n;
    AGruplar.Capacity:=Boyutu*3;
    ADegeriVerilenler.Capacity:=AGruplar.Capacity; //Bellekte ba�lang��ta a��lacak yer i�in miktar verilir...
    AHucre.ColumnCount:=Boyutu;
    DenemeyiBaslangicaAl;
    for i:=0 to n-1 do begin
      Sutun:=i mod Boyutu;
      Satir:=i div Boyutu;
      with TTekHucre(AHucre.Items[AHucre.Add(TTekHucre.HucreOlustur(Satir,Sutun,Self))]) do begin
        SayiDene:=0;//<-H�creler olu�turulup ba�lang�� de�eri veriliyor
        ASiraNo:=i+1;//<-
      end;
    end;
    GruplariOlustur;
  end else MessageBox(Application.Handle,PChar(Format('Bulmaca boyutu "%d" olamaz...',[Boyutu])),'Hata',MB_ICONERROR);
end;

function TDiamond.BulmacaDogrumu: Boolean;
var i,j,k:Integer; Kume:TDeger; HucrelerGrubu:THucrelerGrubu; TekHucre:TTekHucre;
begin
  Result:=False;
  for i:=0 to AGruplar.Count-1 do begin
    Kume:=BosKume; HucrelerGrubu:=AGruplar.Items[i];
    for j:=0 to HucrelerGrubu.AListe.Count-1 do begin
      Kume:=Kume+[TTekHucre(HucrelerGrubu.AListe[j])._Deger];
      for k:=0 to ADegeriVerilenler.Count-1 do begin //listeden s�k�len h�crelerde incelenmelidir...
        TekHucre:=ADegeriVerilenler[k];
        if TekHucre.BuGruptamiyim(HucrelerGrubu) then //O gruba ait h�creyse k�meye say�s� al�n�r...
         Kume:=Kume+[TekHucre._Deger];
      end;
    end;
    Result:=(Kume=[1..ABoyut]);
    if not Result then Break;
  end;
end;

function TDiamond.BulmacaDolumu: Boolean;
var i:Integer;
begin
  Result:=False;
  for i:=0 to AHucre.Count-1 do
   if (TTekHucre(AHucre.Items[i])._Deger=0) then Exit;
  Result:=True;
end;

procedure TDiamond.GeriAl(KacTane:Integer=1); //Ka� say� verme i�lemi geri al�n�yor...
var i:Integer;
  DegerlerListesi:PHucreDegerleri;
begin
  if ADegeriVerilenler.Count>0 then begin
    if KacTane<0 then KacTane:=0;//S�n�r a��lmamas� i�in kontrol
    KacTane:=(ADegeriVerilenler.Count-1)-KacTane;
    if Kactane<0 then YeniBulmacaOlustur(False) else begin//s�f�r ise hesaplanan de�erler silinir
      GetMem(DegerlerListesi,(KacTane+1)*SizeOf(THucreDegeri));
      for i:=0 to KacTane do //KacTane de verilen kadar eksi�i listeye al�n�r...
       with TTekHucre(ADegeriVerilenler.Items[i]) do begin
         DegerlerListesi^[i].Satir:=_Satir;
         DegerlerListesi^[i].Sutun:=_Sutun;
         DegerlerListesi^[i].Deger:=_Deger;
      end;
      YeniBulmacaOlustur(False); //T�mden silinir ve son girilen de�er hari� tekrar de�erler girilir...
      for i:=0 to KacTane do with DegerlerListesi^[i] do DegerYaz(Satir,Sutun,Deger);
      FreeMem(DegerlerListesi);
    end;
  end else YeniBulmacaOlustur(False); 
{  if ADegeriVerilenler.Count>0 then begin
    if KacTane<0 then KacTane:=0;//S�n�r a��lmamas� i�in kontrol
    KacTane:=(ADegeriVerilenler.Count-1)-KacTane;
    if Kactane<0 then YeniBulmacaOlustur(False) else begin//s�f�r ise hesaplanan de�erler silinir
      AGeciciListe.Clear;
      for k:=0 to KacTane do //KacTane de verilen kadar eksi�i listeye al�n�r...
       with TTekHucre(ADegeriVerilenler.Items[k]) do
        AGeciciListe.Add(Format('%d,%d=%d',[_Satir,_Sutun,_Deger]));

      YeniBulmacaOlustur(False); //T�mden silinir ve son girilen de�er hari� tekrar de�erler girilir...

      for k:=0 to AGeciciListe.Count-1 do begin
        St:=AGeciciListe[k];
        i:=Pos(',',St);    //2
        j:=Pos('=',St);    //4
        Satir:=StrToIntDef(Copy(St,1,i-1),-1);
        Sutun:=StrToIntDef(Copy(St,i+1,j-i-1),-1);
        Deger:=StrToIntDef(Copy(St,j+1,Length(St)-j),-1);
        DegerYaz(Satir,Sutun,Deger);
      end;
    end;
  end else YeniBulmacaOlustur(False);{}
end;

function TDiamond.GruplariOlustur: Boolean;
var Satir,Sutun,Kare,KareBoyu:Byte; HucrelerGurubu:THucrelerGrubu;
 function SatirGrupNo(const No:Byte):Byte;//0..8 arasi
 begin
   Result:=No;
 end;
 function SutunGrupNo(const No:Byte):Byte;//9..17 arasi
 begin
   Result:=No+9;
 end;
 function KareGrupNo(const No:Byte):Byte;//18..26 arasi
 begin
   Result:=No+18;
 end;
begin
  Result:=True;
  try
    for Satir:=1 to 27 do begin
      HucrelerGurubu:=THucrelerGrubu.Olustur(Self);
      HucrelerGurubu.ASiraNo:=Satir;
      HucrelerGurubu.DegerDegisti:=False;
      AGruplar.Add(HucrelerGurubu);//Gruplar olu�turuluyor
      if Satir>=19 then HucrelerGurubu.Renk:=(Satir*4)else HucrelerGurubu.Renk:=clWhite;
    end;
    KareBoyu:=Trunc(Sqrt(ABoyut));
    for Satir:=0 to ABoyut-1 do for Sutun:=0 to ABoyut-1 do begin
      Kare:=(Satir div KareBoyu)*KareBoyu+(Sutun div KareBoyu);
      THucrelerGrubu(AGruplar.Items[SatirGrupNo(Satir)]).HucreEkle(AHucre[Satir,Sutun]);
      THucrelerGrubu(AGruplar.Items[SutunGrupNo(Sutun)]).HucreEkle(AHucre[Satir,Sutun]);
      THucrelerGrubu(AGruplar.Items[KareGrupNo(Kare)]).HucreEkle(AHucre[Satir,Sutun]);
    end;
  except
    MessageBox(Application.Handle,'Gruplar olu�turulurken bir hata olu�tu.','Hata',MB_ICONERROR);
    Result:=False;
  end;
end;

constructor TDiamond.Create;
begin
  AHucre:=TObjectList.Create;
  AHucre.AutoCalculateColumnCount:=False;
  AHucre.AutoPack:=False;
  AGruplar:=TObjectList.Create;
  ADegeriVerilenler:=TList.Create;
  AGeciciListe:=TStringList.Create;
  AOtomatikCoz:=True;
  AHizliCoz:=False;
  ADenemeyiDurdur:=False;
  AIncelenenNesneOlayi:=nil;
  Denenenler:=TList.Create;
  ATaramaSeviyesi:=1;
  BoyutAyarla(__Boyut);
end;

destructor TDiamond.Destroy;
begin
  Temizle;
  ADegeriVerilenler.Free;
  AGruplar.Free;
  AHucre.Free;
  Denenenler.Free;
  SetLength(idx,0);idx:=nil;//i dinamik dizisi listeden at�l�yor...
end;

procedure TDiamond.Temizle;
var i:Integer; TekHucre:TTekHucre; HucrelerGrubu:THucrelerGrubu;
begin
  for i:=0 to AHucre.Count-1 do begin
    TekHucre:=AHucre.Items[i];
    if Assigned(TekHucre) then TekHucre.Destroy;
    AHucre.List{$IFDEF OLD_VER}^{$ENDIF}[i]:=nil;
  end; AHucre.Pack;
  for i:=0 to AGruplar.Count-1 do begin
    HucrelerGrubu:=AGruplar.Items[i];
    if Assigned(HucrelerGrubu) then HucrelerGrubu.Free;
    AGruplar.List{$IFDEF OLD_VER}^{$ENDIF}[i]:=nil;
  end; AGruplar.Pack; //listeler temizlenir...
  AHucre.Clear;AHucre.Capacity:=ABoyut*ABoyut;
  AGruplar.Clear;AGruplar.Capacity:=ABoyut*3;
  ADegeriVerilenler.Clear;ADegeriVerilenler.Capacity:=AGruplar.Capacity;
end;

procedure TDiamond.OtomatikCozYaz(const Deger: Boolean);
begin
  if AOtomatikCoz<>Deger then begin
    AOtomatikCoz := Deger;
    if AOtomatikCoz then Tara;
  end;
end;

procedure TDiamond.GruplariIncelenecek(const TekHucre: TTekHucre);
var i:Integer;
begin
  for i:=0 to TekHucre.Gruplar.Count-1 do
   THucrelerGrubu(TekHucre.Gruplar[i]).DegerDegisti:=True;//Gruplarda de�er de�i�imi oldu
end;

procedure TDiamond.DegerDegisti;
begin
end;

function TDiamond.Coz:TBulmacaCozumSonucu;
var Yed:Boolean;
begin
  Yed:=AOtomatikCoz;
  AOtomatikCoz:=False;//Otomatik ��z �zelli�i false olaraka tara �al���rsa tam tarama olur
  Tara;
  AOtomatikCoz:=Yed;
  if BulmacaDolumu then
   if BulmacaDogrumu then Result:=bcsCozuldu
   else Result:=bcsYanlisCozuldu
  else Result:=bcsDolmadi;
end;

procedure TDiamond.DenemeSayilariniTekrarYaz(const KacElemanHaric:Integer=0);//son deneme hari� hepsi yaz�l�r
var i:Integer;             //denenen say�lardan ka� tanesi yaz�lmayacak
begin
  GeriAl(0);//De�eri orjinal verilenler yaz�l�r
  //bulmaca dolmadan �nceki son haline tekrar d�ner...
  //---
  for i:=0 to AHucre.Count-1 do
   with TTekHucre(AHucre.Items[i]) do
    ADenemeDegeriVerildi:=_Deger=0;//De�eri deneme olmayanlar i�aretlenir...
  //---
  for i:=0 to Denenenler.Count-1-KacElemanHaric do
   with TTekHucre(Denenenler[i]) do DegerAyarla(SayiDene);
  Tara;//Gereksiz de�erler silinir...
end;

function TDiamond.Dene: Boolean;
var
  TekHucre:TTekHucre;//listede bu h�creden sonraki h�cre bulunur
  OtomatikCoz:Boolean;//Otomatik ��zme �zelli�i devre d��� b�rak�l�p, �yle deneme yan�lma olmal�d�r
  i:Integer;

 function SonrakiHucre(const Hucre:TTekHucre):TTekHucre;
 var i:Integer; TekHucre:TTekHucre;
 begin
   Result:=nil;
   i:=AHucre.IndexOf(Hucre);
   repeat
     inc(i);//bir sonraki de�er
     if i>=AHucre.Count then Exit; //s�n�r ge�mi�se bitir
     TekHucre:=AHucre.Items[i];
     if TekHucre._Deger=0 then Break;
   until False;
   Result:=TekHucre;
 end;

 function SonrakiDegeri(const TekHucre:TTekHucre):Integer;//H�crede denenen sayilardan bir sonrakini bulur
 {=-1 ise ��z�m olmaz geri git denemeyi de�i�tir
  =0 ise say�lar bitti sonrakine ge�
  >0 ise o say� denenecek}
 begin
   if Assigned(TekHucre) then begin
     Result:=-1;
     if (TekHucre._Degerler=BosKume) then Exit;//Bo� k�mesi varsa bu de�er olmaz
     Result:=TekHucre.SayiDene;
     while Result<ABoyut do begin //
       Inc(Result);//Deneme say�s� 1 artt�r�l�r.Ba�ta olursa son denenmi� say� ge�ilir..
       //de�eri olmamas� gerekir
       if (TekHucre._Deger=0) and (Result in TekHucre._Degerler) and TekHucre.DegerUygunmu(Result) then Exit;
     end;
   end;
   Result:=0;//Uygun deger ��kmad�...
 end;
begin
  Result:=False;
  OtomatikCoz:=AOtomatikCoz;
  AOtomatikCoz:=False;
  ADenemeyiDurdur:=False;//Ba�larken deneme durdurulmamal�d�r...
  TekHucre:=LastElement(Denenenler);//Son de�erelde edilir
  DenemeSayilariniTekrarYaz(1);//Son de�er haricindeki denemeler yaz�l�r
  repeat
    repeat
      i:=SonrakiDegeri(TekHucre);
      if (i=0) then begin
        TekHucre:=SonrakiHucre(TekHucre);
        if Assigned(TekHucre) then TekHucre.SayiDene:=0;//Sonraki h�creye gidince deneme ba�tan yap�lmal�
      end;
      if not Assigned(TekHucre) then i:=-1;//Sonraki h�cre bulunam�yor
    until (i<>0){ or FDenemeyiDurdur{};{i,-1 ise de�er verilemez,0 ise de�erler bitmi�,,>0 ise say� denemesi yap�lacak}
    if Assigned(AIncelenenNesneOlayi) and Assigned(TekHucre) then AIncelenenNesneOlayi(Self,TekHucre.SiraNo,AHucre.Count);
    repeat
      //if i=0 then else
      if i<0 then begin  //dana kuyru�unun koptu�u yer
        if not Assigned(TekHucre) then TekHucre:=LastElement(Denenenler);
        repeat
          if not Assigned(TekHucre){Denenenler.Count=0{} then begin
            DenemeyiBaslangicaAl;//Deneme say�lar� ba�lang�� de�erlerine al�n�yor
            Exit;//Deneme art�k bitmi�tir, olamaz
          end;
          i:=SonrakiDegeri(TekHucre);
          if i<=0 then begin
            TekHucre:=Pop(Denenenler);//Son h�cre ��kar�l�r
            DenemeSayilariniTekrarYaz;//denemede hesaplanan say�lar, tekrar yaz�l�r...
          end;
        until (i<>0);
        Break;
      end else begin
        TekHucre.SayiDene:=i;
        if TekHucre.DegerAyarla(i) then begin //i>0 ise gelir ve de�er ayarlan�rsa �al���r
          Denenenler.Add(TekHucre);//Denemeye al�nd��� i�in deneme listesine eklenir
          case Coz of
            bcsDolmadi:Break;
            bcsYanlisCozuldu:begin i:=-1;Continue;end;//yanl�� ��z�m geriye d�nd�r�lmeli
            bcsCozuldu:begin
              AOtomatikCoz:=OtomatikCoz;
              //{��z�l�nce ba�lama yeri son i�lem yerinde kal�r}
              Result:=True;
              Exit;
            end;
          end;
        end;
      end;
    until ADenemeyiDurdur;
  until ADenemeyiDurdur;
  AOtomatikCoz:=OtomatikCoz;
  if not ADenemeyiDurdur then Result:=True;
end;

function TDiamond.DenemeyiGeriAtlat(KacAdimGeri:Integer=1):Integer;
var i:Integer; TekHucre:TTekHucre; HucreSil:Boolean;
begin
  GeriAl(0);//Son i�lem geri al�n�r.
  Result:=0;
  while (KacAdimGeri>0) and (Denenenler.Count>0)do begin
    TekHucre:=LastElement(Denenenler);
    HucreSil:=True;
    for i:=TekHucre.SayiDene-1 downto 1 do if i in TekHucre._Degerler then begin
      TekHucre.SayiDene:=i;
      Dec(KacAdimGeri);Inc(Result);
      HucreSil:=False;
      Break;
    end;
    if HucreSil then Pop(Denenenler);
  end;
  DenemeSayilariniTekrarYaz; 
end;

procedure TDiamond.DenemeyiBitir;
begin
  ADenemeyiDurdur:=True;
end;

procedure TDiamond.DenemeyiBaslangicaAl;//Deneme yan�lma i�lemini en ba�a sarar...
var i:Integer;
begin
//  for i:=0 to Denenenler.Count-1 do TTekHucre(Denenenler[i]).SayiDene:=0;
  for i:=0 to AHucre.Count-1 do TTekHucre(AHucre.Items[i]).SayiDene:=0;
  Denenenler.Clear;
  Denenenler.Capacity:=AHucre.Capacity;//Bellekten yer ay�rma i�lemi
end;

procedure TDiamond.DosyadanOku(const DosyaAdi: TFileName);
var Dosya:TextFile; St:String; i,j,Satir,Sutun,Deger:Integer;
begin
  AssignFile(Dosya,DosyaAdi);{$I-}Reset(Dosya);{I+}
  if IOResult=0 then begin
    YeniBulmacaOlustur;
    while not Eof(Dosya) do begin
      Readln(Dosya,St);  //2,3=6    (5)
      i:=Pos(',',St);    //2
      j:=Pos('=',St);    //4
      Satir:=StrToIntDef(Copy(St,1,i-1),-1);
      Sutun:=StrToIntDef(Copy(St,i+1,j-i-1),-1);
      Deger:=StrToIntDef(Copy(St,j+1,Length(St)-j),-1);
      DegerYaz(Satir-1,Sutun-1,Deger);
    end;
    CloseFile(Dosya);
    if AOtomatikCoz then Tara;
  end else MessageBox(Application.Handle,
   PChar(Format('"%s dosyasi okunam�yor."',[DosyaAdi])),'Hata',
    MB_ICONERROR);
end;

procedure TDiamond.DosyayaKaydet(const DosyaAdi:TFileName);
var i:Integer; Dosya:TextFile;
begin
  AssignFile(Dosya,DosyaAdi);{$I-}Rewrite(Dosya);{I+}
  if IOResult=0 then begin
    for i:=0 to ADegeriVerilenler.Count-1 do
     with TTekHucre(ADegeriVerilenler.Items[i]) do
      Writeln(Dosya,_Satir+1,',',_Sutun+1,'=',_Deger);
    CloseFile(Dosya);
  end else MessageBox(Application.Handle,
   PChar(Format('"%s dosyasi olu�turulam�yor."',[DosyaAdi])),'Hata',
    MB_ICONERROR);
end;

procedure TDiamond.Tara;
var i:Integer; Degisti:Boolean; HucrelerGrubu:THucrelerGrubu;
begin
  repeat
    Degisti:=False;
    for i:=0 to AGruplar.Count-1 do begin             //T�m gruplar ��z�m i�in teker teker taran�r...
      HucrelerGrubu:=AGruplar.Items[i];
      if not AHizliCoz or HucrelerGrubu.DegerDegisti then begin//H�zl� ��z�m True olursa sadece de�eri de�i�en h�cre gruplar� ��z�lmeye �al���l�r.
//        if not AOtomatikCoz and Assigned(AIncelenenNesneOlayi) then AIncelenenNesneOlayi(Self,HucrelerGrubu.ASiraNo,AHucre.Count);
        Degisti:=Degisti or HucrelerGrubu.Tara; //taramada hi� de�i�iklik olmazsa
      end;
    end;
    if not Degisti and not AOtomatikCoz then for i:=0 to AGruplar.Count-1 do begin
      Degisti:=Degisti or THucrelerGrubu(AGruplar.Items[i]).DegerDegisti;
      //De�eri sonradan de�i�tirilmi� grup varsa o zaman tarama tekrar yap�lmal�
      if Degisti then Break;//De�i�en varsa d�ng� k�r�l�r tekrar tarama olur.
    end;
  until not Degisti;                                            //d�ng� biter
end;

procedure TDiamond.YeniBulmacaOlustur(const DenemeSayilariniSil:Boolean=True);
var TekHucre:TTekHucre; HucrelerGrubu:THucrelerGrubu; i,j:Integer;
begin
  if DenemeSayilariniSil then DenemeyiBaslangicaAl;//deneme yan�lma i�lemi i�in ba�lang�� de�erleri
  for i:=0 to ADegeriVerilenler.Count-1 do begin //ilk de�eri verilenler gruplara yerle�tiriliyor
    TekHucre:=ADegeriVerilenler[i];
    for j:=0 to TekHucre.Gruplar.Count-1 do begin
      HucrelerGrubu:=THucrelerGrubu(TekHucre.Gruplar[j]);
      HucrelerGrubu.DegerDegisti:=False;
      if HucrelerGrubu.AListe.IndexOf(TekHucre)<0 then
       HucrelerGrubu.AListe.Add(TekHucre); //H�cre, ait oldu�u gruplara yerle�tiriliyor...
    end;
  end;
  for i:=0 to AHucre.Count-1 do with TTekHucre(AHucre.Items[i]) do begin
    Sifirla; //De�erleri s�f�rlan�yor...
    //if DenemeSayilariniSil then SayiDene:=0;//Deneme yan�lma y�ntemi s�f�rlan�yor..
  end;
  ADegeriVerilenler.Clear;
  ADegeriVerilenler.Capacity:=AGruplar.Capacity;//Bellekte yer ay�rma i�lemi i�in topluca bir ilk de�er atamas�
end;

function TDiamond.HucreSayisiOku(Satir, Sutun: Byte): String;
begin
  Result:=TTekHucre(AHucre[Satir,Sutun]).SayiOku;
end;

function TDiamond.HucreSayilariOku(Satir, Sutun: Byte): String;
begin
  Result:=TTekHucre(AHucre[Satir,Sutun]).KumedekiSayilar;
end;

function TDiamond.DegeriDisaridanmiVerildi(const TekHucre: TTekHucre): Boolean;
begin
  Result:=ADegeriVerilenler.IndexOf(TekHucre)>=0;
end;

function TDiamond.DegeriVerilenmiOku(Satir, Sutun: Byte): Boolean;
begin
  Result:=DegeriDisaridanmiVerildi(AHucre[Satir,Sutun]);
end;

function TDiamond.DegeriDenenenmiOku(Satir,Sutun:Byte):Boolean;
begin
  Result:=TTekHucre(AHucre[Satir,Sutun]).ADenemeDegeriVerildi;
end;

function TDiamond.KacTaneDegerGirildiOku: Byte;
begin
  Result:=ADegeriVerilenler.Count;
end;

end.
