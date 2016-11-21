{
  Copyright (C) 2016 Vukasin Manojlovic
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
     http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
}

program zadatak2(input, output);

var
    text: String[255];
    a, b, len: Integer;
    tmp: Char;

begin
    
    readln(input, text);
    len := length(text); { duzina stringa }

    { petlja ce se izvrsavati sve dok se unose pozicije za zamenu koje su
    opsegu [1, len] }
    while true do
    begin
        readln(input, a, b);

        { prekini ako se unesu nevalidne pozicije za zamenu }
        if (a < 1) or (a > len) or (b < 1) or (b > len) then break;

        { izvrsi zamenu }
        tmp := text[a];
        text[a] := text[b];
        text[b] := tmp;
    end;

    writeln(output, text);

end.
