
{$apptype CONSOLE}

  program test;

uses
  Deltics.Smoketest,
  Deltics.Strings.Types in '..\src\Deltics.Strings.Types.pas',
  Test.Types in 'Test.Types.pas';

begin
  TestRun.Test(Types, DELPHI_VERSION);
end.
