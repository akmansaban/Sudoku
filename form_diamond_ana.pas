unit form_diamond_ana;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Math, Grids, ActnList, Menus, ShellAPI, AppEvnts, ComCtrls,
  DiamondClasses, ExtCtrls, Buttons;

type
  TFormDiamondAna = class(TForm)
    Otomatik: TAction;
    Otomatikz1: TMenuItem;
    DosyaAc: TOpenDialog;
    DosyaKaydet: TSaveDialog;
    FarkliKaydet: TAction;
    Sayilar: TStringGrid;
    ActionList1: TActionList;
    Kapat: TAction;
    DegerVer: TAction;
    Yukle: TAction;
    Kaydet: TAction;
    Hesapla: TAction;
    YardimciMenu: TPopupMenu;
    DeerVer1: TMenuItem;
    N1: TMenuItem;
    Hesapla1: TMenuItem;
    Kaydet1: TMenuItem;
    Ykle1: TMenuItem;
    N3: TMenuItem;
    DeerVer2: TMenuItem;
    YeniBulmacaOlustur: TAction;
    Temizle1: TMenuItem;
    FarkliKaydet1: TMenuItem;
    OlanDegerler: TAction;
    incele: TAction;
    N6: TMenuItem;
    Deerlerincele1: TMenuItem;
    OlanDeerler1: TMenuItem;
    Kontrol: TAction;
    KontrolEt1: TMenuItem;
    TekrarYukle: TAction;
    TekrarYkle1: TMenuItem;
    Hakkinda: TAction;
    Hakknda1: TMenuItem;
    N4: TMenuItem;
    GeriAl: TAction;
    GeriAl1: TMenuItem;
    DenemeYanilma: TAction;
    DenemeYanlmailez1: TMenuItem;
    HesaplananDegerleriiptalEt: TAction;
    HesaplananDeerleriptalEt1: TMenuItem;
    Bilgi: TStatusBar;
    SonDenemeTekrari: TAction;
    SonDenemeyiTekrarYap1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Grup: TScrollBox;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SeviyeAyari: TTrackBar;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    DenemeyiDurdur: TAction;
    BitBtn17: TBitBtn;
    HizliCoz: TAction;
    N2: TMenuItem;
    Hzlz1: TMenuItem;
    CheckBox2: TCheckBox;
    Seviye1: TMenuItem;
    ZayifSeviye: TAction;
    EtkisizSeviye: TAction;
    OrtaSeviye: TAction;
    GucluSeviye: TAction;
    Etkisiz1: TMenuItem;
    Zayf1: TMenuItem;
    Gl1: TMenuItem;
    OrtaSeviye1: TMenuItem;
    YardimBilgileri: TAction;
    Yardm1: TMenuItem;
    YardimBilgisi: TMemo;
    BulmacaOlustur: TAction;
    BulmacaOlutur1: TMenuItem;
    GereksizDegerleriSil: TAction;
    N5: TMenuItem;
    GereksizleriSil1: TMenuItem;
    KacTaneDegerGirildi: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SayilarDblClick(Sender: TObject);
    procedure SayilarDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure KapatExecute(Sender: TObject);
    procedure DegerVerExecute(Sender: TObject);
    procedure KaydetExecute(Sender: TObject);
    procedure FarkliKaydetExecute(Sender: TObject);
    procedure YukleExecute(Sender: TObject);
    procedure HesaplaExecute(Sender: TObject);
    procedure YeniBulmacaOlusturExecute(Sender: TObject);
    procedure SayilarClick(Sender: TObject);
    procedure OtomatikExecute(Sender: TObject);
    procedure OlanDegerlerExecute(Sender: TObject);
    procedure inceleExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure YardimKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KontrolExecute(Sender: TObject);
    procedure TekrarYukleExecute(Sender: TObject);
    procedure HakkindaExecute(Sender: TObject);
    procedure GeriAlExecute(Sender: TObject);
    procedure DenemeYanilmaExecute(Sender: TObject);
    procedure HesaplananDegerleriiptalEtExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure YardimciMenuChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure SonDenemeTekrariExecute(Sender: TObject);
    procedure SeviyeAyariChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure ApplicationEvents1ShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure DenemeyiDurdurExecute(Sender: TObject);
    procedure HizliCozExecute(Sender: TObject);
    procedure EtkisizSeviyeExecute(Sender: TObject);
    procedure ZayifSeviyeExecute(Sender: TObject);
    procedure OrtaSeviyeExecute(Sender: TObject);
    procedure GucluSeviyeExecute(Sender: TObject);
    procedure YardimBilgileriExecute(Sender: TObject);
    procedure YardimClose(Sender: TObject; var Action: TCloseAction);
    procedure YardimResize(Sender: TObject);
    procedure BulmacaOlusturExecute(Sender: TObject);
    procedure GereksizDegerleriSilExecute(Sender: TObject);
    procedure KacTaneDegerGirildiExecute(Sender: TObject);
  private
    { Private declarations }
    S:String;
    Zaman:LongWord;
    procedure DosyadanOku(const DosyaAdi:String);
    procedure WMDROPFILES(var TheMessage: TWMDROPFILES);message WM_DROPFILES;
    procedure SayilariYaz;
    procedure Durum(const Sender:TObject;const SiraNo,ToplamSayi:Byte);
    function DegerOku(Satir, Sutun: Integer): String;
    procedure DegerYaz(Satir, Sutun: Integer; const Sayi: String);
    procedure Tazele;
  public
    { Public declarations }
    function BulmacayiKontrolEt(const Grid:TStringGrid):Boolean;
    property Deger[Satir,Sutun:Integer]:String read DegerOku write DegerYaz;
  end;

var
  FormDiamondAna: TFormDiamondAna;

implementation

uses form_diamond_liste;

{$R *.DFM}
type   TStringGridCrack=class(TStringGrid);

var Sudoku:TDiamond; KareBoyu:Byte;

const
  MemoAdi='Memo';
  DosyaAdi:String='';//'tmp.dia';
  Uzanti='.dia';
  Version='2.2';//'Beta';
  //Baslik='Diamond';
  //107 sn=1.78 dk'da boþken deneme yanýlmayý çözdü
  //7sn de boþken çözüm olmadýðýný buldu

  { Seviye boþ bulmacayý
   Etkisizde deneme yanýlma çözümü çooooook çooooook uzun sürer
   Zayýf deneme yanýlma çözümü çooooook uzun sürer
   Ortada deneme yanýlma çözümü 127704 ms= 128 sn= 2.1 dk
   Güçlüde deneme yanýlma çözümü 123097 ms= 123 sn= 2.05 dk

   Etkisizde çözüm olmaDýðýný 0 ms'de buluyor (çözemez zaten)
   Zayýf çözüm olmadýðýný 0 ms'de buluyor
   Ortada çözüm olmadýðýný 6529 ms= 6.5 sn'de buluyor
   Güçlüde çözüm olmadýðýný 6529 ms= 6.5 sn'de buluyor}

procedure TFormDiamondAna.FormCreate(Sender: TObject);
begin
  DragAcceptFiles(Handle, True);
  Randomize;
  Sudoku:=TDiamond.Create;
  Sudoku.OnIncelenenNesneOlayi:=Durum;

  if not Grup.Visible then begin
    Width:=290;
    Sudoku.TaramaSeviyesi:=3;
  end;
  SeviyeAyari.Position:=Sudoku.TaramaSeviyesi;

  Otomatik.Execute;//otomatik çözdürme için...
  Otomatik.Execute;

  KareBoyu:=Trunc(Sqrt(__Boyut));
  SayilariYaz;
  S:='';
  if ParamCount>0 then begin
    DosyaAdi:=ParamStr(1);
    if not FileExists(DosyaAdi)then ChangeFileExt(DosyaAdi,Uzanti);
    if FileExists(DosyaAdi) then DosyadanOku(DosyaAdi)
    else DosyaAdi:='';
  end;
  DosyaAc.InitialDir:=ExtractFilePath(Application.ExeName);
  DosyaKaydet.InitialDir:=DosyaAc.InitialDir;
  //DosyaAc.InitialDir:=''; DosyaKaydet.InitialDir:='';
  Tazele;
  Application.HintPause:=0;
  Application.HintHidePause:=-1;
end;

procedure TFormDiamondAna.FormDestroy(Sender: TObject);
begin
  Sudoku.Free;
end;

procedure TFormDiamondAna.SayilariYaz;
var Satir,Sutun:Integer; 
begin  //A(65)-a(97)
  for Satir:=0 to __Boyut-1 do
   for Sutun:=0 to __Boyut-1 do
    Sayilar.Cells[Sutun,Satir]:=Sudoku.HucreSayisi[Satir,Sutun];
  Tazele;
  if form_diamond_liste.FormOlustu then FormDiamondListe.SayilariYaz;
end;

procedure TFormDiamondAna.SayilarDblClick(Sender: TObject);
var Str:String;
begin
  if (Sudoku.Deger[Sayilar.Row,Sayilar.Col]>0) and not(Sudoku.DegeriVerilenmi[Sayilar.Row,Sayilar.Col]) then
  //Deðeri hesaplanarak bulunan sayi ise
    MessageBox(Handle,'Buraya farklý bir deðer girilemez...','Uyarý',MB_ICONWARNING)
  else if Trim(S)='' then begin
    Str:='';
    if InputQuery('Deðer',Format('%d. Satýr %d. Sütun -> [%s]',
     [Sayilar.Row+1,Sayilar.Col+1,Sudoku.HucreSayilari[Sayilar.Row,Sayilar.Col]])
      ,Str) and (Trim(Str)<>'') then
      Deger[Sayilar.Row,Sayilar.Col]:=Str;
  end else if Sudoku.DegeriVerilenmi[Sayilar.Row,Sayilar.Col] or (Deger[Sayilar.Row,Sayilar.Col]='') then begin
    Deger[Sayilar.Row,Sayilar.Col]:=S[1];
    Delete(S,1,1);
    Tazele;
  end;
  Tazele;
end;

procedure TFormDiamondAna.SayilarDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const Renk=clMaroon; Kalinlik=4;
var
  Grid:TStringGrid;
  Yed_DrawCellEvent:TDrawCellEvent;
  Hucresi:TTekHucre;
begin
  Grid:=TStringGrid(Sender);

  //Grid.Canvas.Brush.Color:=Sudoku.HucreRengi[ARow,ACol];

  if Sudoku.DegeriVerilenmi[ARow,ACol] then begin
    Grid.Canvas.Brush.Color:=$00E0E000;
    Grid.Canvas.Font.Color:=$00FF8000;
    Grid.Canvas.Font.Style:=Sayilar.Canvas.Font.Style+[fsBold];
  end else if Sudoku.DegeriDenenenmi[ARow,ACol] then begin
    Grid.Canvas.Font.Color:=$004237C8;
    Grid.Canvas.Font.Style:=Sayilar.Canvas.Font.Style-[fsBold];
  end else begin
    Grid.Canvas.Font.Color:=clBlack;
    Grid.Canvas.Font.Style:=Sayilar.Canvas.Font.Style-[fsBold];
  end;
  if (ACol>0) and (ACol mod KareBoyu=0) then begin
    Grid.Canvas.Pen.Color:=Renk;
    Grid.Canvas.Pen.Width:=Kalinlik;
    Grid.Canvas.MoveTo(Rect.Left,Rect.Top);
    Grid.Canvas.LineTo(Rect.Left,Rect.Bottom);
  end;
  if (ARow>0) and (ARow mod KareBoyu=0) then begin
    Grid.Canvas.Pen.Color:=Renk;
    Grid.Canvas.Pen.Width:=Kalinlik;
    Grid.Canvas.MoveTo(Rect.Left,Rect.Top);
    Grid.Canvas.LineTo(Rect.Right,Rect.Top);
  end;
  Grid.Canvas.Pen.Color:=clLime;
  Grid.Canvas.Pen.Width:=1;
  Grid.Canvas.Pen.Color:=clBlack;

  Hucresi:=TTekHucre(Sudoku.Hucre[ARow,ACol]);
  //if Hucresi.Deger>0 then
  begin
    Grid.Canvas.Font.Color:=clBlue;
    Grid.Canvas.Font.Size:=8;
    //Grid.Canvas.TextOut(0,0,Hucresi.Satirlar[1]);
    Grid.Canvas.Font:=Grid.Font;
  //end else begin
    Yed_DrawCellEvent:=Grid.OnDrawCell;
    Grid.OnDrawCell:=nil;
    TStringGridCrack(Grid).DrawCell(ACol,ARow,Rect,State);
    Grid.OnDrawCell:=Yed_DrawCellEvent;
  end;
end;

procedure TFormDiamondAna.KapatExecute(Sender: TObject);
begin
  if (Screen.ActiveForm=Self) and
   (MessageBox(Handle,'Bu programdan çýkmak istediðinize emin misiniz?',
    'Dikkat',MB_YESNOCANCEL+MB_ICONINFORMATION)=IDYES) then Close;
end;

procedure TFormDiamondAna.DegerVerExecute(Sender: TObject);
begin
  Sayilar.OnDblClick(Sayilar);
end;

procedure TFormDiamondAna.KaydetExecute(Sender: TObject);
begin
  if Trim(DosyaAdi)='' then FarkliKaydet.Execute
  else Sudoku.DosyayaKaydet(DosyaAdi);
end;

procedure TFormDiamondAna.YukleExecute(Sender: TObject);
begin
  if DosyaAc.Execute then begin
    DosyaAdi:=DosyaAc.FileName;
    if not FileExists(DosyaAdi) then begin
      if ExtractFileExt(DosyaAdi)='' then DosyaAdi:=DosyaAdi+Uzanti
      else ChangeFileExt(DosyaAdi,Uzanti);
    end;
    DosyadanOku(DosyaAdi);
    SayilariYaz;
  end;
end;

procedure TFormDiamondAna.TekrarYukleExecute(Sender: TObject);
begin
  if (Trim(DosyaAdi)='') or (not FileExists(DosyaAdi)) then Yukle.Execute
  else begin
    Sudoku.DosyadanOku(DosyaAdi);
    SayilariYaz;
  end;
end;

procedure TFormDiamondAna.FarkliKaydetExecute(Sender: TObject);
var S:String;
begin
  if DosyaKaydet.Execute then begin
    DosyaAdi:=DosyaKaydet.FileName;
    if ExtractFileExt(DosyaAdi)='' then begin
      S:=DosyaAdi+Uzanti;
      if not FileExists(S) then DosyaAdi:=S;
    end;
    Sudoku.DosyayaKaydet(DosyaAdi);
  end;
end;

procedure TFormDiamondAna.HesaplaExecute(Sender: TObject);
var Sonuc:TBulmacaCozumSonucu; S:String; Cur:TCursor;
begin
  Cur:=Cursor;
  Screen.Cursor:=crHourGlass;
  S:='';
  Caption:='Lütfen Bekleyin...';
  Zaman:=GetTickCount;
  Sonuc:=Sudoku.Coz;
  Zaman:=GetTickCount-Zaman;
//  Bilgi.Panels[1].Text:=Format('%d ms.',[Zaman]);Caption:=Application.Title;
  Caption:=Format('%s [%d ms.]',[Application.Title,Zaman]);
  SayilariYaz;
  Screen.Cursor:=Cur;
  case Sonuc of
    bcsDolmadi:begin
      if Sudoku.TaramaSeviyesi<=2 then S:='Seviyeyi yükselterek çözün.'
      else S:=#10#13'Bulmacanýn 1''den fazla çözümü var.'#10#13'"Deneme Yanýlma ile Çöz" seçeneði kullanýlarak bunlar elde edilebilir.';
      MessageBox(Handle,PChar(Format('Bulmacayý çözemedim-> %s',[S])),'Dikkat',MB_ICONWARNING);
    end;
    bcsYanlisCozuldu:MessageBox(Handle,'Bulmaca yanlýþ çözüldü-> Verilen deðerler yanlýþ.','Uyarý',MB_ICONWARNING);
    bcsCozuldu:MessageBox(Handle,'Bulmaca çözüldü.','Dikkat',MB_ICONINFORMATION);
  end;        
end;

procedure TFormDiamondAna.KontrolExecute(Sender: TObject);
begin
  if Sudoku.BulmacaDolumu then begin
    if Sudoku.BulmacaDogrumu then MessageBox(Handle,'Bulmaca doðru çözülmüþ','Bilgi',MB_ICONINFORMATION)
    else MessageBox(Handle,'Bulmaca yanlýþ çözülmüþ','Uyarý',MB_ICONWARNING)
  end else MessageBox(Handle,'Bulmaca dolu deðil.','Dikkat',MB_ICONWARNING);
end;

procedure TFormDiamondAna.YeniBulmacaOlusturExecute(Sender: TObject);
begin
  Sudoku.YeniBulmacaOlustur;
  SayilariYaz;
  DosyaAdi:='';
end;

procedure TFormDiamondAna.SayilarClick(Sender: TObject);
begin
  Tazele;
end;

function TFormDiamondAna.DegerOku(Satir, Sutun: Integer): String;
begin
  Result:=Sudoku.HucreSayisi[Satir,Sutun];
end;

procedure TFormDiamondAna.DegerYaz(Satir, Sutun: Integer;
  const Sayi: String);
begin
  Sudoku.Deger[Satir,Sutun]:=StrToIntDef(Sayi,-1);
  SayilariYaz;
end;

procedure TFormDiamondAna.OtomatikExecute(Sender: TObject);
begin
  Otomatik.Checked:=not Otomatik.Checked;
  Sudoku.OtomatikCoz:=Otomatik.Checked;
  if Sudoku.OtomatikCoz then SayilariYaz;
end;

procedure TFormDiamondAna.HizliCozExecute(Sender: TObject);
begin
  HizliCoz.Checked:=not HizliCoz.Checked;
  Sudoku.HizliCoz:=HizliCoz.Checked;
end;

procedure TFormDiamondAna.OlanDegerlerExecute(Sender: TObject);
begin
  ShowMessage(Sudoku.HucreSayilari[Sayilar.Row,Sayilar.Col]);
end;

procedure TFormDiamondAna.inceleExecute(Sender: TObject);
var _Left,_Top:Integer;
const _Width=760;_Height=220;
begin
  _Left:=Left-((_Width-Width) div 2);
  if _Left+_Width>Screen.Width then _Left:=Screen.Width-_Width;
  if _Left<0 then _Left:=0;
  if Top>_Height then _Top:=Top-_Height
  else _Top:=Top+Height;
  OlanDegerlerListesi(Sudoku,_Left,_Top);
end;

procedure TFormDiamondAna.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const Tuslar=[ssCtrl,ssShift,ssAlt];
begin
  case Key of
    VK_LEFT,VK_UP,VK_RIGHT,VK_DOWN,VK_PRIOR,VK_NEXT,VK_END,VK_HOME:Sayilar.Refresh;
    //VK_F1:incele.Execute;
    VK_F2:Kaydet.Execute;
    48..57:S:=S+Chr(Key);
    96..105:S:=S+Chr(Key-48);
    90:if ssCtrl in Shift then GeriAl.Execute;
    VK_TAB:if Tuslar*Shift=Tuslar then begin
      Grup.Visible:=not Grup.Visible;   //570-290=280
      //if Grup.Visible then Width:=570 else Width:=290;
      if Grup.Visible then Width:=Width+280 else Width:=Width-280;
    end;
    VK_RETURN:if S<>'' then begin
      if Sudoku.DegeriVerilenmi[Sayilar.Row,Sayilar.Col] or (Deger[Sayilar.Row,Sayilar.Col]='') then begin
        Deger[Sayilar.Row,Sayilar.Col]:=S[1];
        Delete(S,1,1);
        Tazele;
      end else MessageBox(Handle,'Buraya farklý bir deðer girilemez...','Uyarý',MB_ICONWARNING);
    end else Sayilar.OnDblClick(Sayilar);
    VK_BACK:if Length(S)<=1 then S:='' else Delete(S,Length(S),1);
    VK_DELETE:if Length(S)<=1 then S:='' else Delete(S,1,1);
  end;
  if S='' then Caption:=Application.Title
  else Caption:=Format('%s [%s]',[Application.Title,S]);
end;

function TFormDiamondAna.BulmacayiKontrolEt(const Grid: TStringGrid): Boolean;
var Satir,Sutun,Kare,SatirBasi,SutunBasi:Byte; Kume:TDeger;
begin
  Result:=False;
  for Sutun:=0 to __Boyut-1 do begin  //Her sütunu kontrol eder...
    Kume:=BosKume;
    for Satir:=0 to __Boyut-1 do Kume:=Kume+[StrToIntDef(Grid.Cells[Sutun,Satir],0)];
    Result:=(Kume=[1..__Boyut]);
    if not Result then Exit;
  end;
  for Satir:=0 to __Boyut-1 do begin  //Her satýrý kontrol eder...
    Kume:=BosKume;
    for Sutun:=0 to __Boyut-1 do Kume:=Kume+[StrToIntDef(Grid.Cells[Sutun,Satir],0)];
    Result:=(Kume=[1..__Boyut]);
    if not Result then Exit;
  end;
  for Kare:=0 to __Boyut-1 do begin//Her kareyi kontrol eder...
    Kume:=BosKume;
    SatirBasi:=(Kare div KareBoyu)*KareBoyu;
    SutunBasi:=(Kare mod KareBoyu)*KareBoyu;
    for Satir:=SatirBasi to SatirBasi+2 do
     for Sutun:=SutunBasi to SutunBasi+2 do
      Kume:=Kume+[StrToIntDef(Grid.Cells[Sutun,Satir],0)];
    Result:=(Kume=[1..__Boyut]);
    if not Result then Exit;
  end;
end;

procedure TFormDiamondAna.WMDROPFILES(var TheMessage: TWMDROPFILES);
var
  FileName : array[0..MAX_PATH] of char;
begin
// Sürüklenen Dosyanýn ismini,yolunu al
  DragQueryFile(TheMessage.Drop, 0, FileName, 300);
  if FileExists(FileName) then begin
    DosyaAdi:=FileName;
    TekrarYukle.Execute;
  end;
end;

procedure TFormDiamondAna.HakkindaExecute(Sender: TObject);
const
  SatirBasi=#10#13;
  Bosluk=#9;
begin
  MessageBox(Handle,PChar(Format(
   '%s%s%sDIAMOND %s Sürümü%s%sBu program 9x9''luk her satýra, sütuna ve 3x3''lük karelere farklý 1''den 9''a kadar sayýlarý yerleþtirir.%sDaha farklý boyut ve gruplarýda çözebilir '+
   'ama bu versiyonda gerekli arayüz bulunmamaktadýr.'
    ,[Bosluk,Bosluk,Bosluk,Version,SatirBasi,SatirBasi,SatirBasi])),
     PChar(Application.Title),MB_ICONINFORMATION);
end;

procedure TFormDiamondAna.GeriAlExecute(Sender: TObject);
begin
  Sudoku.GeriAl;
  SayilariYaz;
end;

procedure TFormDiamondAna.DosyadanOku(const DosyaAdi:String);
begin
  if FileExists(DosyaAdi) then Sudoku.DosyadanOku(DosyaAdi);
  SayilariYaz;
end;

procedure TFormDiamondAna.DenemeYanilmaExecute(Sender: TObject);
var Sonuc:Boolean; Cur:TCursor;
begin
  //MessageBox(Handle,'Bu iþlev henüz bu versiyonda tamamlanmamýþtýr','Dikkat',MB_ICONWARNING);
  //Exit;
  Cur:=Cursor;
  Screen.Cursor:=crHourGlass;
  S:='';
  Caption:='Lütfen Bekleyin...';
  Zaman:=GetTickCount;
  Sonuc:=Sudoku.Dene;
  Zaman:=GetTickCount-Zaman;
//  Bilgi.Panels[1].Text:=Format('%d ms.',[Zaman]);Caption:=Application.Title;
  Caption:=Format('%s [%d ms.]',[Application.Title,Zaman]);
  SayilariYaz;
  Screen.Cursor:=Cur;
  if Sonuc then MessageBox(Handle,'Bulmaca çözüldü.','Dikkat',MB_ICONINFORMATION)
  else if Sudoku.BulmacaDogrumu  then MessageBox(Handle,'Denemeler bitti. Deðerler tekrar baþtan çalýþacak.','Dikkat',MB_ICONWARNING)
  else MessageBox(Handle,'Bulmaca çözülemiyor. Denemeler bitti.','Dikkat',MB_ICONWARNING);
end;

procedure TFormDiamondAna.Durum(const Sender:TObject;const SiraNo,ToplamSayi:Byte);
begin
  Bilgi.Panels[0].Text:=Format('%3.2fsn  %d/%d -> %%%3.0f',[(GetTickCount-Zaman)/1000,SiraNo,ToplamSayi,SiraNo/ToplamSayi*100]);
  Bilgi.Update;
  SayilariYaz;
  Application.ProcessMessages;
end;

procedure TFormDiamondAna.HesaplananDegerleriiptalEtExecute(
  Sender: TObject);
begin
  Sudoku.GeriAl(0);//Tekrar yüklenir..
  Sudoku.DenemeyiBaslangicaAl;
  SayilariYaz;
end;

procedure TFormDiamondAna.FormResize(Sender: TObject);
var Genislik,Yukseklik:Integer;
begin
  //30->20
  Genislik:=Sayilar.Width div Sudoku.Boyut-Sayilar.GridLineWidth*2;
  Yukseklik:=Sayilar.Height div Sudoku.Boyut-Sayilar.GridLineWidth*2;
  if Genislik<>Sayilar.DefaultColWidth then Sayilar.DefaultColWidth:=Genislik;
  if Yukseklik<>Sayilar.DefaultRowHeight then Sayilar.DefaultRowHeight:=Yukseklik;
  Bilgi.Panels[0].Width:=Bilgi.Width-105;
  if Genislik>Yukseklik then Genislik:=Yukseklik;
  Sayilar.Font.Size:=(Genislik*2) div 3;
end;

procedure TFormDiamondAna.Tazele;
begin
  Sayilar.Refresh;
  Bilgi.Panels[1].Text:=Sudoku.HucreSayilari[Sayilar.Row,Sayilar.Col];
end;

procedure TFormDiamondAna.YardimciMenuChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
  if Assigned(Source) then Bilgi.SimpleText:=Source.Hint;
end;

procedure TFormDiamondAna.SonDenemeTekrariExecute(Sender: TObject);
begin
  //MessageBox(Handle,'Bu iþlev henüz bu versiyonda tamamlanmamýþtýr','Dikkat',MB_ICONWARNING);
  //Exit;
  if Sudoku.DenemeyiGeriAtlat=0 then MessageBox(Handle,'Geri alýncak deðer kalmadý.','Dikkat',MB_ICONASTERISK);
  SayilariYaz;
end;

procedure TFormDiamondAna.SeviyeAyariChange(Sender: TObject);
begin
  case SeviyeAyari.Position of
    0:EtkisizSeviye.Execute;
    1:ZayifSeviye.Execute;
    2:OrtaSeviye.Execute;
    3:GucluSeviye.Execute;
  end;
end;

procedure TFormDiamondAna.Label2Click(Sender: TObject);
begin
  EtkisizSeviye.Execute;
  //SeviyeAyari.Position:=0;
end;

procedure TFormDiamondAna.Label3Click(Sender: TObject);
begin
  ZayifSeviye.Execute;
  //SeviyeAyari.Position:=1;
end;

procedure TFormDiamondAna.Label4Click(Sender: TObject);
begin
  OrtaSeviye.Execute;
  //SeviyeAyari.Position:=2;
end;

procedure TFormDiamondAna.Label5Click(Sender: TObject);
begin
  GucluSeviye.Execute;
  //SeviyeAyari.Position:=3;
end;

procedure TFormDiamondAna.ApplicationEvents1ShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  if Trim(HintStr)<>'' then Bilgi.Panels[0].Text:=HintStr;
end;

procedure TFormDiamondAna.DenemeyiDurdurExecute(Sender: TObject);
begin
  Sudoku.DenemeyiBitir;
end;

procedure TFormDiamondAna.EtkisizSeviyeExecute(Sender: TObject);
begin
  SeviyeAyari.OnChange:=nil;
  EtkisizSeviye.Checked:=True;
  ZayifSeviye.Checked:=False;
  OrtaSeviye.Checked:=False;
  GucluSeviye.Checked:=False;
  SeviyeAyari.Position:=0;
  Sudoku.TaramaSeviyesi:=SeviyeAyari.Position;
  SeviyeAyari.OnChange:=SeviyeAyariChange;
end;

procedure TFormDiamondAna.ZayifSeviyeExecute(Sender: TObject);
begin
  SeviyeAyari.OnChange:=nil;
  EtkisizSeviye.Checked:=False;
  ZayifSeviye.Checked:=True;
  OrtaSeviye.Checked:=False;
  GucluSeviye.Checked:=False;
  SeviyeAyari.Position:=1;
  Sudoku.TaramaSeviyesi:=SeviyeAyari.Position;
  SeviyeAyari.OnChange:=SeviyeAyariChange;
end;

procedure TFormDiamondAna.OrtaSeviyeExecute(Sender: TObject);
begin
  SeviyeAyari.OnChange:=nil;
  EtkisizSeviye.Checked:=False;
  ZayifSeviye.Checked:=False;
  OrtaSeviye.Checked:=True;
  GucluSeviye.Checked:=False;
  SeviyeAyari.Position:=2;
  Sudoku.TaramaSeviyesi:=SeviyeAyari.Position;
  SeviyeAyari.OnChange:=SeviyeAyariChange;
end;

procedure TFormDiamondAna.GucluSeviyeExecute(Sender: TObject);
begin
  SeviyeAyari.OnChange:=nil;
  EtkisizSeviye.Checked:=False;
  ZayifSeviye.Checked:=False;
  OrtaSeviye.Checked:=False;
  GucluSeviye.Checked:=True;
  SeviyeAyari.Position:=3;
  Sudoku.TaramaSeviyesi:=SeviyeAyari.Position;
  SeviyeAyari.OnChange:=SeviyeAyariChange;
end;

procedure TFormDiamondAna.YardimBilgileriExecute(Sender: TObject);
var Form:TForm;
begin
  Form:=TForm.Create(Self);
  try
    Form.Caption:=Application.Title;
    Form.KeyPreview:=True;
    Form.Position:=poScreenCenter;
    Form.OnKeyUp:=YardimKeyUp;
    Form.OnClose:=YardimClose;
    Form.OnResize:=YardimResize;
    with TMemo.Create(Form) do begin
      Parent:=Form;
      Show;
      Align:=alClient;
      ReadOnly:=True;
      Name:=MemoAdi;
      ScrollBars:=ssVertical;
      Clear;
    end;
    Form.WindowState:=wsMaximized;
    Form.Show;//Modal;
  finally
    //Form.Free;
  end;
end;

procedure TFormDiamondAna.YardimKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Form:TControl;
begin  //Hangi formun olayýnda ise o formu kapatýr.
  case Key of
    VK_ESCAPE:begin
      Form:=TControl(Sender);
      while Assigned(Form) and not (Form is TForm) do Form:=Form.Parent;
      if Assigned(Form) then TForm(Form).Close;
    end;
  end;
end;

procedure TFormDiamondAna.YardimClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormDiamondAna.YardimResize(Sender: TObject);
var Memo:TComponent;
begin
  if Sender is TForm then begin
    Memo:=TForm(Sender).FindComponent(MemoAdi);
    if Memo is TMemo then with TMemo(Memo) do begin
      Text:=YardimBilgisi.Text;
      Font:=YardimBilgisi.Font;
    end;
  end;
end;

procedure TFormDiamondAna.BulmacaOlusturExecute(Sender: TObject);
var i,Yed,Kactane,KacDegerVar,HizliKactaneDeger:Integer; HataOldu:Boolean;

 function RasgeleHucreSecDegerVer:Boolean;
 var Satir,Sutun,Deger:Byte; Hucre:TTekHucre;
 begin
   Result:=False;
   if Sudoku.BulmacaDolumu then Exit;//Bulmaca dolu ise iþlem sona erdirilir..
   repeat
     Satir:=Random(Sudoku.Boyut);//0..8 arasý
     Sutun:=Random(Sudoku.Boyut);//0..8 arasý
     Hucre:=Sudoku.Hucre[Satir,Sutun];
     if Hucre.Degerler=BosKume then Exit;//Seçilen hücre içine deðer yerleþtirilemiyorsa o zaman hata var
     if Hucre.Deger<>0 then Continue; //Deðeri ortaya çýkan ise o hücre seçilmez
     repeat
       Deger:=Random(Sudoku.Boyut)+1;//1..9 arasý deðer
     until Deger in Hucre.Degerler; //Olabilecek deðerlerden biri seçilmeli
     Sudoku[Satir,Sutun]:=Deger;
     Result:=True;
   until Result;
   inc(Kactane);
 end;

 procedure Hata;
 begin
   MessageBox(Handle,'Yanlýþ deðerler seçildi. Bulmaca oluþturulamadý.','Hata',MB_ICONERROR);
   //YeniBulmacaOlustur.Execute;
   HataOldu:=True;
 end;

begin
  Yed:=Sudoku.TaramaSeviyesi;
  Sudoku.TaramaSeviyesi:=3;
  HataOldu:=False;KacDegerVar:=Sudoku.KacTaneDegerGirildi;
  //YeniBulmacaOlustur.Execute;
  //Sudoku.Coz;
  Kactane:=0;
  //...->
  HizliKactaneDeger:=Round(Sqrt(Sudoku.Boyut));
  HizliKactaneDeger:=HizliKactaneDeger*(HizliKactaneDeger+1);
  i:=Sudoku.KacTaneDegerGirildi;
  while i<=HizliKactaneDeger do begin
    HataOldu:=not RasgeleHucreSecDegerVer;
    if HataOldu then Break;
    Inc(i);
    SayilariYaz;
  end; {}
  //<- Sayýlar oluþturulurken programýn hýzlý çalýþmasýný saðlar ama hatalý bulmaca üretebilir...
  while not HataOldu do begin
    SayilariYaz;
    case Sudoku.Coz of
      bcsDolmadi:if not RasgeleHucreSecDegerVer then Hata;
      bcsYanlisCozuldu:Hata;
      bcsCozuldu:begin
        SayilariYaz;
        MessageBox(Handle,PChar(Format('Bulmaca oluþtu. %d adet deðer atandý.',[Kactane])),
         'Dikkat',MB_ICONINFORMATION);
        HesaplananDegerleriiptalEt.Execute;
        SayilariYaz;
        Break;
      end;
    end;
  end;
  if HataOldu then begin
    Sudoku.GeriAl(Sudoku.KacTaneDegerGirildi-KacDegerVar);//Hata olduðunda otomatik verilen deðerler silinir...
    SayilariYaz;
  end;
  KacTaneDegerGirildi.Execute;
  Sudoku.TaramaSeviyesi:=Yed;
end;

procedure TFormDiamondAna.GereksizDegerleriSilExecute(Sender: TObject);
var Yed:Integer; Satir,Sutun,Deger,Silindi,SiraNo,Sayi:Byte;
begin
  Yed:=Sudoku.TaramaSeviyesi;
  Sudoku.TaramaSeviyesi:=3;
  Silindi:=Sudoku.KacTaneDegerGirildi;//Silindi:=0;
  Sayi:=Sudoku.Boyut*Sudoku.Boyut;
  if Sudoku.Coz=bcsCozuldu then //Çözülebilen bir bulmaca ise silme olacak
  for Satir:=0 to Sudoku.Boyut-1 do for Sutun:=0 to Sudoku.Boyut-1 do begin
    SiraNo:=Satir*Sudoku.Boyut+Sutun+1;
    Bilgi.Panels[0].Text:=Format('%d/%d => %%%d',[SiraNo,Sayi,Round(SiraNo/Sayi*100)]);
    Bilgi.Update;
    if Sudoku.DegeriVerilenmi[Satir,Sutun] then begin
      Deger:=Sudoku.Deger[Satir,Sutun];
      Sudoku.Deger[Satir,Sutun]:=0;
      if Sudoku.Coz=bcsCozuldu then begin
          Sudoku.GeriAl(0);
          SayilariYaz;
          //inc(Silindi);
      end else Sudoku.Deger[Satir,Sutun]:=Deger
    end;
  end;
  Silindi:=Silindi-Sudoku.KacTaneDegerGirildi;
  MessageBox(Handle,PChar(Format('Sýkýþtýrma bitti. %d adet gereksiz deðer silindi.',[Silindi]))
   ,'Dikkat',MB_ICONINFORMATION);
  HesaplananDegerleriiptalEt.Execute;
  KacTaneDegerGirildi.Execute;
  Sudoku.TaramaSeviyesi:=Yed;
end;

procedure TFormDiamondAna.KacTaneDegerGirildiExecute(Sender: TObject);
begin
  Bilgi.Panels[1].Text:=Format('%d adet deðer',[Sudoku.KacTaneDegerGirildi]);
end;

end.
