object FormDiamondAna: TFormDiamondAna
  Left = 240
  Top = 154
  Width = 568
  Height = 328
  Caption = 'Diamond'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = YardimciMenu
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 275
    Top = 0
    Height = 273
  end
  object Grup: TScrollBox
    Left = 0
    Top = 0
    Width = 275
    Height = 273
    Align = alLeft
    TabOrder = 2
    Visible = False
    DesignSize = (
      254
      252)
    object Label1: TLabel
      Left = 2
      Top = -1
      Width = 269
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #199#246'z'#252'm Algoritmas'#305'n'#305'n Etkinli'#287'i'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 30
      Height = 13
      Hint = #199#246'zme i'#351'leminde etkisi hi'#231' yoktur.'
      Caption = 'Etkisiz'
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 83
      Top = 40
      Width = 23
      Height = 13
      Hint = #199#246'zme i'#351'lemini y'#252'zeysel bir bi'#231'imde yapar.'
      Anchors = [akTop]
      Caption = 'Zay'#305'f'
      OnClick = Label3Click
    end
    object Label4: TLabel
      Left = 168
      Top = 40
      Width = 20
      Height = 13
      Hint = #199#246'zme i'#351'lemini grup i'#231'inde s'#305'n'#305'rlamalar'#305' kontrol ederek '#231#246'zer.'
      Anchors = [akTop]
      Caption = 'Orta'
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 232
      Top = 40
      Width = 28
      Height = 13
      Hint = 
        #199#246'zme i'#351'lemini gruplar aras'#305'ndaki s'#305'n'#305'rlamalar'#305' kontrol ederek '#231 +
        #246'zer.'
      Anchors = [akTop, akRight]
      Caption = 'G'#252#231'l'#252
      OnClick = Label5Click
    end
    object CheckBox2: TCheckBox
      Left = 144
      Top = 56
      Width = 97
      Height = 15
      Action = HizliCoz
      TabOrder = 19
    end
    object SeviyeAyari: TTrackBar
      Left = 2
      Top = 14
      Width = 269
      Height = 26
      Hint = 'Uygulanacak '#231#246'z'#252'm i'#231'in i'#351'lem metotlar'#305'n'#305' se'#231'meyi sa'#287'lar.'
      Anchors = [akLeft, akTop, akRight]
      Max = 3
      TabOrder = 0
      OnChange = SeviyeAyariChange
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 56
      Width = 97
      Height = 15
      Action = Otomatik
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 190
      Top = 71
      Width = 75
      Height = 25
      Action = DegerVer
      Caption = 'De'#287'er Ver'
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 97
      Width = 175
      Height = 25
      Action = YeniBulmacaOlustur
      Caption = 'Yeni Bulmaca Olu'#351'tur'
      TabOrder = 3
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 122
      Width = 100
      Height = 25
      Action = Yukle
      Caption = 'A'#231
      TabOrder = 4
    end
    object BitBtn4: TBitBtn
      Left = 8
      Top = 148
      Width = 100
      Height = 25
      Action = TekrarYukle
      Caption = 'Tekrar Y'#252'kle'
      TabOrder = 5
    end
    object BitBtn5: TBitBtn
      Left = 8
      Top = 173
      Width = 100
      Height = 25
      Action = Kaydet
      Caption = 'Kaydet'
      TabOrder = 6
    end
    object BitBtn6: TBitBtn
      Left = 8
      Top = 199
      Width = 100
      Height = 25
      Action = FarkliKaydet
      Caption = 'FarkliKaydet'
      TabOrder = 7
    end
    object BitBtn7: TBitBtn
      Left = 8
      Top = 224
      Width = 100
      Height = 25
      Action = Kapat
      Caption = 'Kapat'
      TabOrder = 8
    end
    object BitBtn8: TBitBtn
      Left = 190
      Top = 97
      Width = 75
      Height = 25
      Action = GeriAl
      Caption = 'Geri Al'
      TabOrder = 9
    end
    object BitBtn9: TBitBtn
      Left = 8
      Top = 71
      Width = 175
      Height = 25
      Action = HesaplananDegerleriiptalEt
      Caption = 'Hesaplanan De'#287'erleri '#304'ptal Et'
      TabOrder = 10
    end
    object BitBtn10: TBitBtn
      Left = 120
      Top = 122
      Width = 145
      Height = 25
      Action = Hesapla
      Caption = 'Bulmacay'#305' '#199#246'z'
      TabOrder = 11
    end
    object BitBtn11: TBitBtn
      Left = 120
      Top = 148
      Width = 145
      Height = 25
      Action = DenemeYanilma
      Caption = 'Deneme Yan'#305'lma ile '#199#246'z'
      TabOrder = 12
    end
    object BitBtn12: TBitBtn
      Left = 120
      Top = 173
      Width = 145
      Height = 25
      Action = SonDenemeTekrari
      Caption = 'Son Denemeyi '#304'ptal Et'
      TabOrder = 13
    end
    object BitBtn13: TBitBtn
      Left = 120
      Top = 199
      Width = 145
      Height = 25
      Action = Kontrol
      Caption = 'Kontrol Et'
      TabOrder = 14
    end
    object BitBtn14: TBitBtn
      Left = 88
      Top = 250
      Width = 89
      Height = 25
      Action = BulmacaOlustur
      Caption = 'Bulmaca Olu'#351'tur'
      TabOrder = 15
    end
    object BitBtn15: TBitBtn
      Left = 8
      Top = 250
      Width = 81
      Height = 25
      Action = incele
      Caption = 'De'#287'erleri '#304'ncele'
      TabOrder = 16
    end
    object BitBtn16: TBitBtn
      Left = 176
      Top = 250
      Width = 89
      Height = 25
      Action = GereksizDegerleriSil
      Caption = 'Gereksiz De'#287'erleri Sil'
      TabOrder = 17
    end
    object BitBtn17: TBitBtn
      Left = 120
      Top = 224
      Width = 145
      Height = 25
      Action = DenemeyiDurdur
      Caption = 'Denemeyi Durdur'
      TabOrder = 18
    end
  end
  object Sayilar: TStringGrid
    Left = 278
    Top = 0
    Width = 274
    Height = 273
    Align = alClient
    ColCount = 9
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 9
    FixedRows = 0
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentFont = False
    PopupMenu = YardimciMenu
    TabOrder = 0
    OnClick = SayilarClick
    OnDblClick = SayilarDblClick
    OnDrawCell = SayilarDrawCell
  end
  object Bilgi: TStatusBar
    Left = 0
    Top = 273
    Width = 552
    Height = 19
    AutoHint = True
    Panels = <
      item
        Width = 90
      end
      item
        Width = 50
      end>
  end
  object YardimBilgisi: TMemo
    Left = 304
    Top = 56
    Width = 217
    Height = 169
    Font.Charset = TURKISH_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      
        #9'Bu program, tabloya say'#305'lar'#305' '#246'yle yerle'#351'tirir ki; her sat'#305'rda, ' +
        'her s'#252'tunda ve her kare grupta 1'#39'den 9'#39'a kadar t'#252'm say'#305'lardan bi' +
        'rer tane olur.'
      ''
      
        #9'E'#287'er bulmacan'#305'n 1 tane '#231#246'z'#252'm k'#252'mesi varsa bulmaca '#231#246'z'#252'l'#252'r, 1'#39'de' +
        'n fazla '#231#246'z'#252'm k'#252'mesi varsa bulmaca dolmaz, hi'#231' '#231#246'z'#252'm k'#252'mesi yoks' +
        'a bulmaca yanl'#305#351' say'#305'larla dolar. 1'#39'den fazla '#231#246'z'#252'm k'#252'mesine den' +
        'eme yan'#305'lma y'#246'ntemi uygulanarak ula'#351#305'labilir.'
      ''
      
        #9'Ctrl+Shift+Alt+Tab tu'#351'lar'#305'na ayn'#305' anda bas'#305'l'#305'rsa yard'#305'mc'#305' panel' +
        ' ekranda g'#246'r'#252'n'#252'r hale gelecektir. Bu aray'#252'z iyi tasarlanmad'#305#287#305' i' +
        #231'in gizlenmi'#351'tir.'
      ''
      
        #9'Pencere '#252'zerine sa'#287' t'#305'kland'#305#287#305'nda gelen men'#252' se'#231'enekleri a'#351'a'#287#305'd' +
        'ad'#305'r.'
      ''
      
        #9'De'#287'er Ver'#9#9': O anda '#252'zerinde bulunan h'#252'creye say'#305' girmeye yarar' +
        ' (Ctrl+Enter).'
      
        '        Veri giri'#351'i rakamlara bas'#305'ld'#305#287#305' zaman form ba'#351'l'#305#287#305'na yaz' +
        #305'larak, daha sonra Enter tu'#351'una basarak, '#252'zerinde bulunan h'#252'crey' +
        'e bu ba'#351'l'#305'ktan yaz'#305'l'#305'r. Ba'#351'l'#305'k de'#287'eri bo'#351' ise de'#287'er giri'#351'i pence' +
        'resi '#231'al'#305#351#305'r.'
      
        #9'Geri Al'#9#9#9': Verilen son de'#287'er silinerek iptal edilir (Alt+BkSp)' +
        '.'
      
        #9'Hesaplanan De'#287'eri '#304'ptal Et'#9': Deneme yan'#305'lma y'#246'ntemi veya bulmac' +
        'ay'#305' '#231#246'z'#252'me uygulamalar'#305'ndan sonra ortaya '#231#305'kan de'#287'erlerin silinm' +
        'esini sa'#287'lar (Ctrl+Alt+Esc).'
      ''
      
        #9'De'#287'erleri '#304'ncele'#9#9': Bulmacada her h'#252'creye hangi say'#305'lar'#305'n olabi' +
        'lece'#287'ini tablo halinde g'#246'steren pencereyi a'#231'ar (F5).'
      
        #9'Olan De'#287'erler'#9#9#9': '#220'zerinde bulunulan h'#252'creye hangi de'#287'erlerin g' +
        'irilebilece'#287'ini g'#246'steren mesaj kutusunu a'#231'ar (F6).'
      
        #9'Kontrol Et'#9#9#9': Bulmacan'#305'n bo'#351' mu, dolu mu, dolu ise yanl'#305#351' m'#305' d' +
        'o'#287'ru mu oldu'#287'unu bildirir (Ctrl+K).'
      
        #9'Seviye -> (Her seviye art'#305#351#305' '#246'nceki seviyeleri de devreye sokar' +
        '.)'
      
        #9#9'Etkisiz'#9': Sadece h'#252'cre gruplar'#305'na girilen de'#287'erler sonucunda k' +
        'alan'#305' verir. Hesaplama yapmaz (Ctrl+E).'
      
        #9#9'Zay'#305'f'#9#9': Bir grup i'#231'inde bir say'#305' sadece bir h'#252'cre k'#252'mesinde v' +
        'arsa, di'#287'erlerinde yoksa onlar'#305'da ara'#351't'#305'r'#305'r (Ctrl+Z).'
      
        #9#9'Orta'#9#9': Bir grup i'#231'inde belli h'#252'crelere s'#305'k'#305#351'm'#305#351' say'#305'lar'#305' di'#287'e' +
        'r h'#252'crelerden '#231#305'karmak i'#231'in bu seviye de devreye girmelidir (Ctr' +
        'l+T).'
      
        #9#9'G'#252#231'l'#252#9#9': '#304'ki grup aras'#305'nda mesela bir kare ve o karenin ortas'#305 +
        'ndan ge'#231'en sat'#305'r gruplar'#305'nda kare i'#231'inde sadece ayn'#305' sat'#305'rda ola' +
        'bilen bir de'#287'er varsa sat'#305'rda bulunan h'#252'crelerden o kare d'#305#351#305'nda' +
        'kilerden o say'#305' at'#305'larak gruplar aras'#305'ndaki s'#305'n'#305'rlamalar'#305' da kon' +
        'trol edebilmek i'#231'in bu seviyede '#231#246'zmek gerek (Ctrl+G).'
      ''
      
        #9'Bulmacay'#305' '#199#246'z'#9#9': Bulmacay'#305' '#231#246'zmeye '#231'al'#305#351#305'r. E'#287'er '#231#246'zme algoritm' +
        'as'#305' en '#252'st seviyedeyse ve '#231#246'z'#252'me ula'#351'amazsa o zaman '#231#246'z'#252'm k'#252'mesi' +
        ' 1'#8217'den fazlad'#305'r (F9).'
      
        #9'Deneme Yan'#305'lma ile '#199#246'z'#9': Birden fazla '#231#246'z'#252'm k'#252'mesi varsa o k'#252'me' +
        'ler bu se'#231'enek kullan'#305'larak elde edilir. Her '#231'al'#305#351't'#305'r'#305'ld'#305#287#305'nda b' +
        'ir sonraki k'#252'me elde edilir. Bulmaca '#231#246'z'#252'lemiyor mesaj'#305' verildi'#287 +
        'inde '#231#246'z'#252'm k'#252'meleri bitmi'#351' demektir (Ctrl+F9).'
      
        #9'Son Denemeyi '#304'ptal Et'#9': Deneme yan'#305'lma i'#351'leminde verilen son de' +
        #287'er silinir. Bu onu tekrar kullanabilmeyi sa'#287'lar (Ctrl+Alt+F9).'
      ''
      
        #9'H'#305'zl'#305' '#199#246'z'#9#9#9': E'#287'er bu se'#231'enek i'#351'aretli ise sadece de'#287'i'#351'iklik ya' +
        'p'#305'lan h'#252'cre gruplar'#305' (sat'#305'r, s'#252'tun, kare) incelenir, i'#351'aretli de' +
        #287'ilse b'#252't'#252'n h'#252'cre gruplar'#305' incelenir (Ctrl+Alt+H).'
      
        #9'Otomatik '#199#246'z'#9#9#9': Bulmacaya her de'#287'er girildi'#287'inde bulmaca 1. (Z' +
        'ay'#305'f) seviden '#231#246'z'#252'lmeye '#231'al'#305#351#305'l'#305'r (Ctrl+Alt+O).'
      ''
      
        #9'Yeni Bulmaca Olu'#351'tur'#9': Verilen t'#252'm de'#287'erler silinerek bo'#351' yeni ' +
        'bir bulmaca olu'#351'turulur (Ctrl+N).'
      
        #9'A'#231#9#9#9#9': Daha '#246'nceden olu'#351'turulmu'#351' ve dosya olarak kay'#305't edilmi'#351 +
        ' bulmacay'#305' y'#252'kler (Ctrl+O).'
      
        #9'Tekrar Y'#252'kle'#9#9': '#220'zerinde '#231'al'#305#351#305'lan bulmaca dosyas'#305'n'#305' kay'#305't edil' +
        'mi'#351' son haliyle y'#252'kler (F3).'
      
        #9'Kaydet'#9#9#9': '#220'zerinde '#231'al'#305#351#305'lan bulmaca dosyas'#305'n'#305'n son halini kay' +
        #305't eder (Ctrl+S veya F2).'
      
        #9'Farkl'#305' Kaydet'#9#9': Bulmacan'#305'n son durumunu ba'#351'ka bir dosya olu'#351'tu' +
        'rarak kay'#305't eder (F12).'
      ''
      
        #9'Bulmaca Olu'#351'tur'#9#9': Rarsgele de'#287'erler girerek bulmaca olu'#351'turur ' +
        '(Ctrl+B).'
      
        #9'Gereksiz De'#287'erleri Sil'#9': Bir bulmacada verilen de'#287'erlerden hang' +
        'ileri gereksiz ise onlar'#305' bulmacadan siler (Ctrl+Alt+G).'
      ''
      #9'Yard'#305'm'#9#9#9': Program'#305'n nas'#305'l '#231'al'#305#351't'#305#287#305'n'#305' anlat'#305'r (F1).'
      #9'Hakk'#305'nda'#9#9#9': Program hakk'#305'nda bilgi verir (Ctrl+H).'
      ''
      #9'Kapat'#9#9#9': Program'#305' kapat'#305'r (Esc).'
      ''
      
        #9'Program'#305'n standart kullan'#305'm '#351'ekli, say'#305'lar girildikten sonra F9' +
        ' tu'#351'una basarak '#231#246'z'#252'me ula'#351#305'lmaya '#231'al'#305#351#305'l'#305'r. De'#287'eri d'#305#351'ar'#305'dan gi' +
        'rilen say'#305'lar renkli (mavi), hesaplanarak bulunan say'#305'lar ise si' +
        'yah yaz'#305'l'#305'r. '
      ''
      
        #9'Bir bulmaca sorusu olu'#351'turmak i'#231'in '#246'nce varsa de'#287'erlerin silinm' +
        'esi i'#231'in "Yeni Bulmaca Olu'#351'tur" se'#231'ene'#287'i kullan'#305'l'#305'r. E'#287'er bulmac' +
        'a bo'#351'sa hi'#231' de'#287'er girilmedi ise veya '#246'zel olarak elle verilmi'#351' d' +
        'e'#287'erler silinmesin isteniyorsa bu se'#231'enek kullan'#305'lmamal'#305'd'#305'r. Dah' +
        'a sonra "Bulmaca Olu'#351'tur" se'#231'ene'#287'i ile rasgele de'#287'erler olu'#351'turu' +
        'lur. E'#287'er bir hatal'#305' de'#287'er '#252'retimi olu'#351'ursa i'#351'lem ba'#351'ar'#305'l'#305' olana' +
        ' kadar bu se'#231'enek kullan'#305'lmal'#305'd'#305'r. En son olarak ta "Gereksiz De' +
        #287'erleri Sil" se'#231'ene'#287'i kullan'#305'larak bu say'#305'lar aras'#305'ndan gerekmey' +
        'enler silinir. B'#252't'#252'n bu i'#351'lemlerden sonra geride kalan say'#305'larda' +
        'n '#231#246'z'#252'm sadece 1 tane olur. Yani Ekranda bir bulmaca durmaktad'#305'r' +
        '.')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
  end
  object ActionList1: TActionList
    Left = 384
    Top = 8
    object BulmacaOlustur: TAction
      Category = 'Dosya'
      Caption = 'Bulmaca Olu'#351'tur'
      Hint = 'De'#287'erleri verilmi'#351' yeni bir bulmaca olu'#351'turur.'
      ShortCut = 16450
      OnExecute = BulmacaOlusturExecute
    end
    object GereksizDegerleriSil: TAction
      Category = 'Dosya'
      Caption = 'Gereksiz De'#287'erleri Sil'
      Hint = 'Verilen de'#287'erlerden olmasada '#231'a'#246#252'lebilecekse o de'#287'erler silinir.'
      ShortCut = 49223
      OnExecute = GereksizDegerleriSilExecute
    end
    object OlanDegerler: TAction
      Category = 'Yard'#305'm'
      Caption = 'Olan De'#287'erler'
      Hint = 'Se'#231'ili h'#252'creye yaz'#305'labilen rakamlar listesini verir.'
      ShortCut = 117
      OnExecute = OlanDegerlerExecute
    end
    object incele: TAction
      Category = 'Yard'#305'm'
      Caption = 'De'#287'erleri '#304'ncele'
      Hint = 'Bulmacan'#305'n geni'#351' kapsaml'#305' incelenmesi i'#231'in yeni form a'#231'ar.'
      ShortCut = 116
      OnExecute = inceleExecute
    end
    object Otomatik: TAction
      Category = 'Hesapla'
      Caption = 'Otomatik '#199#246'z'
      Hint = 'Zay'#305'f algoritma kullan'#305'larak '#231#246'z'#252'm yap'#305'l'#305'r.'
      ShortCut = 49231
      OnExecute = OtomatikExecute
    end
    object HizliCoz: TAction
      Category = 'Hesapla'
      Caption = 'H'#305'zl'#305' '#199#246'z'
      ShortCut = 49224
      OnExecute = HizliCozExecute
    end
    object Hesapla: TAction
      Category = 'Hesapla'
      Caption = 'Bulmacay'#305' '#199#246'z'
      Hint = 'Bulmacay'#305' '#231#246'zmek i'#231'in hesaplar.'
      ShortCut = 120
      OnExecute = HesaplaExecute
    end
    object YardimBilgileri: TAction
      Category = 'Yard'#305'm'
      Caption = 'Yard'#305'm'
      ShortCut = 112
      OnExecute = YardimBilgileriExecute
    end
    object DenemeYanilma: TAction
      Category = 'Hesapla'
      Caption = 'Deneme Yan'#305'lma ile '#199#246'z'
      Hint = 
        'Bulmacay'#305' deneme yan'#305'lma y'#246'ntemiyle '#231#246'zer. {'#199#246'z'#252'm 1'#39'den fazla is' +
        'e onlar tesbit edilir.}'
      ShortCut = 16504
      OnExecute = DenemeYanilmaExecute
    end
    object YeniBulmacaOlustur: TAction
      Category = 'Dosya'
      Caption = 'Yeni Bulmaca Olu'#351'tur'
      Hint = 'Bo'#351' bir bulmaca olu'#351'turmak i'#231'in kullan'#305'l'#305'r.'
      ShortCut = 16462
      OnExecute = YeniBulmacaOlusturExecute
    end
    object Kontrol: TAction
      Category = 'Hesapla'
      Caption = 'Kontrol Et'
      Hint = 'Bulmaca dolmu'#351'sa do'#287'ru olup olmad'#305#287#305' tesbit edilir.'
      ShortCut = 16459
      OnExecute = KontrolExecute
    end
    object DenemeyiDurdur: TAction
      Category = 'Hesapla'
      Caption = 'Denemeyi Durdur'
      Hint = 'Deneme yan'#305'lma i'#351'lemini yar'#305'da keser.'
      ShortCut = 16452
      OnExecute = DenemeyiDurdurExecute
    end
    object Yukle: TAction
      Category = 'Dosya'
      Caption = 'A'#231
      Hint = 'Dosyadan bulmaca y'#252'kler.'
      ShortCut = 16463
      OnExecute = YukleExecute
    end
    object TekrarYukle: TAction
      Category = 'Dosya'
      Caption = 'Tekrar Y'#252'kle'
      Hint = 'Son y'#252'klenen bulmacay'#305' tekrar ayn'#305' dosyadan y'#252'kler.'
      ShortCut = 114
      OnExecute = TekrarYukleExecute
    end
    object SonDenemeTekrari: TAction
      Category = 'Hesapla'
      Caption = 'Son Denemeyi '#304'ptal Et'
      Hint = 'Denemede son verilen say'#305' tekrar verilir.'
      ShortCut = 49272
      OnExecute = SonDenemeTekrariExecute
    end
    object EtkisizSeviye: TAction
      Category = 'Seviye'
      Caption = 'Etkisiz'
      ShortCut = 16453
      OnExecute = EtkisizSeviyeExecute
    end
    object Kaydet: TAction
      Category = 'Dosya'
      Caption = 'Kaydet'
      Hint = 'Bulmacay'#305' dosyaya kay'#305't eder.'
      ShortCut = 16467
      OnExecute = KaydetExecute
    end
    object FarkliKaydet: TAction
      Category = 'Dosya'
      Caption = 'FarkliKaydet'
      Hint = 'Bulmacay'#305' farkl'#305' bir dosya olu'#351'turarak kay'#305't eder.'
      ShortCut = 123
      OnExecute = FarkliKaydetExecute
    end
    object Kapat: TAction
      Category = 'Dosya'
      Caption = 'Kapat'
      Hint = 'Program'#305' kapat'#305'r.'
      ShortCut = 27
      OnExecute = KapatExecute
    end
    object DegerVer: TAction
      Category = 'De'#287'erlendir'
      Caption = 'De'#287'er Ver'
      Hint = 'Se'#231'ili h'#252'creye de'#287'er verir.'
      ShortCut = 16397
      OnExecute = DegerVerExecute
    end
    object Hakkinda: TAction
      Category = 'Yard'#305'm'
      Caption = 'Hakk'#305'nda'
      Hint = 'Program hakk'#305'nda billgi verir.'
      ShortCut = 16456
      OnExecute = HakkindaExecute
    end
    object GeriAl: TAction
      Category = 'D'#252'zen'
      Caption = 'Geri Al'
      Hint = 'Verilen son de'#287'eri siler.'
      ShortCut = 32776
      OnExecute = GeriAlExecute
    end
    object HesaplananDegerleriiptalEt: TAction
      Category = 'D'#252'zen'
      Caption = 'Hesaplanan De'#287'erleri '#304'ptal Et'
      Hint = 
        'Girilen de'#287'erlerden sonra hesaplanan say'#305'lar'#305'n silinmesini sa'#287'la' +
        'r.'
      ShortCut = 49179
      OnExecute = HesaplananDegerleriiptalEtExecute
    end
    object ZayifSeviye: TAction
      Category = 'Seviye'
      Caption = 'Zay'#305'f'
      ShortCut = 16474
      OnExecute = ZayifSeviyeExecute
    end
    object OrtaSeviye: TAction
      Category = 'Seviye'
      Caption = 'Orta'
      ShortCut = 16468
      OnExecute = OrtaSeviyeExecute
    end
    object GucluSeviye: TAction
      Category = 'Seviye'
      Caption = 'G'#252#231'l'#252
      ShortCut = 16455
      OnExecute = GucluSeviyeExecute
    end
    object KacTaneDegerGirildi: TAction
      Category = 'Yard'#305'm'
      Caption = 'Ka'#231' Tane De'#287'er Girildi'
      ShortCut = 118
      OnExecute = KacTaneDegerGirildiExecute
    end
  end
  object YardimciMenu: TPopupMenu
    OnChange = YardimciMenuChange
    Left = 416
    Top = 8
    object DeerVer1: TMenuItem
      Action = DegerVer
    end
    object GeriAl1: TMenuItem
      Action = GeriAl
    end
    object HesaplananDeerleriptalEt1: TMenuItem
      Action = HesaplananDegerleriiptalEt
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Deerlerincele1: TMenuItem
      Action = incele
    end
    object OlanDeerler1: TMenuItem
      Action = OlanDegerler
    end
    object KontrolEt1: TMenuItem
      Action = Kontrol
    end
    object Seviye1: TMenuItem
      Caption = 'Seviye'
      object Etkisiz1: TMenuItem
        Action = EtkisizSeviye
      end
      object Zayf1: TMenuItem
        Action = ZayifSeviye
      end
      object OrtaSeviye1: TMenuItem
        Action = OrtaSeviye
      end
      object Gl1: TMenuItem
        Action = GucluSeviye
      end
    end
    object Hesapla1: TMenuItem
      Action = Hesapla
    end
    object DenemeYanlmailez1: TMenuItem
      Action = DenemeYanilma
    end
    object SonDenemeyiTekrarYap1: TMenuItem
      Action = SonDenemeTekrari
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Hzlz1: TMenuItem
      Action = HizliCoz
    end
    object Otomatikz1: TMenuItem
      Action = Otomatik
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Temizle1: TMenuItem
      Action = YeniBulmacaOlustur
    end
    object Ykle1: TMenuItem
      Action = Yukle
    end
    object TekrarYkle1: TMenuItem
      Action = TekrarYukle
    end
    object Kaydet1: TMenuItem
      Action = Kaydet
    end
    object FarkliKaydet1: TMenuItem
      Action = FarkliKaydet
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object BulmacaOlutur1: TMenuItem
      Action = BulmacaOlustur
    end
    object GereksizleriSil1: TMenuItem
      Action = GereksizDegerleriSil
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Yardm1: TMenuItem
      Action = YardimBilgileri
    end
    object Hakknda1: TMenuItem
      Action = Hakkinda
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object DeerVer2: TMenuItem
      Action = Kapat
    end
  end
  object DosyaAc: TOpenDialog
    Left = 448
    Top = 8
  end
  object DosyaKaydet: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 480
    Top = 8
  end
  object ApplicationEvents1: TApplicationEvents
    OnShowHint = ApplicationEvents1ShowHint
    Left = 512
    Top = 8
  end
end
