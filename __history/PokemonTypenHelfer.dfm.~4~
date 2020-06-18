object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pokemon Typenhelfer'
  ClientHeight = 561
  ClientWidth = 1074
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 1090
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1090
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 539
    Height = 561
    Align = alLeft
    Caption = 'Typ vom Gegnerischen Pokemon'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LTypGeg1: TLabel
      Left = 3
      Top = 37
      Width = 44
      Height = 16
      Caption = '1. Typ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTypGeg2: TLabel
      Left = 3
      Top = 93
      Width = 44
      Height = 16
      Caption = '2. Typ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 211
      Top = 18
      Width = 326
      Height = 541
      Align = alRight
      TabOrder = 0
      ExplicitLeft = 201
      ExplicitHeight = 431
      object GroupBox3: TGroupBox
        Left = 1
        Top = 1
        Width = 324
        Height = 539
        Align = alClient
        Caption = 'Ergebnis'
        TabOrder = 0
        ExplicitHeight = 429
        object RichEdit1: TRichEdit
          Left = 2
          Top = 18
          Width = 320
          Height = 519
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          Zoom = 100
          ExplicitLeft = 3
          ExplicitTop = 16
          ExplicitHeight = 1032
        end
      end
    end
    object ComboBoxAngriff: TComboBox
      Left = 3
      Top = 56
      Width = 202
      Height = 22
      Style = csOwnerDrawVariable
      ItemIndex = 0
      TabOrder = 1
      Text = '--Bitte Ausw'#228'hlen--'
      OnChange = ComboBoxAngriffChange
      OnDrawItem = ComboBoxAngriffDrawItem
      Items.Strings = (
        '--Bitte Ausw'#228'hlen--'
        'Normal'
        'Feuer'
        'Wasser'
        'Pflanze'
        'Elektro'
        'Eis'
        'Kampf'
        'Gift'
        'Boden'
        'Flug'
        'Psycho'
        'K'#228'fer'
        'Gestein'
        'Geist'
        'Drache'
        'Unlicht'
        'Stahl'
        'Fee')
    end
    object ComboBoxAngriff2: TComboBox
      Left = 3
      Top = 115
      Width = 202
      Height = 22
      Style = csOwnerDrawVariable
      Enabled = False
      ItemIndex = 0
      TabOrder = 2
      Text = '--Bitte Ausw'#228'hlen--'
      OnChange = ComboBoxAngriff2Change
      OnDrawItem = ComboBoxAngriff2DrawItem
      Items.Strings = (
        '--Bitte Ausw'#228'hlen--'
        'Normal'
        'Feuer'
        'Wasser'
        'Pflanze'
        'Elektro'
        'Eis'
        'Kampf'
        'Gift'
        'Boden'
        'Flug'
        'Psycho'
        'K'#228'fer'
        'Gestein'
        'Geist'
        'Drache'
        'Unlicht'
        'Stahl'
        'Fee')
    end
    object clearBtnGeg: TButton
      Left = 3
      Top = 533
      Width = 202
      Height = 25
      Caption = 'Liste leeren'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = clearBtnGegClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 539
    Top = 0
    Width = 535
    Height = 561
    Align = alClient
    Caption = 'Typ vom Eigenen Pokemon'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 512
    ExplicitTop = 271
    ExplicitWidth = 529
    ExplicitHeight = 410
    object LTypEig1: TLabel
      Left = 6
      Top = 37
      Width = 44
      Height = 16
      Caption = '1. Typ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTypEig2: TLabel
      Left = 3
      Top = 96
      Width = 44
      Height = 16
      Caption = '2. Typ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBoxVerteidigung: TComboBox
      Left = 3
      Top = 56
      Width = 199
      Height = 22
      Style = csOwnerDrawVariable
      ItemIndex = 0
      TabOrder = 0
      Text = '--Bitte Ausw'#228'hlen--'
      OnChange = ComboBoxVerteidigungChange
      OnDrawItem = ComboBoxVerteidigungDrawItem
      Items.Strings = (
        '--Bitte Ausw'#228'hlen--'
        'Normal'
        'Feuer'
        'Wasser'
        'Pflanze'
        'Elektro'
        'Eis'
        'Kampf'
        'Gift'
        'Boden'
        'Flug'
        'Psycho'
        'K'#228'fer'
        'Gestein'
        'Geist'
        'Drache'
        'Unlicht'
        'Stahl'
        'Fee')
    end
    object Panel1: TPanel
      Left = 207
      Top = 18
      Width = 326
      Height = 541
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 201
      ExplicitHeight = 390
      object GroupBox4: TGroupBox
        Left = 1
        Top = 1
        Width = 324
        Height = 539
        Align = alClient
        Caption = 'Ergebnis'
        TabOrder = 0
        ExplicitHeight = 388
        object RichEdit2: TRichEdit
          Left = 2
          Top = 18
          Width = 320
          Height = 519
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          Zoom = 100
          ExplicitHeight = 368
        end
      end
    end
    object ComboBoxVerteidigung2: TComboBox
      Left = 3
      Top = 115
      Width = 199
      Height = 22
      Style = csOwnerDrawVariable
      Enabled = False
      ItemIndex = 0
      TabOrder = 2
      Text = '--Bitte Ausw'#228'hlen--'
      OnChange = ComboBoxVerteidigung2Change
      OnDrawItem = ComboBoxVerteidigung2DrawItem
      Items.Strings = (
        '--Bitte Ausw'#228'hlen--'
        'Normal'
        'Feuer'
        'Wasser'
        'Pflanze'
        'Elektro'
        'Eis'
        'Kampf'
        'Gift'
        'Boden'
        'Flug'
        'Psycho'
        'K'#228'fer'
        'Gestein'
        'Geist'
        'Drache'
        'Unlicht'
        'Stahl'
        'Fee')
    end
    object clearBtnAng: TButton
      Left = 3
      Top = 533
      Width = 199
      Height = 25
      Caption = 'Liste leeren'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = clearBtnAngClick
    end
  end
end
