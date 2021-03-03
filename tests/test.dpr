
{$apptype CONSOLE}

  program test;

uses
  Deltics.Smoketest,
  Deltics.StringTypes in '..\src\Deltics.StringTypes.pas',
  Test.Types in 'Test.Types.pas';

begin
  TestRun.Test(Types, DELPHI_VERSION);
end.
