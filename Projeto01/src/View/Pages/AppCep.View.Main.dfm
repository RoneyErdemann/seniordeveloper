object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 306
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 136
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 36
    Width = 377
    Height = 262
    TabOrder = 1
  end
  object EditCEP: TJvEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 8
    TabOrder = 2
    Text = '64078462'
    NumbersOnly = True
  end
end
