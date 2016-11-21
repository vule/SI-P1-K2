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

program zadatak1(input, output);

type
    { struktura koja cuva indeks prve i poslednje strane dela zbirke }
    part = record
        firstPage, lastPage: Integer;
    end;

var
    n, i, page: Integer;
    parts: Array[1..1000] of part; { niz delova zbirke }
    found: Boolean;

begin

    readln(input, n);

    for i := 1 to n do
        readln(input, parts[i].firstPage, parts[i].lastPage);

    { petlja ce se izvrsavati sve dok se unosi nenegativan broj trazene strane }
    while true do
    begin
        found := false; { promenljiva koja pokazuje da li je trazena strana nadjena }
        readln(input, page);

        { u slucaju da se unese negativna strana, program se prekida }
        if page < 0 then break;

        for i := 1 to n do
            { proverava se da li se strana nalazi u opsegu svakog unetog dela }
            if (page >= parts[i].firstPage) and (page <= parts[i].lastPage) then
            begin
                found := true;
                writeln(output, 'postoji');

                { posto je strana pronadjena, nema potrebe dalje traziti, pa se
                izlazi iz petlje}
                break;
            end;

        { ispisuje "nedostaje" ukoliko trazena strana nije pronadjena }
        if not found then
            writeln(output, 'nedostaje');
    end;
    
end.
