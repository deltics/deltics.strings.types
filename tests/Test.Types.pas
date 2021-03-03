
{$i deltics.inc}

  unit Test.Types;

interface

  uses
    Deltics.Smoketest;


  type
    Types = class(TTest)
      procedure SizeOfAnsiChar;
      procedure SizeOfAsciiChar;
      procedure SizeOfChar;
      procedure SizeOfCodepoint;
      procedure SizeOfUtf8Char;
      procedure SizeOfUtf16Char;
      procedure SizeOfUtf32Char;
      procedure SizeOfWideChar;
      procedure UNICODEDefine;
    end;



implementation

  uses
    Deltics.StringTypes;



{ Types ------------------------------------------------------------------------------------------ }

  procedure Types.SizeOfAnsiChar;
  begin
    Test('SizeOf(AnsiChar)').Assert(sizeof(AnsiChar)).Equals(1);
  end;


  procedure Types.SizeOfAsciiChar;
  begin
    Test('SizeOf(AsciiChar)').Assert(sizeof(AsciiChar)).Equals(1);
  end;


  procedure Types.SizeOfChar;
  begin
    Test('sizeof(Char)').Assert(sizeof(Char)).Equals({$ifdef UNICODE} 2 {$else} 1 {$endif});
  end;


  procedure Types.SizeOfCodepoint;
  begin
    Test('SizeOf(Codepoint)').Assert(sizeof(Codepoint)).Equals(4);
  end;


  procedure Types.SizeOfUtf8Char;
  begin
    Test('sizeof(Utf8Char)').Assert(sizeof(Utf8Char)).Equals(1);
  end;


  procedure Types.SizeOfUtf16Char;
  begin
    Test('sizeof(Utf16Char)').Assert(sizeof(Utf16Char)).Equals(2);
  end;


  procedure Types.SizeOfUtf32Char;
  begin
    Test('sizeof(Utf32Char)').Assert(sizeof(Utf32Char)).Equals(4);
  end;


  procedure Types.SizeOfWideChar;
  begin
    Test('sizeof(WideChar)').Assert(sizeof(WideChar)).Equals(2);
  end;


  procedure Types.UNICODEDefine;
  begin
  {$ifdef __DELPHI2007}
    Test('UNICODE is not $DEFINEd').Assert({$ifdef UNICODE}FALSE{$else}TRUE{$endif});
  {$endif}
  {$ifdef DELPHI2009__}
    Test('UNICODE is $DEFINEd').Assert({$ifdef UNICODE}TRUE{$else}FALSE{$endif});
  {$endif}
  end;




end.
