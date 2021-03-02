
{$i deltics.inc}

  unit Deltics.Strings.Types;


interface

  type
  // A Codepoint is a natively expressed (LE on Windows) 32-bit value
  //  identifying a unique Unicode codepoint and is an alias for the Utf32Char type.

    Codepoint   = Cardinal;
    PCodepoint  = ^Codepoint;


  // Strings

  {$ifdef UNICODE}
    Utf8String    = System.Utf8String;
    UnicodeString = System.UnicodeString;
  {$else}
    Utf8String    = type AnsiString;
    UnicodeString = type WideString;
  {$endif}
    AsciiString   = type Utf8String;


  // Chars
  const
    ASCII_LO  = AnsiChar($00);
    ASCII_HI  = AnsiChar($7f);

  type
    AsciiChar     = ASCII_LO..ASCII_HI;
    Utf8Char      = type AnsiChar;
    Utf16Char     = WideChar;
    Utf32Char     = type Codepoint;

    PAsciiChar    = ^AsciiChar;
    PUtf8Char     = ^Utf8Char;
    PUtf16Char    = ^Utf16Char;
    PUtf32Char    = ^Utf32Char;


  // Dynamic arrays of Character types

    AnsiCharArray   = array of AnsiChar;
    AsciiArray      = array of AsciiChar;
    CharArray       = array of Char;
    Utf8Array       = array of Utf8Char;
    Utf16Array      = array of Utf16Char;
    Utf32Array      = array of Utf32Char;
    WideCharArray   = array of WideChar;
    CodepointArray  = array of Codepoint;


  // Dynamic arrays of String types

    AnsiStringArray     = array of AnsiString;
    AsciiStringArray    = array of AsciiString;
    StringArray         = array of String;
    UnicodeStringArray  = array of UnicodeString;
    Utf8StringArray     = array of Utf8String;
    WideStringArray     = array of WideString;


  // Sets

    AnsiCharSet   = set of AnsiChar;
    AsciiCharSet  = set of AsciiChar;


  function CharInSet(const aChar: AnsiChar; aSet: AnsiCharSet): Boolean; overload;
{$ifdef UNICODE}
  function CharInSet(const aChar: AsciiChar; aSet: AnsiCharSet): Boolean; overload;
  function CharInSet(const aChar: Utf8Char; aSet: AnsiCharSet): Boolean; overload;
{$endif}
  function CharInSet(const aChar: Utf32Char; aSet: AnsiCharSet): Boolean; overload;
  function CharInSet(const aChar: WideChar; aSet: AnsiCharSet): Boolean; overload;

  function AsciiCharInSet(const aChar: AsciiChar; aSet: AnsiCharSet): Boolean;
  function Utf8CharInSet(const aChar: Utf8Char; aSet: AnsiCharSet): Boolean;


implementation


  function CharInSet(const aChar: AnsiChar; aSet: AnsiCharSet): Boolean;
  begin
    result := aChar in aSet;
  end;


{$ifdef UNICODE}
  function CharInSet(const aChar: AsciiChar; aSet: AnsiCharSet): Boolean;
  begin
    result := aChar in aSet;
  end;


  function CharInSet(const aChar: Utf8Char; aSet: AnsiCharSet): Boolean;
  begin
    result := (aChar <= ASCII_HI) and (AsciiChar(aChar) in aSet);
  end;
{$endif}


  function CharInSet(const aChar: Utf32Char; aSet: AnsiCharSet): Boolean;
  begin
    result := (aChar <= Codepoint(ASCII_HI)) and (AsciiChar(aChar) in aSet);
  end;


  function CharInSet(const aChar: WideChar; aSet: AnsiCharSet): Boolean;
  begin
    result := (aChar <= ASCII_HI) and (AsciiChar(aChar) in aSet);
  end;


  function AsciiCharInSet(const aChar: AsciiChar; aSet: AnsiCharSet): Boolean;
  begin
    result := aChar in aSet;
  end;


  function Utf8CharInSet(const aChar: Utf8Char; aSet: AnsiCharSet): Boolean;
  begin
    result := (aChar <= ASCII_HI) and (AsciiChar(aChar) in aSet);
  end;


end.
