
{$i deltics.inc}

  unit Deltics.StringTypes;


interface

  type
  // A Codepoint is a natively expressed (LE on Windows) 32-bit value
  //  identifying a unique Unicode codepoint.  Utf32Char is an alias for
  //  this type.

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


  // Chars  (AnsiChar and WideChar are defined by System)

  const
    ASCII_LO  = AnsiChar($00);
    ASCII_HI  = AnsiChar($7f);

  type
    AsciiChar     = ASCII_LO..ASCII_HI;
    Utf8Char      = type AnsiChar;
    Utf16Char     = WideChar;
    Utf16BeChar   = type WideChar;
    Utf32Char     = type Codepoint;

    PAsciiChar    = ^AsciiChar;
    PUtf8Char     = ^Utf8Char;
    PUtf16Char    = ^Utf16Char;
    PUtf16BeChar  = ^Utf16BeChar;
    PUtf32Char    = ^Utf32Char;


  // Dynamic arrays of Character types

    AnsiCharArray   = array of AnsiChar;
    AsciiArray      = array of AsciiChar;
    CharArray       = array of Char;
    Utf8Array       = array of Utf8Char;
    Utf16Array      = array of Utf16Char;
    Utf16BeArray    = array of Utf16BeChar;
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



implementation




end.
