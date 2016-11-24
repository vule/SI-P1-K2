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

program zadatak(input, output);

var
    n, i, j: Integer;
    text: String[50];
    key, encryptedKey: Array[0..9] of Integer;
    table: Array[0..9, 0..9] of Char;

begin

    { unos duzine kljuca }
    readln(input, n);

    { unos kljuca, broj po broj }
    for i := 0 to n-1 do
        readln(input, key[i]);

    readln(input, text);

    { tekst za sifrovanje se unosi u tabelu, tako da svakom polju odgovara
    tacno jedno slovo iz teksta }
    for i := 0 to length(text)-1 do
        table[i div n, i mod n] := text[i + 1];

    { "desifruje" se kljuc na sledeci nacin: u encryptedKey upisuje se pozicija
    svakog broja u nizu key. Npr: u nizu key = [4, 3, 1, 2, 5, 6] prvi broj (4) se
    nalazi na 0. poziciji, pa se za se u 4. element encryptedKey-a (indeks 3)
    upisuje 0. Na 1. poziciji u key je broj 3, tako da se u 3. element encryptedKey-a
    (indeks 2) upisuje 1 itd. Posle ovog se dobija:
    [4, 3, 1, 2, 5, 6] -> [2, 3, 1, 0, 4, 5] }
    for i := 0 to n-1 do
        encryptedKey[key[i] - 1] := i;

    { vrsi se ispis po kolonama, tako da se prvo ispisuje kolona vezana za broj 1, 
    pa za 2 itd. Za to se koristi niz encryptedKey }
    for i := 0 to n-1 do
        for j := 0 to (length(text) div n) do
            write(table[j, encryptedKey[i]]);

    writeln;

end.
