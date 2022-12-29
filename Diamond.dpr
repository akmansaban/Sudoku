program Diamond;

uses
  Forms,
  DiamondClasses in 'DiamondClasses.pas',
  form_diamond_ana in 'form_diamond_ana.pas' {FormDiamondAna},
  form_diamond_liste in 'form_diamond_liste.pas' {FormDiamondListe};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormDiamondAna, FormDiamondAna);
  Application.Run;
end.
