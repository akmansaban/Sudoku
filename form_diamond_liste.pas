unit form_diamond_liste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DiamondClasses;

type
  TFormDiamondListe = class(TForm)
    Sayilar: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SayilarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    Sudoku:TDiamond;
    function DegerlerOku(Satir, Sutun: Integer): String;
    procedure DegerlerYaz(Satir, Sutun: Integer; const Deger: String);
    { Private declarations }
  public
    { Public declarations }
    procedure SayilariYaz;
    property Degerler[Satir,Sutun:Integer]:String read DegerlerOku write DegerlerYaz;
  end;

var
  FormDiamondListe: TFormDiamondListe;
  FormOlustu:Boolean=False;

function OlanDegerlerListesi(const Sudoku:TDiamond;const Left:Integer=-1;
 const Top:Integer=-1):Boolean;

implementation

uses form_diamond_ana;

{$R *.DFM}

function OlanDegerlerListesi(const Sudoku:TDiamond;const Left:Integer=-1;
 const Top:Integer=-1):Boolean;
begin
  Result:=Assigned(Sudoku);
  if Result then try
    if not FormOlustu then FormDiamondListe:=TFormDiamondListe.Create(Application);
    FormDiamondListe.Sudoku:=Sudoku;
    FormDiamondListe.SayilariYaz;
    if (Left<0) or (Left+(FormDiamondListe.Width div 2)>Screen.Width) then
     FormDiamondListe.Left:=(Screen.Width-FormDiamondListe.Width) div 2
    else FormDiamondListe.Left:=Left;
    if (Top<0) or (Top+(FormDiamondListe.Height div 2)>Screen.Height) then
     FormDiamondListe.Top:=(Screen.Height-FormDiamondListe.Height) div 2
    else FormDiamondListe.Top:=Top;
    FormDiamondListe.Show;
  except
    Result:=False;
  end;
end;

{ TFormDiamondListe }

procedure TFormDiamondListe.SayilariYaz;
var Satir,Sutun:Byte;
begin
  for Satir:=0 to Sudoku.Boyut-1 do
   for Sutun:=0 to Sudoku.Boyut-1 do
    Degerler[Satir,Sutun]:=Sudoku.HucreSayilari[Satir,Sutun];
  SayilarClick(Sayilar);
end;

function TFormDiamondListe.DegerlerOku(Satir, Sutun: Integer): String;
begin
  Result:=Sayilar.Cells[Sutun,Satir];
end;

procedure TFormDiamondListe.DegerlerYaz(Satir, Sutun: Integer;
  const Deger: String);
begin
  Sayilar.Cells[Sutun,Satir]:=Deger;
end;

procedure TFormDiamondListe.FormCreate(Sender: TObject);
begin
  FormOlustu:=True;
  Sayilar.OnDrawCell:=FormDiamondAna.SayilarDrawCell;
end;

procedure TFormDiamondListe.FormDestroy(Sender: TObject);
begin
  FormOlustu:=False;
end;

procedure TFormDiamondListe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormDiamondListe.SayilarClick(Sender: TObject);
var i,n:Integer; St:String;
begin
  Refresh;
  St:=Sayilar.Cells[Sayilar.Col,Sayilar.Row];
  n:=1;
  for i:=Length(St) downto 1 do
   if St[i]=',' then Inc(n);//n=n+1;
  if n<=1 then Caption:=St
  else Caption:=St+' -> ['+IntToStr(n)+']';
end;

procedure TFormDiamondListe.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:Close;
    VK_F1,VK_F5,VK_F6:FormDiamondAna.Show;
    VK_LEFT,VK_UP,VK_RIGHT,VK_DOWN,VK_PRIOR,VK_NEXT,VK_END,VK_HOME:Sayilar.Refresh;
  end;
end;

procedure TFormDiamondListe.FormResize(Sender: TObject);
var Genikslik,Yukseklik:Integer;
begin
  Genikslik:=Sayilar.Width div Sudoku.Boyut-Sayilar.GridLineWidth*2;
  Yukseklik:=Sayilar.Height div Sudoku.Boyut-Sayilar.GridLineWidth*2;
  if Genikslik<>Sayilar.DefaultColWidth then Sayilar.DefaultColWidth:=Genikslik;
  if Yukseklik<>Sayilar.DefaultRowHeight then Sayilar.DefaultRowHeight:=Yukseklik;
end;

end.
