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

const
    MAX_COMP = 1000;

var
    component, quant, i, m: Integer;
    empty: Boolean;
    components, request, missing: Array[1..MAX_COMP] of Integer;

begin

    for i := 1 to MAX_COMP do
        components[i] := 0;

    { petlja ce se izvrsavati sve dok se ne unese -1 }
    while true do
    begin
        readln(input, component);

        if component = -1 then break; { prekid unosa komponenti }

        readln(input, quant);
        components[component] := components[component] + quant;
    end;


    while true do
    begin
        { pokazuje da li je zahtev studenta neprazan }
        empty := true;

        { pokazuje koliko ima komponenata koje nedostaju da bi se studentov zahtev
        ispunio }
        m := 0;

        { potrebno je za svakog studenta da se resetuje broj komponenti koje je
        zahtevao, da se ne bi desilo da se novi zahtevi dodaju na prethodne }
        for i := 1 to MAX_COMP do
            request[i] := 0;

        for i := 1 to MAX_COMP do
            missing[i] := 0;

        { petlja ce se izvrsavati sve dok se unose validne vrednosti za komponente }
        while true do
        begin
            readln(input, component);
            if (component < 1) or (component > MAX_COMP) then break;
            empty := false;
            inc(request[component]); { povecava broj trazene komponente za +1 }
        end;

        { program se zavrsava ukoliko je zahtev studenta prazan }
        if empty then break;

        { za svaku komponentu proverava da li je ima dovoljno }
        for i := 1 to MAX_COMP do
            { student zahteva vise komponenti nego sto ima }
            if request[i] > components[i] then
            begin
                inc(m);
                missing[m] := i;
            end;
        
        { zahtev je validan, svih komponenti ima dovoljno }
        if m = 0 then
        begin
            writeln(output, 'OK');

            { smanji broj komponenti posle zahteva }
            for i := 1 to MAX_COMP do
                components[i] := components[i] - request[i];
        end
        else
        begin
            writeln(output, 'Nije moguce jer nedostaju komponente:');
            { ispisi komponente koje nedostaju i koliko }
            for i := 1 to m do
            begin
                component := missing[i];
                writeln(output, component, ' (', request[component] - components[component],
                    ' komad(a))');
            end;
        end;
    end;

end.
