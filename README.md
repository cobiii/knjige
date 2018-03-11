# README

Spletna stran namenjena za pisanje knjig, omogoča pisanje različnih ljudi po poglavjih.


Aplikacija je narejena v rails veziji 5.1.4.

Baza je sestavljena iz uporabnikov, knjih in poglavij. Uporabnike sem naredil z devise pluginom (https://github.com/plataformatec/devise).
V knjigah je definirano koliko bo imela knjiga poglavij in pri izdelovanju poglavij tega stevila ne moremo presežti. Baza je povezana tako da so poglavja tablela med knjigami in uporabnikom ampak uporabnik je tudi vezan na knjigo.

Če želite izključiti preusmeritev na login page izbrišite vrstico <tt>before_action :authenticate_user!</tt> iz ApplicationControllerja.
V kontrolerjih knjig in poglavij so pri create in update osnovna preverjanja, da ne pride v bazi do zapletov.

Aplikacija uporablja bootstrap style. Za zagon aplikacije napišemo <tt>rails s</tt> v cmd vrstici, ko smo v glavni mapi aplikacije.
