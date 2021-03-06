unit PokemonTypenHelfer;
//Copyright Sebastian Seidel, github.com/Sseidel248, 26.05.2020
//Sseidel248@yahoo.de
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, RichEdit;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ComboBoxAngriff: TComboBox;
    ComboBoxVerteidigung: TComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    LTypGeg1: TLabel;
    LTypEig1: TLabel;
    LTypGeg2: TLabel;
    LTypEig2: TLabel;
    ComboBoxAngriff2: TComboBox;
    ComboBoxVerteidigung2: TComboBox;
    clearBtnGeg: TButton;
    clearBtnAng: TButton;
    procedure ComboBoxAngriffDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ComboBoxVerteidigungDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ComboBoxAngriffChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxVerteidigungChange(Sender: TObject);
    procedure ComboBoxAngriff2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ComboBoxVerteidigung2DrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure ComboBoxAngriff2Change(Sender: TObject);
    procedure ComboBoxVerteidigung2Change(Sender: TObject);
    procedure clearBtnGegClick(Sender: TObject);
    procedure clearBtnAngClick(Sender: TObject);
//    procedure ComboBoxAngriffCloseUp(Sender: TObject);
//    procedure RichEdit1Change(Sender: TObject);
//    procedure ComboBoxAngriffClick(Sender: TObject);
//    procedure ComboBoxAngriffSelect(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  isGegPokFertig : Boolean;
  isOwnPokFertig : Boolean;

  Farbe_Normal :TColor;
  Farbe_Feuer  :TColor;
  Farbe_Wasser :TColor;
  Farbe_Pflanze:TColor;
  Farbe_Elektro:TColor;

  Farbe_Eis    :TColor;
  Farbe_Kampf  :TColor;
  Farbe_Gift   :TColor;
  Farbe_Boden  :TColor;
  Farbe_Flug   :TColor;

  Farbe_Psycho :TColor;
  Farbe_K�fer  :TColor;
  Farbe_Gestein:TColor;
  Farbe_Geist  :TColor;
  Farbe_Drache :TColor;

  Farbe_Unlicht:TColor;
  Farbe_Stahl  :TColor;
  Farbe_Fee    :TColor;

Const
SEHR_EFFEKTIV='"Sehr Effektiv (x2):";';
NICHT_EFFEKTIV='"Nicht Effektiv (x0.5):";';
KEINE_WIRKUNG='"Keine Wirkung:";';

SC_SE_4='Sehr Effektiv (x4):';
SC_SE='Sehr Effektiv (x2):';
SC_E_1='Normal Effektiv (1x):';
SC_NE='Nicht Effektiv (x0.5):';
SC_NE_0_25='Nicht Effektiv (x0.25):';
SC_KW='Keine Wirkung:';
//Angreifendes Pokemon
Own_Normal=NICHT_EFFEKTIV+'Gestein;Stahl;'+KEINE_WIRKUNG+'Geist';

Own_Feuer=SEHR_EFFEKTIV+'Pflanze;Eis;K�fer;Stahl;'+NICHT_EFFEKTIV+'Feuer;Wasser;Gestein;Drache';

Own_Wasser=SEHR_EFFEKTIV+'Feuer;Boden;Gestein;'+NICHT_EFFEKTIV+'Wasser;Pflanze;Drache';

Own_Pflanze=SEHR_EFFEKTIV+'Wasser;Boden;Gestein;'+NICHT_EFFEKTIV+'Feuer;Pflanze;Gift;Flug;K�fer;Drache;Stahl';

Own_Elektro=SEHR_EFFEKTIV+'Wasser;Flug;'+NICHT_EFFEKTIV+'Pflanze;Elektro;Drache;'+KEINE_WIRKUNG+'Boden';

Own_Eis   =SEHR_EFFEKTIV+'Pflanze;Boden;Flug;Drache;'+NICHT_EFFEKTIV+'Feuer;Wasser;Eis;Stahl';

Own_Kampf =SEHR_EFFEKTIV+'Normal;Eis;Gestein;Unlicht;Stahl;'+NICHT_EFFEKTIV+'Gift;Flug;Psycho;K�fer;Fee;'+KEINE_WIRKUNG+'Geist';

Own_Gift  =SEHR_EFFEKTIV+'Pflanze;Fee;'+NICHT_EFFEKTIV+'Gift;Boden;Gestein;Geist;'+KEINE_WIRKUNG+'Stahl';

Own_Boden =SEHR_EFFEKTIV+'Feuer;Elektro;Gift;Gestein;Stahl;'+NICHT_EFFEKTIV+'Pflanze;K�fer;'+KEINE_WIRKUNG+'Flug';

Own_Flug   =SEHR_EFFEKTIV+'Pflanze;Kampf;K�fer;'+NICHT_EFFEKTIV+'Elektro;Gestein;Stahl';

Own_Psycho =SEHR_EFFEKTIV+'Kampf;Gift;'+NICHT_EFFEKTIV+'Psycho;Stahl;'+KEINE_WIRKUNG+'Unlicht';

Own_K�fer   =SEHR_EFFEKTIV+'Pflanze;Psycho;Unlicht;'+NICHT_EFFEKTIV+'Feuer;Kampf;Gift;Flug;Geist;Stahl;Fee';

Own_Gestein  =SEHR_EFFEKTIV+'Feuer;Eis;Flug;K�fer;'+NICHT_EFFEKTIV+'Kampf;Boden;Stahl';

Own_Geist    =SEHR_EFFEKTIV+'Psycho;Geist;'+NICHT_EFFEKTIV+'Unlicht;Stahl;'+KEINE_WIRKUNG+'Normal';

Own_Drache    =SEHR_EFFEKTIV+'Drache;'+NICHT_EFFEKTIV+'Stahl;'+KEINE_WIRKUNG+'Fee';

Own_Unlicht  =SEHR_EFFEKTIV+'Psycho;Geist;'+NICHT_EFFEKTIV+'Kampf;Unlicht;Stahl;Fee';

Own_Stahl     =SEHR_EFFEKTIV+'Eis;Gestein;Fee;'+NICHT_EFFEKTIV+'Wasser;Pflanze;Stahl';

Own_Fee     =SEHR_EFFEKTIV+'Kampf;Drache;Unlicht;'+NICHT_EFFEKTIV+'Feuer;Gift;Stahl';
//Verteidigendes Pokemon
Def_Normal=SEHR_EFFEKTIV+'Kampf;'+KEINE_WIRKUNG+'Geist';

Def_Feuer=SEHR_EFFEKTIV+'Wasser;Boden;Gestein;'+NICHT_EFFEKTIV+'Feuer;Pflanze;Eis;K�fer;Stahl;Fee';

Def_Wasser=SEHR_EFFEKTIV+'Pflanze;Elektro;'+NICHT_EFFEKTIV+'Feuer;Wasser;Eis;Stahl';

Def_Pflanze=SEHR_EFFEKTIV+'Feuer;Eis;Gift;Flug;K�fer;'+NICHT_EFFEKTIV+'Wasser;Pflanze;Elektro;Boden';

Def_Elektro=SEHR_EFFEKTIV+'Boden;'+NICHT_EFFEKTIV+'Elektro;Flug';

Def_Eis   =SEHR_EFFEKTIV+'Feuer;Kampf;Gestein;Stahl;'+NICHT_EFFEKTIV+'Eis';

Def_Kampf =SEHR_EFFEKTIV+'Flug;Psycho;Fee;'+NICHT_EFFEKTIV+'K�fer;Gestein;Unlicht';

Def_Gift  =SEHR_EFFEKTIV+'Boden;Psycho;'+NICHT_EFFEKTIV+'Pflanze;Kampf;Gift;K�fer;Fee';

Def_Boden =SEHR_EFFEKTIV+'Wasser;Pflanze;Eis;'+NICHT_EFFEKTIV+'Gift;Gestein;'+KEINE_WIRKUNG+'Elektro';

Def_Flug   =SEHR_EFFEKTIV+'Elektro;Eis;Gestein;'+NICHT_EFFEKTIV+'Pflanze;Kampf;K�fer;'+KEINE_WIRKUNG+'Boden';

Def_Psycho =SEHR_EFFEKTIV+'K�fer;Geist;Unlicht;'+NICHT_EFFEKTIV+'Kampf;Psycho';

Def_K�fer   =SEHR_EFFEKTIV+'Feuer;Flug;Gestein;'+NICHT_EFFEKTIV+'Pflanze;Kampf;Boden';

Def_Gestein  =SEHR_EFFEKTIV+'Wasser;Pflanze;Kampf;Boden;Stahl;'+NICHT_EFFEKTIV+'Normal;Feuer;Gift;Flug';

Def_Geist    =SEHR_EFFEKTIV+'Geist;Unlicht;'+NICHT_EFFEKTIV+'Gift;K�fer;'+KEINE_WIRKUNG+'Normal;Kampf';

Def_Drache    =SEHR_EFFEKTIV+'Eis;Drache;Fee;'+NICHT_EFFEKTIV+'Feuer;Wasser;Pflanze;Elektro';

Def_Unlicht  =SEHR_EFFEKTIV+'Kampf;K�fer;Fee;'+NICHT_EFFEKTIV+'Geist;Unlicht;'+KEINE_WIRKUNG+'Psycho';

Def_Stahl     =SEHR_EFFEKTIV+'Feuer;Kampf;Boden;'+NICHT_EFFEKTIV+'Normal;Pflanze;Eis;Flug;Psycho;K�fer;Gestein;Geist;Drache;Unlicht;Stahl;Fee;'+KEINE_WIRKUNG+'Gift';

Def_Fee     =SEHR_EFFEKTIV+'Gift;Stahl;'+NICHT_EFFEKTIV+'Kampf;K�fer;Unlicht;'+KEINE_WIRKUNG+'Drache';

implementation

{$R *.dfm}
{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:Setzt die Combobox eintr�ge entsprechend dem Index
-----------------------------------------------------------------------------}
function SetComboBoxColor(Index : Integer): TColor;
begin

  if Index = 0 then
  begin
    Result := clWhite;
  end
  else
  begin
    if Index = 1 then
      Result:= Farbe_Normal;
    if Index = 2 then
      Result:= Farbe_Feuer ;
    if Index = 3 then
      Result:= Farbe_Wasser ;
    if Index = 4 then
      Result:= Farbe_Pflanze ;
    if Index = 5 then
      Result := Farbe_Elektro ;

    if Index = 6 then
      Result := Farbe_Eis;
    if Index = 7 then
      Result := Farbe_Kampf;
    if Index = 8 then
      Result := Farbe_Gift;
    if Index = 9 then
      Result := Farbe_Boden;
    if Index = 10 then
      Result := Farbe_Flug;

    if Index = 11 then
      Result := Farbe_Psycho;
    if Index = 12 then
      Result := Farbe_K�fer;
    if Index = 13 then
      Result := Farbe_Gestein;
    if Index = 14 then
      Result := Farbe_Geist;
    if Index = 15 then
      Result := Farbe_Drache;

    if Index = 16 then
      Result := Farbe_Unlicht;
    if Index = 17 then
      Result := Farbe_Stahl;
    if Index = 18 then
      Result := Farbe_Fee;
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:holt den Typen String (eigenes pokemon)
-----------------------------------------------------------------------------}
function GetTypenOwn(TypNr : Integer):String;
begin
  if TypNr = 0 then
  begin
    Result := '';
  end
  else
  begin
    if TypNr = 1 then
      Result:= Own_Normal;
    if TypNr = 2 then
      Result:= Own_Feuer ;
    if TypNr = 3 then
      Result:= Own_Wasser;
    if TypNr = 4 then
      Result:= Own_Pflanze;
    if TypNr = 5 then
      Result :=Own_Elektro;

    if TypNr = 6 then
      Result := Own_Eis;
    if TypNr = 7 then
      Result := Own_Kampf;
    if TypNr = 8 then
      Result := Own_Gift;
    if TypNr = 9 then
      Result := Own_Boden;
    if TypNr = 10 then
      Result := Own_Flug;

    if TypNr = 11 then
      Result := Own_Psycho;
    if TypNr = 12 then
      Result := Own_K�fer;
    if TypNr = 13 then
      Result := Own_Gestein;
    if TypNr = 14 then
      Result := Own_Geist;
    if TypNr = 15 then
      Result := Own_Drache;

    if TypNr = 16 then
      Result := Own_Unlicht;
    if TypNr = 17 then
      Result := Own_Stahl;
    if TypNr = 18 then
      Result := Own_Fee;
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:holt den Typen String (gegnerisches pokemon)
-----------------------------------------------------------------------------}
function GetTypenDef(TypNr : Integer):String;
begin
  if TypNr = 0 then
  begin
    Result := '';
  end
  else
  begin
    if TypNr = 1 then
      Result:= Def_Normal;
    if TypNr = 2 then
      Result:= Def_Feuer ;
    if TypNr = 3 then
      Result:= Def_Wasser;
    if TypNr = 4 then
      Result:= Def_Pflanze;
    if TypNr = 5 then
      Result :=Def_Elektro;

    if TypNr = 6 then
      Result := Def_Eis;
    if TypNr = 7 then
      Result := Def_Kampf;
    if TypNr = 8 then
      Result := Def_Gift;
    if TypNr = 9 then
      Result := Def_Boden;
    if TypNr = 10 then
      Result := Def_Flug;

    if TypNr = 11 then
      Result := Def_Psycho;
    if TypNr = 12 then
      Result := Def_K�fer;
    if TypNr = 13 then
      Result := Def_Gestein;
    if TypNr = 14 then
      Result := Def_Geist;
    if TypNr = 15 then
      Result := Def_Drache;

    if TypNr = 16 then
      Result := Def_Unlicht;
    if TypNr = 17 then
      Result := Def_Stahl;
    if TypNr = 18 then
      Result := Def_Fee;
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:mal die entsprechenden Farben ins Richedit
-----------------------------------------------------------------------------}
procedure HighlightTyps(RichEdit : TRichEdit; AColor : TColor; LineNum: Integer);
var
Format:Charformat2;
maxLen:Integer;
  I: Integer;
begin
  FillChar(Format, SizeOf(Format), 0);
  maxLen:=20;
  with Format do
  begin

    repeat
      RichEdit.Lines[LineNum]:=concat(RichEdit.Lines[LineNum],' ');
    until (Length(RichEdit.Lines[LineNum]) = 20);
//    for I := Length(RichEdit.Lines[LineNum]) to 20 do
//    begin
////      if I < Length(RichEdit.Lines[LineNum]) then
////        Continue
////      else
//        RichEdit.Lines[LineNum]:=concat(RichEdit.Lines[LineNum],' ');
//    end;

    cbSize:=SizeOf(Format);
    dwMask:=CFM_BackCOLOR;
    crBackColor:=AColor;
//    crTextColor:=clWhite;
    RichEdit.SelStart := RichEdit.Perform(EM_LINEINDEX, LineNum, 0);
    RichEdit.SelLength := Length(RichEdit.Lines[LineNum]);
    RichEdit.SelAttributes.Color:=clWhite;
    RichEdit.Perform(EM_SETCHARFORMAT, SCF_SELECTION, longint(@Format));
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:Setzt die Farben von den Typen
-----------------------------------------------------------------------------}
procedure SetColor(RichEdit: TRichEdit; I : Integer);
begin
      if RichEdit.Lines[I].Equals('Normal') then
      HighlightTyps(RichEdit,Farbe_Normal,I);
    if RichEdit.Lines[I].Equals('Feuer') then
      HighlightTyps(RichEdit,Farbe_Feuer,I);
    if RichEdit.Lines[I].Equals('Wasser') then
      HighlightTyps(RichEdit,Farbe_Wasser,I);
    if RichEdit.Lines[I].Equals('Pflanze') then
      HighlightTyps(RichEdit,Farbe_Pflanze,I);
    if RichEdit.Lines[I].Equals('Elektro') then
      HighlightTyps(RichEdit,Farbe_Elektro,I);

    if RichEdit.Lines[I].Equals('Eis') then
      HighlightTyps(RichEdit,Farbe_Eis,I);
    if RichEdit.Lines[I].Equals('Kampf') then
      HighlightTyps(RichEdit,Farbe_Kampf,I);
    if RichEdit.Lines[I].Equals('Gift') then
      HighlightTyps(RichEdit,Farbe_Gift,I);
    if RichEdit.Lines[I].Equals('Boden') then
      HighlightTyps(RichEdit,Farbe_Boden,I);
    if RichEdit.Lines[I].Equals('Flug') then
      HighlightTyps(RichEdit,Farbe_Flug,I);

    if RichEdit.Lines[I].Equals('Psycho') then
      HighlightTyps(RichEdit,Farbe_Psycho,I);
    if RichEdit.Lines[I].Equals('K�fer') then
      HighlightTyps(RichEdit,Farbe_K�fer,I);
    if RichEdit.Lines[I].Equals('Gestein') then
      HighlightTyps(RichEdit,Farbe_Gestein,I);
    if RichEdit.Lines[I].Equals('Geist') then
      HighlightTyps(RichEdit,Farbe_Geist,I);
    if RichEdit.Lines[I].Equals('Drache') then
      HighlightTyps(RichEdit,Farbe_Drache,I);

    if RichEdit.Lines[I].Equals('Unlicht') then
      HighlightTyps(RichEdit,Farbe_Unlicht,I);
    if RichEdit.Lines[I].Equals('Stahl') then
      HighlightTyps(RichEdit,Farbe_Stahl,I);
    if RichEdit.Lines[I].Equals('Fee') then
      HighlightTyps(RichEdit,Farbe_Fee,I);
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:setzt die entsprechende Zeile auf fett
-----------------------------------------------------------------------------}
procedure SetFontStyle(RichEdit : TRichEdit;LineNum: Integer);
begin
  RichEdit.SelStart := RichEdit.Perform(EM_LINEINDEX,LineNum,0);
  RichEdit.SelLength := Length(RichEdit.Lines[LineNum]);
  RichEdit.SelAttributes.Style := [fsBold];
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:vergleicht eine Liste mit dem gegebenen (2x) , (1x), (0.5x) und
        keine Wirkung Liste udn f�gt sie entsprechenden Listen hinzu
-----------------------------------------------------------------------------}
procedure CompareThisWithList2(SrcListType:TStrings;
                                ListType2_2x, ListType2Normal, ListType2_05x, ListType2_0x:TStrings;
                                var SL_I,SL_II,SL_III,SL_IV: TStrings);
var
  I,L: Integer;
begin
  for I := 0 to SrcListType.Count-1 do
  begin
    for L := 0 to ListType2_2x.Count-1 do
    begin
      if SrcListType[I].Contains(ListType2_2x[L]) then
        SL_I.Add(SrcListType[I]);
    end;

    for L := 0 to ListType2Normal.Count-1 do
    begin
      if SrcListType[I].Contains(ListType2Normal[L]) then
        SL_II.Add(SrcListType[I]);
    end;

    for L := 0 to ListType2_05x.Count-1 do
    begin
      if SrcListType[I].Contains(ListType2_05x[L]) then
        SL_III.Add(SrcListType[I]);
    end;

    for L := 0 to ListType2_0x.Count-1 do
    begin
      if SrcListType[I].Contains(ListType2_0x[L]) then
        SL_IV.Add(SrcListType[I]);
    end;
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:vergleicht eine Liste von der 1. Typ mit der Liste vom 2. Typ
        um damit die Komi Liste zu erstellen
-----------------------------------------------------------------------------}
function CompareTypList1TypList2(ListType1, ListType2 : TStrings) : TStrings;
var
ResultList, ListAllTypes: TStrings;
ListType1Normal, ListType2Normal : TStrings;
ListType1_2x, ListType1_05x, ListType1_0x, ListType2_2x, ListType2_05x, ListType2_0x: TStrings;
SL_4x,SL_2x,SL_1x,SL_05x,SL_025x, SL_0x : TStrings;
Idx_typ1_2x,Idx_typ1_05x,Idx_typ1_0x : Integer;
Idx_typ2_2x,Idx_typ2_05x,Idx_typ2_0x : Integer;
L1, PosOfStr: Integer;
L2: Integer;
I,L: Integer;
StrType:String;
begin
  ResultList:=TStringList.Create;
  ListAllTypes:=TStringList.Create;
  ListType1Normal:=TStringList.Create;
  ListType2Normal:=TStringList.Create;
  ListType1_2x   :=TStringList.Create;
  ListType1_05x  :=TStringList.Create;
  ListType1_0x   :=TStringList.Create;
  ListType2_2x   :=TStringList.Create;
  ListType2_05x  :=TStringList.Create;
  ListType2_0x   :=TStringList.Create;
  SL_4x:=TStringList.Create;
  SL_2x:=TStringList.Create;
  SL_1x:=TStringList.Create;
  SL_05x:=TStringList.Create;
  SL_025x:=TStringList.Create;
  SL_0x:=TStringList.Create;
  Result:=TStringList.Create;
  try
    //Titel Initialisieren z.B. Sehr Effektiv (2x:)
    SL_4x.Add(SC_SE_4);
    SL_2x.Add(SC_SE);
    SL_1x.Add(SC_E_1);
    SL_05x.Add(SC_NE);
    SL_025x.Add(SC_NE_0_25);
    SL_0x.Add(SC_KW);

    //erstellen einer Liste mit allen Typen
    ListAllTypes.Add('Normal');
    ListAllTypes.Add('Feuer');
    ListAllTypes.Add('Wasser');
    ListAllTypes.Add('Pflanze');
    ListAllTypes.Add('Elektro');
    ListAllTypes.Add('Eis');
    ListAllTypes.Add('Kampf');
    ListAllTypes.Add('Gift');
    ListAllTypes.Add('Boden');
    ListAllTypes.Add('Flug');
    ListAllTypes.Add('Psycho');
    ListAllTypes.Add('K�fer');
    ListAllTypes.Add('Gestein');
    ListAllTypes.Add('Geist');
    ListAllTypes.Add('Drache');
    ListAllTypes.Add('Unlicht');
    ListAllTypes.Add('Stahl');
    ListAllTypes.Add('Fee');

    //erstellen der Normal Effektiv Listen von Typ1 und Typ2
    for I := 0 to ListAllTypes.Count-1 do
    begin
      StrType:=ListAllTypes[I];

      if ListType1.Text.IndexOf(StrType)=-1 then
        ListType1Normal.Add(StrType);

      if ListType2.Text.IndexOf(StrType)=-1 then
        ListType2Normal.Add(StrType);
    end;

    //holen der IndexStellen von den Titeln
    Idx_typ1_2x  :=ListType1.IndexOf(SC_SE);
    Idx_typ1_05x :=ListType1.IndexOf(SC_NE);
    Idx_typ1_0x  :=ListType1.IndexOf(SC_KW);

    Idx_typ2_2x  :=ListType2.IndexOf(SC_SE);
    Idx_typ2_05x :=ListType2.IndexOf(SC_NE);
    Idx_typ2_0x  :=ListType2.IndexOf(SC_KW);

    //erstellen der Effektivit�tsListen von ListType1 und ListType2
    for I := 0 to ListType1.Count-1 do
    begin
      if (Idx_typ1_2x<>-1) and (Idx_typ1_05x<>-1) and (Idx_typ1_0x<>-1) then
      begin
        if (I>Idx_typ1_2x) and (I<Idx_typ1_05x) then
          ListType1_2x.Add(ListType1[I]);
        if (I>Idx_typ1_05x) and (I<Idx_typ1_0x) then
          ListType1_05x.Add(ListType1[I]);
        if (I>Idx_typ1_0x) then
          ListType1_0x.Add(ListType1[I]);
      end
      else if (Idx_typ1_2x<>-1)  and (Idx_typ1_0x<>-1) then
      begin
        if (I>Idx_typ1_2x) and (I<Idx_typ1_0x) then
          ListType1_2x.Add(ListType1[I]);
        if (I>Idx_typ1_0x) then
          ListType1_0x.Add(ListType1[I]);
      end
      else if (Idx_typ1_05x<>-1) and (Idx_typ1_0x<>-1) then
      begin
        if (I>Idx_typ1_05x) and (I<Idx_typ1_0x) then
          ListType1_05x.Add(ListType1[I]);
        if (I>Idx_typ1_0x) then
          ListType1_0x.Add(ListType1[I]);
      end
      else if (Idx_typ1_2x<>-1) and (Idx_typ1_05x<>-1)  then
      begin
        if (I>Idx_typ1_2x) and (I<Idx_typ1_05x) then
          ListType1_2x.Add(ListType1[I]);
        if (I>Idx_typ1_05x) then
          ListType1_05x.Add(ListType1[I]);
      end;
    end;
    for I := 0 to ListType2.Count-1 do
    begin
      if (Idx_typ2_2x<>-1) and (Idx_typ2_05x<>-1) and (Idx_typ2_0x<>-1) then
      begin
        if (I>Idx_typ2_2x) and (I<Idx_typ2_05x) then
          ListType2_2x.Add(ListType2[I]);
        if (I>Idx_typ2_05x) and (I<Idx_typ2_0x) then
          ListType2_05x.Add(ListType2[I]);
        if (I>Idx_typ2_0x) then
          ListType2_0x.Add(ListType2[I]);
      end
      else if (Idx_typ2_2x<>-1)  and (Idx_typ2_0x<>-1) then
      begin
        if (I>Idx_typ2_2x) and (I<Idx_typ2_0x) then
          ListType2_2x.Add(ListType2[I]);
        if (I>Idx_typ2_0x) then
          ListType2_0x.Add(ListType2[I]);
      end
      else if (Idx_typ2_05x<>-1) and (Idx_typ2_0x<>-1) then
      begin
        if (I>Idx_typ2_05x) and (I<Idx_typ2_0x) then
          ListType2_05x.Add(ListType2[I]);
        if (I>Idx_typ2_0x) then
          ListType2_0x.Add(ListType2[I]);
      end
      else if (Idx_typ2_2x<>-1) and (Idx_typ2_05x<>-1)  then
      begin
        if (I>Idx_typ2_2x) and (I<Idx_typ2_05x) then
          ListType2_2x.Add(ListType2[I]);
        if (I>Idx_typ2_05x) then
          ListType2_05x.Add(ListType2[I]);
      end;
    end;

    //vergleich der Typenlisten
    CompareThisWithList2(ListType1_2x,ListType2_2x,ListType2Normal,ListType2_05x,ListType2_0x,
                          SL_4x,SL_2x,{SL_05x}SL_1x,SL_0x);
    CompareThisWithList2(ListType1Normal,ListType2_2x,ListType2Normal,ListType2_05x,ListType2_0x,
                          SL_2x,SL_1x,SL_05x,SL_0x);
    CompareThisWithList2(ListType1_05x,ListType2_2x,ListType2Normal,ListType2_05x,ListType2_0x,
                          SL_1x,SL_05x,SL_025x,SL_0x);
    CompareThisWithList2(ListType1_0x,ListType2_2x,ListType2Normal,ListType2_05x,ListType2_0x,
                          SL_0x,SL_0x,SL_0x,SL_0x);

    //�berpr�fe ob die Listen nur ein Element haben, wenn nein dann adde es in die ResultList
    if (SL_4x.Count-1)>0 then
      ResultList.AddStrings(SL_4x);
    if (SL_2x.Count-1)>0 then
      ResultList.AddStrings(SL_2x);
    if (SL_1x.Count-1)>0 then
      ResultList.AddStrings(SL_1x);
    if (SL_05x.Count-1)>0 then
      ResultList.AddStrings(SL_05x);
    if (SL_025x.Count-1)>0 then
      ResultList.AddStrings(SL_025x);
    if (SL_0x.Count-1)>0 then
      ResultList.AddStrings(SL_0x);

    Result.AddStrings(ResultList);
  finally
    ResultList.Free;
    ListAllTypes.Free;
    ListType1Normal.Free;
    ListType2Normal.Free;
    ListType1_2x.Free;
    ListType1_05x.Free;
    ListType1_0x.Free;
    ListType2_2x.Free;
    ListType2_05x.Free;
    ListType2_0x.Free;
    SL_4x.Free;
    SL_2x.Free;
    SL_1x.Free;
    SL_05x.Free;
    SL_025x.Free;
    SL_0x.Free;
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:s�ubert das Richedit2
-----------------------------------------------------------------------------}
procedure TForm1.clearBtnAngClick(Sender: TObject);
begin
  RichEdit2.Clear;
  ComboBoxVerteidigung.ItemIndex:=0;
  ComboBoxVerteidigung2.ItemIndex:=0;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:s�ubert das Richedit1
-----------------------------------------------------------------------------}
procedure TForm1.clearBtnGegClick(Sender: TObject);
begin
  RichEdit1.Clear;
  ComboBoxAngriff.ItemIndex:=0;
  ComboBoxAngriff2.ItemIndex:=0;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:bef�llt das Richedit entsprechend dem 2 gew�hlten Typen
        Sehr Effektiv(4x), Sehr effektiv (2x), Normal (1x), Nicht effektiv(0.5x),
        Nicht Effektiv (0.25x), keine Wirkung
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxAngriff2Change(Sender: TObject);
Var
input1, input2:String;
slTyp2, slTyp1,ResultList:TStrings;
I:Integer;
begin
  isGegPokFertig:=false;
  slTyp2:=TStringList.Create;
  slTyp1:=TStringList.Create;
  ResultList:=TStringList.Create;
  try
    input1:=GetTypenDef(ComboBoxAngriff2.ItemIndex);
    slTyp2.Delimiter := ';';   // Trennzeichen einstellen
    slTyp2.DelimitedText := input1; // Delphi die Arbeit amchen lassen
    input2:=GetTypenDef(ComboBoxAngriff.ItemIndex);
    slTyp1.Delimiter := ';';   // Trennzeichen einstellen
    slTyp1.DelimitedText := input2; // Delphi die Arbeit amchen lassen
    ResultList:=CompareTypList1TypList2(slTyp1,slTyp2);
    RichEdit1.Lines:=ResultList;
    for I := 0 to RichEdit1.Lines.Count-1 do
    begin
      if RichEdit1.Lines[I].Equals(SC_SE) or RichEdit1.Lines[I].Equals(SC_NE) or RichEdit1.Lines[I].Equals(SC_KW)
      or RichEdit1.Lines[I].Equals(SC_SE_4) or RichEdit1.Lines[I].Equals(SC_NE_0_25) or RichEdit1.Lines[I].Equals(SC_E_1) then
      begin
        SetFontStyle(RichEdit1,I);
      end;
      SetColor(RichEdit1,I);
    end;
  finally
    isGegPokFertig:=true;
    slTyp2.Free;
    slTyp1.free;
    ResultList.Free;
  end;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:F�rbt die Elemente der ComboBox
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxAngriff2DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
AColor : TColor;
begin
  if Index > 0 then
  begin
    AColor:=SetComboBoxColor(Index);
    ComboBoxAngriff2.Canvas.Brush.Color:=AColor;
  end;
  ComboBoxAngriff2.Font.Style:=[fsBold];
  ComboBoxAngriff2.Canvas.fillrect(Rect);
  ComboBoxAngriff2.Canvas.TextOut(Rect.left, Rect.top, ComboBoxAngriff2.Items[index]);
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:bef�llt das Richedit1 entsprechend dem gew�hlten Typ mit Sehr Effektiv
, Nicht Effektiv und Keine Wirkung
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxAngriffChange(Sender: TObject);
Var
input:String;
sl:TStrings;
I:Integer;
begin
  isGegPokFertig:=false;
  sl:=TStringList.Create;
  try
    input:=GetTypenDef(ComboBoxAngriff.ItemIndex);
    sl.Delimiter := ';';   // Trennzeichen einstellen
    sl.DelimitedText := input; // Delphi die Arbeit amchen lassen
    RichEdit1.Lines:=sl;
    for I := 0 to RichEdit1.Lines.Count-1 do
    begin
      if RichEdit1.Lines[I].Equals(SC_SE) or RichEdit1.Lines[I].Equals(SC_NE) or RichEdit1.Lines[I].Equals(SC_KW) then
      begin
        SetFontStyle(RichEdit1,I);
      end;
      SetColor(RichEdit1,I);
    end;
  finally
    isGegPokFertig:=true;
    sl.Free;
  end;
  //mal gucken wie man sich die passenden Typen holt!
  if ComboBoxAngriff.ItemIndex <> 0 then
    ComboBoxAngriff2.Enabled:= true
  else
  begin
    ComboBoxAngriff2.Enabled:=false;
    ComboBoxAngriff2.ItemIndex:=0;
  end;

  ComboBoxAngriff2.ItemIndex := 0;

end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:F�rbt die Elemente der ComboBox
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxAngriffDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
AColor : TColor;
begin
  if Index > 0 then
  begin
    AColor:=SetComboBoxColor(Index);
    ComboBoxAngriff.Canvas.Brush.Color:=AColor;
  end;
  ComboBoxAngriff.Font.Style:=[fsBold];
  ComboBoxAngriff.Canvas.fillrect(Rect);
  ComboBoxAngriff.Canvas.TextOut(Rect.left, Rect.top, ComboBoxAngriff.Items[index]);
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:bef�llt das Richedit entsprechend dem 2 gew�hlten Typen
        Sehr Effektiv(4x), Sehr effektiv (2x), Normal (1x), Nicht effektiv(0.5x),
        Nicht Effektiv (0.25x), keine Wirkung
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxVerteidigung2Change(Sender: TObject);
Var
input1, input2:String;
slTyp2, slTyp1,ResultList:TStrings;
I:Integer;
begin
  isGegPokFertig:=false;
  slTyp2:=TStringList.Create;
  slTyp1:=TStringList.Create;
  ResultList:=TStringList.Create;
  try
    input1:=GetTypenOwn(ComboBoxVerteidigung2.ItemIndex);
    slTyp2.Delimiter := ';';   // Trennzeichen einstellen
    slTyp2.DelimitedText := input1; // Delphi die Arbeit amchen lassen
    input2:=GetTypenOwn(ComboBoxVerteidigung.ItemIndex);
    slTyp1.Delimiter := ';';   // Trennzeichen einstellen
    slTyp1.DelimitedText := input2; // Delphi die Arbeit amchen lassen
    ResultList:=CompareTypList1TypList2(slTyp1,slTyp2);
    RichEdit2.Lines:=ResultList;
    for I := 0 to RichEdit2.Lines.Count-1 do
    begin
      if RichEdit2.Lines[I].Equals(SC_SE) or RichEdit2.Lines[I].Equals(SC_NE) or RichEdit2.Lines[I].Equals(SC_KW)
      or RichEdit2.Lines[I].Equals(SC_SE_4) or RichEdit2.Lines[I].Equals(SC_NE_0_25) or RichEdit2.Lines[I].Equals(SC_E_1) then
      begin
        SetFontStyle(RichEdit2,I);
      end;
      SetColor(RichEdit2,I);
    end;
  finally
    isGegPokFertig:=true;
    slTyp2.Free;
    slTyp1.free;
    ResultList.Free;
  end;
end;


{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:F�rbt die Elemente der ComboBox
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxVerteidigung2DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
AColor : TColor;
begin
  if Index > 0 then
  begin
    AColor:=SetComboBoxColor(Index);
    ComboBoxVerteidigung2.Canvas.Brush.Color:=AColor;
  end;
  ComboBoxVerteidigung2.Font.Style:=[fsBold];
  ComboBoxVerteidigung2.Canvas.fillrect(Rect);
  ComboBoxVerteidigung2.Canvas.TextOut(Rect.left, Rect.top, ComboBoxVerteidigung2.Items[index]);
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:bef�llt das Richedit1 entsprechend dem gew�hlten Typ mit Sehr Effektiv
, Nicht Effektiv und Keine Wirkung
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxVerteidigungChange(Sender: TObject);
Var
input:String;
sl:TStrings;
i:Integer;
begin
  sl:=TStringList.Create;
  try
    input:=GetTypenOwn(ComboBoxVerteidigung.ItemIndex);
    sl.Delimiter := ';';   // Trennzeichen einstellen
    sl.DelimitedText := input; // Delphi die Arbeit amchen lassen
    RichEdit2.Lines:=sl;
    for I := 0 to RichEdit2.Lines.Count-1 do
    begin
      if RichEdit2.Lines[I].Equals(SC_SE) or RichEdit2.Lines[I].Equals(SC_NE) or RichEdit2.Lines[I].Equals(SC_KW) then
      begin
        SetFontStyle(RichEdit2,I);
      end;
      SetColor(RichEdit2,I);
    end;
  finally
    sl.Free;
  end;

  if ComboBoxVerteidigung.ItemIndex <> 0 then
    ComboBoxVerteidigung2.Enabled:= true
  else
  begin
    ComboBoxVerteidigung2.Enabled:=false;
    ComboBoxVerteidigung2.ItemIndex:=0;
  end;

  ComboBoxVerteidigung2.ItemIndex := 0;
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:F�rbt die Elemente der ComboBox
-----------------------------------------------------------------------------}
procedure TForm1.ComboBoxVerteidigungDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
AColor : TColor;
begin
  if Index > 0 then
  begin
    AColor:=SetComboBoxColor(Index);
    ComboBoxVerteidigung.Canvas.Brush.Color:=AColor;
  end;
  ComboBoxVerteidigung.Font.Style:=[fsBold];
  ComboBoxVerteidigung.Canvas.fillrect(Rect);
  ComboBoxVerteidigung.Canvas.TextOut(Rect.left, Rect.top, ComboBoxVerteidigung.Items[index]);
end;

{-----------------------------------------------------------------------------
Author: Seidel (2020.05.26)
Comment:legt die Farben f�r die Comboboxen fest
-----------------------------------------------------------------------------}
procedure TForm1.FormCreate(Sender: TObject);
begin
  Farbe_Normal :=  RGB(168,167,119);
  Farbe_Feuer  :=  RGB(238,128,51);
  Farbe_Wasser :=  RGB(102,145,240);
  Farbe_Pflanze:=  RGB(117,201,80);
  Farbe_Elektro:=  RGB(245,209,51);

  Farbe_Eis    :=  RGB(156,215,213);
  Farbe_Kampf  :=  RGB(192,48,40);
  Farbe_Gift   :=  RGB(165,64,166);
  Farbe_Boden  :=  RGB(227,191,107);
  Farbe_Flug   :=  RGB(168,144,240);

  Farbe_Psycho :=  RGB(246,90,137);
  Farbe_K�fer  :=  RGB(168,185,31);
  Farbe_Gestein:=  RGB(179,164,63);
  Farbe_Geist  :=  RGB(112,87,155);
  Farbe_Drache :=  RGB(110,59,248);

  Farbe_Unlicht:=  RGB(112,86,73);
  Farbe_Stahl  :=  RGB(183,184,205);
  Farbe_Fee    :=  RGB(250,200,227);

  if Screen.Width > 1920 then
  begin
    RichEdit1.Font.Size:= 11;
    RichEdit2.Font.Size:= 11;
  end
  else
  begin
    RichEdit1.Font.Size:= 10;
    RichEdit2.Font.Size:= 10;
  end;

end;

end.
