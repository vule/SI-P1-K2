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

const
    MAX_BR_EL = 100;

var
    n, i, j, k, max, min1, min2, sol: Integer;
    nums, p, q, r: Array[1..MAX_BR_EL] of Integer;

begin

    { pokazuje koliko ima mogucih trojki koje zadovoljavaju }
    sol := 0;

    readln(input, n);

    for i := 1 to n do
        readln(input, nums[i]);

    { Ovo je dosta neoptimizovan nacin resavanja, ali najbrzi za napisati;
    proverava za svaki mogucu trojku brojeva da li vazi p^2 = q^2 + r^2
    (pod pretpostavkom da p, q, r ne moraju da budu razliciti elementi.
    Alternativno je moguce prvo sortirati niz, pa onda vrsiti proveru za
    svaku mogucu trojku. }
    for i := 1 to n do
        for j := i to n do
            for k := j to n do
            begin
                if nums[i] >= nums[j] then
                begin
                    max := nums[i];
                    min1 := nums[j];
                end
                else
                begin
                    max := nums[j];
                    min1 := nums[i];
                end;

                if nums[k] > max then
                begin
                    min2 := max;
                    max := nums[k];
                end
                else
                    min2 := nums[k];

                { kod iznad odredjuje najveci od tri broja koja se porede
                i stavlja ga u max, a druga dva manja stavlja u min1 i min2,
                nebitno kojim redosledom }

                { proverava da li vazi max^2 = min1^2 + min2^2 }
                if sqr(max) = sqr(min1) + sqr(min2) then
                begin
                    inc(sol);
                    p[sol] := max;
                    q[sol] := min1;
                    r[sol] := min2;
                end;
            end;
end.
