Program trabTI ;
{*
materia de estudo
mundo.img
pontua��o nomes
-material de estudo: amontuado de informa��es
-cria��o de um credito
*}
//a tela tem 80x25

type registro = record
  user:string[16];
  email:string[25];
  senha,confSenha:string[16];
end;
confirma =record
  user,senha:string[16];
end;

var
conf:confirma;
login: registro;
HsAtualofN:string;
menu,erro,goX,goY,goXJ,goYJ,HsAtual:integer;
menui,confirmar,ch:char;
cadfile:file of registro;
highscoreA:array [1..5] of integer;
highscoref:file of array [1..5] of integer;
highscoreAofN:array [1..5] of string;
highscorefofN:text;

//Logo da ETEP
procedure logo ;
Begin
  gotoxy(goX,goY+1);textcolor(blue);writeln    (#219,#219,#219,#220);
  gotoxy(goX,goY+2);textcolor(blue);write      (#219,#219,#219,#219,#219);          textcolor(lightred);write('      ');writeln               (#220,#219,#219,#219);
  gotoxy(goX,goY+3);textcolor(blue);write      (#219,#219,#219,#219,#219,#219);     textcolor(lightred);write('    ');  writeln          (#219,#219,#219,#219,#219);
  gotoxy(goX,goY+4);textcolor(blue);write      (#219,#219,#219,#219,#219,#219,#219);textcolor(lightred);write('  ');    writeln     (#219,#219,#219,#219,#219,#219);
  gotoxy(goX,goY+5);textcolor(blue);write(' ');write(#223,#219,#219,#219,#219,#219);textcolor(lightred);write(' ');     writeln(#219,#219,#219,#219,#219,#219,#219);
  gotoxy(goX,goY+6);textcolor(blue);write('   ');        write(#223,#219,#219,#219);textcolor(lightred);write(' ');     writeln(#219,#219,#219,#219,#219,#223);
  gotoxy(goX,goY+7);textcolor(blue);write('     ');                write(#219,#219);textcolor(lightred);write(' ');     writeln(#219,#219,#219,#223);
  gotoxy(goX,goY+8);textcolor(blue);write('      ');                    write(#219);textcolor(lightred);write(' ');     writeln(#219,#219);
  gotoxy(goX,goY+9);textcolor(blue);write('        ');                              textcolor(lightred);                writeln(#219);
  textcolor(white);
  gotoxy(goX+4,goY+11);write('E.T.E.P.');
  gotoxy(goX+1,goY+12);write('Escola Tecnica');
  gotoxy(goX+0,goY+13);write('Everardo  Passos');
End;

//Frame
procedure frame ;
var n:integer;
begin
  textcolor(yellow);
  gotoxy(1,1); write(#201); for n:= 1 to 78 do write(#205); write(#187); //top do frame
for n:=2 to 24 do begin gotoxy(1,n); write(#186); end;                   //borda direita
for n:=2 to 24 do begin gotoxy(80,n);write(#186); end;                   //borda esquerda
  gotoxy(1,25); write(#200); for n:= 1 to 78 do write(#205); write(#188);//botton do frame
  gotoxy(1,1);textcolor(white);
end;

//Material de estudo
procedure matEstudo ;
var goxt,goyt,nl:integer;
Begin
  goxt:=3;
  goyt:=2;
  frame;
  gotoxy(3,24);write(' ',#30,' ',#31,' controlam a rolagem do texto                   <ESC> volta para o menu');
  repeat
    nl:=0;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Material de estudo :                                                        ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('�gua � uma subst�ncia qu�mica cujas mol�culas s�o formadas por              ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('dois �tomos de hidrog�nio e um de oxig�nio. � abundante no Universo,        ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('inclusive na Terra, onde cobre grande parte de sua superf�cie e � o maior   ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('constituinte dos flu�dos dos seres vivos. As temperaturas do planeta permi- ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('tem a ocorr�ncia da �gua em seus tr�s estados f�sicos principais. A �gua    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('l�quida, que em pequenas quantidades � incolor, mas manifesta sua colora��o ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('azulada em grandes volumes, constitui os oceanos, rios e lagos que cobrem   ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('quase tr�s quartos da superf�cie do planeta. Nas regi�es polares,           ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('concentram-se as massas de gelo e vapor constitui parte da atmosfera        ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('terrestre.                                                                  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('A �gua possui uma s�rie de caracter�sticas peculiares, como sua dilata��o   ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('an�mala o alto calor espec�fico e a capacidade de dissolver um grande n�mero');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('de subst�ncias. De fato estas peculiaridades foramfavor�veis para o         ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('surgimento da vida nos oceanos primitivos da Terra, bem como propiciaram    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('sua evolu��o. Atualmente, todos os seres vivos existentes precisam da �gua  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('para sua sobreviv�ncia.                                                     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Embora os oceanos cubram a maior parte da superf�cie terrestre, sua �gua �  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('inadequada para o consumo humano por conta de suasalinidade. Somente uma    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('pequena fra��o dispon�vel sobre a superf�cie dos continentes que cont�m     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('poucos sais dissolvidos, a �gua doce, est� dispon�vel para consumo          ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('direto. Contudo, sua distribui��o n�o � uniforme, o que faz com que diversas');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('regi�es sofram de escassez h�drica. As atividades humanas,principalmente a  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('agricultura, possuem grandes necessidades de retirada de �gua de seu leito  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('natural, o que tem afetado negativamente sua distribui��o sobre os          ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('continentes, bem como da �gua subterr�nea.                                  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('A polui��o h�drica compromete a qualidade da �gua, prejudicando a           ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('biodiversidade, bem como o abastecimento de �gua e a produ��o de alimentos. ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Al�m disso, uma parcela consider�vel da popula��o mundial ainda n�o tem     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('acesso � �gua pot�vel, o que traz diversos problemas de sa�de. A �gua �     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('indispens�vel no modo de vida da humanidade, de forma que est� fortemente   ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('ligada � cultura de todos os povos da Terra. Diante dos problemas advindos  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('do mau uso dos recursos h�dricos, surge uma nova consci�ncia de que � neces-');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('s�rio utilizar a �gua racionalmente.                                        ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('�gua doce                                                                   ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Menos de tr�s por cento da �gua da Terra n�o encontram-se nas massas        ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('l�quidas dos oceanos e, geralmente, possuem concentra��es bem menores de    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('sais minerais, sendo denominada como �gua doce. A maior parte da �gua doce  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('do planeta, entretanto, est� contida em geleiras continentais e nas calotas ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('polares , com destaque para a Groenl�ndia e Ant�rtida, que cont�m juntas    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('mais de 99',#37,' de todo o volume de gelo do planeta.                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Somente 0,65',#37,' da �gua do planeta encontra-se sobre os continentes na forma  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('de rios, lagos e �gua subterr�nea. Usualmente pequenos cursos da �gua surgem');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('em altitudes elevadas e fluem para regi�es mais baixas, onde ganham volume  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('ao se juntar com outros afluentes, formando, assim, um rio, que segue at�,  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('na maioria das vezes, desaguar no oceano. Ao percorrer seu trajeto, a �gua  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('leva consigo sedimentos, mat�ria org�nica e sais dissolvidos e os transporta');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('at� o mar. Lagos s�o grandes reten��es de �gua que cobrem 1,8',#37,' da �rea dos  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('continentes e n�o necessariamente s�o formados por �gua doce. Lagos         ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('artificiais s�o criados pelo represamento de rios para diversas finalidades,');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('principalmente para gera��o de energia. Boa parte da �gua encontra-se,ainda,');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('sob o solo, na forma de �gua subterr�nea.                                   ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Import�ncia para a humanidade:                                              ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Composi��o fotogr�fica de sat�lite do vale do rio Nilo, que corta o Saara no');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('norte da �frica, trazendo fertilidade e abund�ncia em meio � aridez do      ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('deserto. De fato a rela��o com os recursos h�dricos terrestres vai muito    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('al�m de sua necessidade fisiol�gica para a humanidade. Desde o in�cio da    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('hist�ria humana , o desenvolvimento dos primeiros assentamentos n�o era     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('feito longe de rios e lagos, onde a �gua trazia consigo grande abund�ncia de');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('alimentos. Grandes civiliza��es desenvolveram-se ao longo de rios, como os  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('eg�pcios que habitavam as margens do rio Nilo, a Babil�nia ao longo dos     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('rios Tigre e Eufrates, dentre muitas outras, onde a �gua passava a ser      ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('utilizados tamb�m como meio de transporte, com�rcio e desenvolvimento.      ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Sistemas de irriga��o foram igualmente importantes para a produ��o de       ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('alimentos, especialmente em regi�es �ridas como no Crescente F�rtil.        ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Os romanos fizeram avan�os nas t�cnicas de distribui��o de �gua ao construir');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('centenas de quil�metros de aquedutos por toda a Europa.                     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
    
    gotoxy(1,1);
    case (readkey) of
      #80:if (goyt>=(nl*-1)+16) then goyt:=goyt-1; //text go up
      #72:if (goyt<=1) then goyt:=goyt+1; //text go down
      #27:break;
    end;
  until 2<>2;
end;

//regras/how_to do jogo
procedure Srule ;
var goxt,goyt,nl:integer;
Begin
  goxt:=3;
  goyt:=2;
  frame;
  gotoxy(3,24);write(' ',#30,' ',#31,' controlam a rolagem do texto                   <ESC> volta para o menu');
  repeat
    nl:=0;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('Como jogar :                                                                ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('No momento que jogador entrar no jogo ele se depara com uma imagem represen-');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('tando o planeta Terra, uma pergunta com suas respectivas alternativas e no  ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('canto inferior esquerdo, um contador regressivo de tempo (25 segundos).     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('+--------------------------------------------------------------------------+');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                       1-Como fazer para economizar �gua? |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                       1)Banhos demorados                 |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                       2)Lavar o quintal todos os dias    |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                       3)Fechar a torneira quando escovar |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                       os dentes                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                       4)Lavar o carro toda semana        |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('|                                                                          |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('| Tempo restante= 00:25                                                    |');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('+--------------------------------------------------------------------------+');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('A pergunta deve ser respondida antes que o tempo acabe, caso contr�rio a    ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('quest�o ser� anulada, e a pr�xima ser� exibida. Quanto mais r�pido a pessoa ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('responder, dentro do tempo,  mais pontos ela far� e ter� a possibilidade de ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('entrar para o hist�rico das melhores pontua��es, o mesmo est� localizado na ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('tela de menu cujo o n�mero � tr�s.  Ap�s as quest�es acabarem voc� ser�     ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('redirecionado � tela das melhores pontua��es.                               ');end;nl:=nl+1;
  if (goyt+nl>=2) and (goyt+nl<=22) then begin gotoxy(goxt,goyt+nl);write('                                                                            ');end;nl:=nl+1;
    
    gotoxy(1,1);
    case (readkey) of
      #80:if (goyt>=(nl*-1)+16) then goyt:=goyt-1; //text go up
      #72:if (goyt<=1) then goyt:=goyt+1; //text go down
      #27:break;
    end;
  until 2<>2;
end;

//
procedure loading;
Begin
  randomize;
  clrscr;
  frame;
  gotoxy (26,10);
  textcolor (white);
  Writeln ('L - O - A - D - I - N - G...');
  gotoxy (24,11);
  delay (random(500)+100);
  textcolor (lightgreen);
  Writeln ('----');
  gotoxy (24,12);
  Writeln (#219,#219,#219,#219);
  gotoxy (24,13);
  Writeln ('----');
  Delay (random(500)+100);
  gotoxy (28,11);
  Write ('---');
  gotoxy (28,12);
  Writeln (#219,#219,#219);
  gotoxy (28,13);
  Writeln ('---');
  Delay (random(500)+100);
  gotoxy (31,11);
  Writeln ('---');
  gotoxy (31,12);
  Writeln (#219,#219,#219);
  gotoxy (31,13);
  Writeln ('---');
  Delay (random(500)+100);
  gotoxy (34,11);
  Writeln ('---');
  gotoxy (34,12);
  Writeln (#219,#219,#219);
  gotoxy (34,13);
  Writeln ('---');
  Delay (random(500)+100);
  gotoxy (37,11);
  Writeln ('---');
  gotoxy (37,12);
  Writeln (#219,#219,#219);
  gotoxy (37,13);
  Writeln ('---');
  Delay (500);
  gotoxy (40,11);
  Writeln ('---');
  gotoxy (40,12);
  Writeln (#219,#219,#219);
  gotoxy (40,13);
  Writeln ('---');
  delay (random(500)+100);
  gotoxy (43,11);
  Writeln ('---');
  gotoxy (43,12);
  Writeln(#219,#219,#219);
  gotoxy (43,13);
  Writeln ('---');
  delay (random(500)+100);
  gotoxy (46,11);
  Writeln ('---');
  gotoxy (46,12);
  Writeln (#219,#219,#219);
  gotoxy (46,13);
  Writeln ('---');
  delay (random(500)+100);
  gotoxy (49,11);
  Writeln ('---');
  gotoxy (49,12);
  Writeln (#219,#219,#219);
  gotoxy (49,13);
  Writeln ('---');
  delay (random(500)+100);
  gotoxy (52,11);
  writeln ('----');
  gotoxy (52,12);
  Writeln (#219,#219,#219,#219);
  gotoxy (52,13);
  Writeln ('----');
  delay (random(500)+100);
  gotoxy (18,14);
  clrscr;
  textcolor(white);
End;

//reescreve a pontua��o e salva suas informa��es - highscore
procedure highscoreWrite ;
var n,temp:integer;
tempofN:string;
begin
  assign(HighscoreF, 'Highscore.dat' ) ;
  reset(HighscoreF);
  read(highscoreF,HighscoreA);
  
	assign(Highscorefofn, 'Highscoren.dat' ) ;
	reset (Highscorefofn);
	for n:=1 to 5 do readln(Highscorefofn, Highscoreaofn[n]);
	close(Highscorefofn);
  
  for n:=1 to 5 do
  begin
    if HsAtual>highscoreA[n] then
    begin
      temp:=highscoreA[n];
      highscoreA[n]:=HsAtual;
      HsAtual:=temp;
      
      tempofN:=highscoreAofN[n];
      highscoreAofN[n]:=HsAtualofN;
      HsAtualofN:=tempofN;
    end;
  end;
  
  close(highscoreF);
  
  rewrite(highscoreF);
  write(highscoreF,highscoreA);
  close(highscoreF);
  
	assign(Highscorefofn, 'Highscoren.dat' ) ;
	rewrite(Highscorefofn);
	for n:=1 to 5 do writeln(Highscorefofn, Highscoreaofn[n]);
	close(Highscorefofn);
end;

//Show highscore
procedure highscore ;
var n:integer;
begin
  clrscr;
  logo;
  frame;
  assign(HighscoreF, 'Highscore.dat' ) ;
  reset(HighscoreF);
  read(HighscoreF,HighscoreA) ;
 	assign(Highscorefofn, 'Highscoren.dat' ) ;
	reset (Highscorefofn);
	for n:=1 to 5 do readln(Highscorefofn, Highscoreaofn[n]);
	close(Highscorefofn);
  gotoxy(35,6);write ('As Melhores Pontua��es:');
  gotoxy(35,8);write ('1. ',highscoreA[1],' ',highscoreAofN[1]);
  gotoxy(35,10);write('2. ',highscoreA[2],' ',highscoreAofN[2]);
  gotoxy(35,12);write('3. ',highscoreA[3],' ',highscoreAofN[3]);
  gotoxy(35,14);write('4. ',highscoreA[4],' ',highscoreAofN[4]);
  gotoxy(35,16);write('5. ',highscoreA[5],' ',highscoreAofN[5]);
  close(HighscoreF);
  if (hsatual>0) then begin
	gotoxy(35,18);write('Ultima pontua��o: ',hsatual,' ',conf.user);
  end;
	gotoxy(35,20);write('Pressione <ESC> para voltar');
  if readkey=#27 then else highscore;
end;

procedure Mundo(posX, posY : integer);
Begin
  textcolor(15); textbackground(8);
  gotoxy(1+posX-1, 1+posY-1);
  write('            ');
  textcolor(2); textbackground(8);
  gotoxy(21+posX-1, 1+posY-1);
  write(#219);
  textcolor(15); textbackground(8);
  gotoxy(22+posX-1, 1+posY-1);
  write('            ');
  gotoxy(1+posX-1, 2+posY-1);
  write('         ');
  textcolor(2); textbackground(8);
  gotoxy(10+posX-1, 2+posY-1);
  write(#219,#219);
  gotoxy(19+posX-1, 2+posY-1);
  write(#219,#219,#219,#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(25+posX-1, 2+posY-1);
  write('         ');
  gotoxy(1+posX-1, 3+posY-1);
  write('      ');
  textcolor(2); textbackground(8);
  gotoxy(7+posX-1, 3+posY-1);
  write(#219,#219,#219,#219);
  gotoxy(20+posX-1, 3+posY-1);
  write(#219,#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(28+posX-1, 3+posY-1);
  write('      ');
  gotoxy(1+posX-1, 4+posY-1);
  write('    ');
  textcolor(2); textbackground(8);
  gotoxy(5+posX-1, 4+posY-1);
  write(#219,#219,#219,#219);
  gotoxy(20+posX-1, 4+posY-1);
  write(#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(30+posX-1, 4+posY-1);
  write('    ');
  gotoxy(1+posX-1, 5+posY-1);
  write('    ');
  textcolor(2); textbackground(8);
  gotoxy(5+posX-1, 5+posY-1);
  write(#219);
  gotoxy(7+posX-1, 5+posY-1);
  write(#219,#219);
  gotoxy(26+posX-1, 5+posY-1);
  write(#219,#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(30+posX-1, 5+posY-1);
  write('    ');
  gotoxy(1+posX-1, 6+posY-1);
  write('  ');
  textcolor(2); textbackground(8);
  gotoxy(3+posX-1, 6+posY-1);
  write(#219,#219);
  gotoxy(20+posX-1, 6+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219);
  gotoxy(28+posX-1, 6+posY-1);
  write(#219,#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(32+posX-1, 6+posY-1);
  write('  ');
  gotoxy(1+posX-1, 7+posY-1);
  write('  ');
  textcolor(2); textbackground(8);
  gotoxy(3+posX-1, 7+posY-1);
  write(#219);
  textcolor(2); textbackground(3);
  gotoxy(5+posX-1, 7+posY-1);
  write(#219,#219);
  textcolor(2); textbackground(8);
  gotoxy(18+posX-1, 7+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(29+posX-1, 7+posY-1);
  write(#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(32+posX-1, 7+posY-1);
  write('  ');
  textcolor(2); textbackground(8);
  gotoxy(2+posX-1, 8+posY-1);
  write(#219,#219);
  textcolor(2); textbackground(3);
  gotoxy(6+posX-1, 8+posY-1);
  write(#219,#219);
  textcolor(2); textbackground(8);
  gotoxy(17+posX-1, 8+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(30+posX-1, 8+posY-1);
  write(#219,#219,#219);
  gotoxy(4+posX-1, 9+posY-1);
  write(#219);
  gotoxy(17+posX-1, 9+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(31+posX-1, 9+posY-1);
  write(#219);
  gotoxy(4+posX-1, 10+posY-1);
  write(#219,#219,#219,#219,#219,#219);
  gotoxy(18+posX-1, 10+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(3+posX-1, 11+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(20+posX-1, 11+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(3+posX-1, 12+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(22+posX-1, 12+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(4+posX-1, 13+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(23+posX-1, 13+posY-1);
  write(#219,#219,#219,#219,#219,#219);
  gotoxy(5+posX-1, 14+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(23+posX-1, 14+posY-1);
  write(#219,#219,#219,#219,#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(1+posX-1, 15+posY-1);
  write('  ');
  textcolor(2); textbackground(8);
  gotoxy(6+posX-1, 15+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219,#219);
  gotoxy(22+posX-1, 15+posY-1);
  write(#219,#219,#219,#219,#219,#219,#219);
  gotoxy(30+posX-1, 15+posY-1);
  write(#219);
  textcolor(15); textbackground(8);
  gotoxy(32+posX-1, 15+posY-1);
  write('  ');
  gotoxy(1+posX-1, 16+posY-1);
  write('  ');
  textcolor(2); textbackground(8);
  gotoxy(7+posX-1, 16+posY-1);
  write(#219,#219,#219,#219,#219,#219);
  gotoxy(23+posX-1, 16+posY-1);
  write(#219,#219,#219,#219,#219);
  gotoxy(30+posX-1, 16+posY-1);
  write(#219);
  textcolor(15); textbackground(8);
  gotoxy(32+posX-1, 16+posY-1);
  write('  ');
  gotoxy(1+posX-1, 17+posY-1);
  write('    ');
  textcolor(2); textbackground(8);
  gotoxy(7+posX-1, 17+posY-1);
  write(#219,#219,#219,#219,#219);
  gotoxy(23+posX-1, 17+posY-1);
  write(#219,#219,#219,#219);
  gotoxy(29+posX-1, 17+posY-1);
  write(#219);
  textcolor(15); textbackground(8);
  gotoxy(30+posX-1, 17+posY-1);
  write('    ');
  gotoxy(1+posX-1, 18+posY-1);
  write('    ');
  textcolor(2); textbackground(8);
  gotoxy(8+posX-1, 18+posY-1);
  write(#219,#219,#219);
  gotoxy(24+posX-1, 18+posY-1);
  write(#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(30+posX-1, 18+posY-1);
  write('    ');
  gotoxy(1+posX-1, 19+posY-1);
  write('      ');
  textcolor(2); textbackground(8);
  gotoxy(8+posX-1, 19+posY-1);
  write(#219,#219);
  textcolor(15); textbackground(8);
  gotoxy(28+posX-1, 19+posY-1);
  write('      ');
  gotoxy(1+posX-1, 20+posY-1);
  write('         ');
  gotoxy(25+posX-1, 20+posY-1);
  write('         ');
  gotoxy(1+posX-1, 21+posY-1);
  write('            ');
  gotoxy(22+posX-1, 21+posY-1);
  write('            ');
  textbackground(black);textcolor(white);
End;

procedure Calceshow (pont:integer);
var n,i,porcP:integer;
begin
	if (pont>=1) then PorcP:=((pont*100 div 1000) div 5)+1 else porcp:=0;;
	textbackground(brown);
	for n:=1 to 21 do begin
		gotoxy(5,2+n);
		for i:=1 to 33 do write(' ');
	end;
	textbackground(black);
	for n:=1 to porcp do begin
		textbackground(lightcyan);textcolor(lightcyan);
		gotoxy(5,(-1*n)+24);
		for i:=1 to 33 do write(#219);
	end;
	Mundo(5,3);
	textbackground(black);textcolor(white);
end;
									  
procedure Jogo;
Var
LofN:array[1..3] of char;
n,n2,t:integer;
goXJ,goYJ:integer;
Begin
	hsatual:=0;
  goXJ:= 45;
  goYJ:= 5;
  frame;
  Calceshow(hsatual);
  gotoxy (goXJ,goYJ +00); write ('1-Como fazer para economizar �gua? ');
  gotoxy (goXJ,goYJ +01); write ('                                   ');
  gotoxy (goXJ,goYJ +02); write ('                                   ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('1)Banhos demorados                 ');
  gotoxy (goXJ,goYJ +05); write ('2)Lavar o quintal todos os dias    ');
  gotoxy (goXJ,goYJ +06); write ('3)Fechar a torneira quando escovar ');
  gotoxy (goXJ,goYJ +07); write ('os dentes                          ');
  gotoxy (goXJ,goYJ +08); write ('4)Lavar o carro toda semana        ');
  gotoxy (goXJ,goYJ +09); write ('                                   ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '3': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '1','2','4':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
  gotoxy (goXJ,goYJ +00); write ('2-Quantos litros de �gua s�o gastos');
  gotoxy (goXJ,goYJ +01); write ('em um banho de 30 minutos?         ');
  gotoxy (goXJ,goYJ +02); write ('                                   ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('1)30 litros                        ');
  gotoxy (goXJ,goYJ +06); write ('2)15 litros                        ');
  gotoxy (goXJ,goYJ +07); write ('3)180 litros                       ');
  gotoxy (goXJ,goYJ +08); write ('4)100 litros                       ');
  gotoxy (goXJ,goYJ +09); write ('                                   ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '3': begin
					HsAtual:= HsAtual+n;
          break;
        end;
        '1','2','4':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('3-Se reduzirmos o banho de 30      ');
  gotoxy (goXJ,goYJ +01); write ('minutos para 10 minutos, quantos   ');
  gotoxy (goXJ,goYJ +02); write ('litros de �gua economizaremos?     ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('                                   ');
  gotoxy (goXJ,goYJ +06); write ('1)10 litros                        ');
  gotoxy (goXJ,goYJ +07); write ('2)40 litros                        ');
  gotoxy (goXJ,goYJ +08); write ('3)20 litros                        ');
  gotoxy (goXJ,goYJ +09); write ('4)35 litros                        ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '2': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '1','3','4':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('4-Quantos litros de �gua voc� gasta');
  gotoxy (goXJ,goYJ +01); write ('lavando o carro e a casa toda      ');
  gotoxy (goXJ,goYJ +02); write ('semana?                            ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('                                   ');
  gotoxy (goXJ,goYJ +06); write ('1)750 litros                       ');
  gotoxy (goXJ,goYJ +07); write ('2)250 litros                       ');
  gotoxy (goXJ,goYJ +08); write ('3)300 litros                       ');
  gotoxy (goXJ,goYJ +09); write ('4)100 litros                       ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '1': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '4','2','3':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('5-Quantos litros de �gua s�o gastos');
  gotoxy (goXJ,goYJ +01); write ('ao deixar uma torneira parcialmente');
  gotoxy (goXJ,goYJ +02); write ('aberta por 15 min?                 ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('                                   ');
  gotoxy (goXJ,goYJ +06); write ('1)26 litros                        ');
  gotoxy (goXJ,goYJ +07); write ('2)16 litros                        ');
  gotoxy (goXJ,goYJ +08); write ('3)329 litros                       ');
  gotoxy (goXJ,goYJ +09); write ('4)243 litros                       ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '4': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '1','2','3':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('6-Quantos litros de �gua em m�dia  ');
  gotoxy (goXJ,goYJ +01); write ('cada pessoa na cidade de S�o Paulo ');
  gotoxy (goXJ,goYJ +02); write ('gasta por dia?                     ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('1)350 litros                       ');
  gotoxy (goXJ,goYJ +06); write ('2)600 litros                       ');
  gotoxy (goXJ,goYJ +07); write ('3)20 litros                        ');
  gotoxy (goXJ,goYJ +08); write ('4)180 litros                       ');
  gotoxy (goXJ,goYJ +09); write ('                                   ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '4': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '1','2','3':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('7-Quantos litros de �gua gastamos  ');
  gotoxy (goXJ,goYJ +01); write ('para escovar os dentes 3 vezes     ');
  gotoxy (goXJ,goYJ +02); write ('ao dia?                            ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('                                   ');
  gotoxy (goXJ,goYJ +06); write ('1)5 litros                         ');
  gotoxy (goXJ,goYJ +07); write ('2)10 litros                        ');
  gotoxy (goXJ,goYJ +08); write ('3)2,4 litros                       ');
  gotoxy (goXJ,goYJ +09); write ('4)1,0 litros                       ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '3': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '1','4','2':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('8-Qual a maior represa do Brasil?  ');
  gotoxy (goXJ,goYJ +01); write ('                                   ');
  gotoxy (goXJ,goYJ +02); write ('                                   ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('1)Balbina (AM)                     ');
  gotoxy (goXJ,goYJ +05); write ('2)Sobradinho (BA)                  ');
  gotoxy (goXJ,goYJ +06); write ('3)Itaipu (PR)                      ');
  gotoxy (goXJ,goYJ +07); write ('4)Peixe (GO)                       ');
  gotoxy (goXJ,goYJ +08); write ('                                   ');
  gotoxy (goXJ,goYJ +09); write ('                                   ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '2': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '1','2','4':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('9-Onde fica a maior bacia          ');
  gotoxy (goXJ,goYJ +01); write ('hidrogr�fica de todo o mundo?      ');
  gotoxy (goXJ,goYJ +02); write ('                                   ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('1)Amaz�nia                         ');
  gotoxy (goXJ,goYJ +06); write ('2)R�ssia                           ');
  gotoxy (goXJ,goYJ +07); write ('3)Congo                            ');
  gotoxy (goXJ,goYJ +08); write ('4)Egito                            ');
  gotoxy (goXJ,goYJ +09); write ('                                   ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '1': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '4','2','3':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
	gotoxy (goXJ,goYJ +00); write ('10-Qual represa que abastece o     ');
  gotoxy (goXJ,goYJ +01); write ('Rio de Janeiro?                    ');
  gotoxy (goXJ,goYJ +02); write ('                                   ');
  gotoxy (goXJ,goYJ +03); write ('                                   ');
  gotoxy (goXJ,goYJ +04); write ('                                   ');
  gotoxy (goXJ,goYJ +05); write ('1)Sistema Cantareira               ');
  gotoxy (goXJ,goYJ +06); write ('2)Billings                         ');
  gotoxy (goXJ,goYJ +07); write ('3)Santa Branca                     ');
  gotoxy (goXJ,goYJ +08); write ('4)Peixe                            ');
  gotoxy (goXJ,goYJ +09); write ('                                   ');
  gotoxy (goXJ,goYJ +10);
  t:=25;
  n2:=4;
  for n:= 100 downto 0 do
  begin
    
    if (n2 = 4) then
    begin
      n2:=0;
      gotoxy(2,24);
      write('Tempo restante= 00:',t:2);
      t:=t-1;
    end;
    
    if (keypressed) then
    begin
      case upcase(readkey) of
        '3': begin
          HsAtual:= HsAtual+n;
          break;
        end;
        '4','2','1':break;
      end;
    end;
    
    n2:=n2+1;
    delay(250);
  End;
  Calceshow(hsatual);
  delay(500);
	HsAtualofN:=login.user;
  highscoreWrite;
end;

//troca o caractere da senha por um asterisco (*)
function hiddensenha: string;
var
chS:array[1..16] of char;
n:integer;
senha:string;
begin
  for n:=1 to 16 do
  begin
    gotoxy(goX+n-1,goY);
    chS[n]:=readkey;
    
    if chS[n]=#08 then
    begin
      n:=n-2;
      gotoxy(goX+n,goY);
      write(' ');
    end else
    
		if chS[n]=#13 then break else
    
		if (chS[n]<>#08) or (chS[n]<>#13) then
    begin
      gotoxy(goX+n-1,goY);
      write('*');
      senha:=senha+chS[n];
    end;
  end;
  hiddensenha:=senha;
end;

//registrar
Procedure Singup ;
begin
  goX:=10;goY:=5;
  logo;
  frame;
  assign(cadfile,'dados.dat');
  rewrite(cadfile);
  gotoxy(33,07);write('Login: ');
  gotoxy(33,09);write('Senha: ');
  gotoxy(33,11);write('Confirmar Senha: ');
  gotoxy(33,13);write('E-mail: ');
  gotoxy(40,07);read(login.user);
  goX:=40;goY:=9;
  login.senha:=hiddensenha;
  goX:=50;goY:=11;
  login.confsenha:=hiddensenha;
  gotoxy(41,13);read(login.email);
  if (login.senha=login.confsenha) then
  begin
    write(cadfile,login);
    close(cadfile);
    clrscr;
  end
  else
  begin
    gotoxy(27,15);write('As senha n�o coincidem, tente de novo.');
    readln;
    clrscr;
    singup;
  end;
end;

//menu depois da tela de login
Procedure AfterMenu ;
begin
  clrscr;
  repeat
    goX:=10;goY:=5;
    logo;
    frame;
    gotoxy(35,06);write('Entre com um indice:');
    gotoxy(35,08);write('0.Logout');
    gotoxy(35,10);write('1.Jogar');
    gotoxy(35,12);write('2.Melhor pontua��o');
    gotoxy(35,14);write('3.Como jogar');
    gotoxy(35,16);write('4.Material de estudo');
    gotoxy(35,18);menui:=readkey;val(menui,menu,erro);
    clrscr;
  until erro = 0;
  case menui of
    '0': ;
  '1': begin jogo; highscore; afterMenu; end;
  '2': begin highscore; afterMenu; end;
  '3': begin Srule; afterMenu; end;
  '4': begin matEstudo; afterMenu; end;
    else aftermenu;
  end;
end;

//login
procedure confLog;
var confLogBool:boolean;
begin
	confLogBool:=false;
  goX:=10;goY:=5;
  assign(cadfile, 'dados.dat' ) ;
  reset(cadfile);
  read(cadfile,login);
  repeat
    goX:=10;goY:=5;
    logo;
    frame;
    gotoxy(35,10);write('Para entrar, digite:');
    gotoxy(35,12);write('Login: ');
    gotoxy(35,14);write('Senha: ');
    gotoxy(42,12);read(conf.user);
    goX:=42;goY:=14;conf.senha:=hiddensenha;
    clrscr;
    if (conf.user = login.user) and (conf.senha = login.senha) then confLogBool:=true
    else gotoxy(33,16);write('Login e/ou senha n�o coincidem, tente de novo.');
  until confLogBool=true;
  close(cadfile);
end;

Procedure Menuf ;
begin
  clrscr;
  goX:=10;goY:=5;
  repeat
    logo;
    frame;
    gotoxy(35,8);write('Entre com um indice:');
    gotoxy(35,10);write('0.Sair');
    gotoxy(35,12);write('1.Login');
    gotoxy(35,14);write('2.Registrar');
    gotoxy(35,16);menui:=readkey;val(menui,menu,erro);
    clrscr;
  until erro = 0;
  case menui of
    '0': ;
  '1': begin confLog; end;
  '2': begin singup; Menuf; end;
    else menuf;
  end;
end;

//o programa fica aqui em baixo !!!!
Begin
  loading;
  repeat
    Menuf;
    if menui='0' then break else
    repeat
      clrscr;
      AfterMenu;
      repeat
        clrscr;
        frame;
        logo;
        gotoxy(35,10);write('Sair? (');textcolor(lightgreen);write('S');textcolor(white);write('im/');textcolor(lightgreen);write('N');textcolor(white);write('�o)');
        gotoxy(35,11);confirmar:=readkey;
        if (confirmar='S')or(confirmar='s')or(confirmar='N')or(confirmar='n') then erro:=10 else
      until erro=10;
    until (confirmar ='S') or (confirmar ='s');
    //    if (confirmar ='S') or (confirmar ='s') then break else
  until 2<>2;
End.