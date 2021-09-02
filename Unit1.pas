unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MakeParse: TButton;
    InputStr: TEdit;
    ResultStr: TEdit;
    InputAllString: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure MakeParseClick(Sender: TObject);
    procedure InputAllStringClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Dictionary: TStringList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


const
 Message_Lenght = 11;
 Dictonary_Length = 7;
 Low_Value = 0;
// �������� �������� ���������
C_MESSAGE_STRINGS: array [Low_Value..Message_Lenght] of string = (
                  'Hi, im Carter',
                  'My name is rod Stewart',
                  'Nice to meet you, im dixon...',
                  'I am smith walker it nice to meet you',
                  'im Carter Stewart Smith, how are you doing',
                  'There no name here',
                  'Hi I late for an interview',
                  'I am a retail manager&',
                  'Dixon marshall and I have a question',
                  'Where is Rod Stewart and his dog?',
                  'Hi my name is Dixon Walker, where can I buy these shoes',
                  'I am hungry but I want to see Marshall first.'
);

C_DISTIONARY: array [Low_Value..Dictonary_Length] of string = (
                  'Carter',
                  'rod Stewart',
                  'dixon',
                  'smith walker',
                  'Carter Stewart Smith',
                  'Dixon marshall',
                  'Rod Stewart',
                  'Dixon Walker'
);

procedure TForm1.FormCreate(Sender: TObject);
var
  messageStr: string;
  i : integer;
begin
// ������� ��� ����� � ��������
  for i := Low_Value to Message_Lenght do
  begin
    InputAllString.items[i] := ' ' + C_MESSAGE_STRINGS[i];
  end;
    InputAllString.ItemIndex := Low_Value;
    InputStr.Text := InputAllString.Items.Strings[0];

  Dictionary := TStringList.Create;

  for i := Low_Value to Dictonary_Length do
  begin
    Dictionary.Add(C_DISTIONARY[i]);
  end;

  InputAllString.ItemIndex := 0;
  InputStr.Text := InputAllString.Items.Strings[0];

end;


procedure TForm1.MakeParseClick(Sender: TObject);
var
  i : integer;
  StartStr : Integer;
  LastStartStr : integer;
  LastEndStr : integer;
  EndStr : Integer;
  j: Integer;
  Start_Value_of_work: Integer;
begin
  Start_Value_of_work := 0;
// ���������� ������� �� �����������
  StartStr := Start_Value_of_work;
  LastStartStr := Start_Value_of_work;  // ��������� ������� �������
  LastEndStr := Start_Value_of_work;  // ��������� ������� �������
  for i := Low_Value to Dictonary_Length do
  begin
    StartStr := Pos(AnsiUpperCase(Dictionary[i]), AnsiUpperCase(InputStr.Text));
    EndStr := Dictionary[i].Length;
    if ((LastStartStr <> StartStr) or (LastEndStr <> EndStr)) and (StartStr <> Start_Value_of_work) then
    begin
      LastEndStr := EndStr;
      LastStartStr := StartStr;
    end;
  end;
   if LastStartStr <> Start_Value_of_work  then
     ResultStr.Text := copy(InputStr.Text, LastStartStr, LastEndStr)
   else
     ResultStr.Text := '';

end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(Dictionary);
end;

procedure TForm1.InputAllStringClick(Sender: TObject);
var
 FindLine : integer;
 i        : integer;
begin
 //��������� ������� ������
  For i:= Low_Value to InputAllString.Items.Count-1  do
    If (InputAllString.Selected[i]) then
      InputStr.Text := InputAllString.Items.Strings[i];
end;

end.
