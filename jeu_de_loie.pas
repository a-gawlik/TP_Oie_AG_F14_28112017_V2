{Jeu de l'oie:
le jeu se joue seul
Le joueur est caractérisé par un nombre appelé place compris
entre 0 et 66 qui situe sa position sur le jeu de l'oie
Sachant qu'après j'ai deux D6, n applique les règles suivantes:
on avance du nombre indiqué des dés. Si on arrive sur la case 66,
le jeu est terminé, sinon on recule du nombre restant.
Une oie toutes les 9 cases, sauf en 63, double les déplacement
une tête de mort, à la case 58, renvoie à la position de départ (0)

On utilisera un maximum de constantes
Algo et code lisible et clair avec commentaires
Vérifier si le jet de dé est valide
Il est conseillé d'utiliser MOD pour tester si une case est mutliple de 9.

Version 1 du programme : Vous êtes le joueur, vous lancez vous même vos dés, un par un.
Version 2 du programme : réaliser une méthode permettant de gérer l'aléatoire.}




{
ALGORITHME:JEU_DE_LOIE

//BUT: recréer le jeu de l'oie pour un joueur dans une version algorithmique.
//PRINCIPE: A l'aide d'une boucle répéter on gère les tours du joueur. Des ruptures en SI nous permettrons de gérer les conditions commes la case "mort", "oie", et l'arrivée.
//ENTREE: jets de dés
//SORTIES: position pendant le jeu puis victoire.

CONST
	arrivee<-66:ENTIER
	mort<-58:ENTIER
	depart<-0:ENTIER

VAR
	place,de1,de2,reste:ENTIER

DEBUT
	//initialisation des variables
	place<-depart
	de1<-0
	de2<-0
	//fin

	ECRIRE "Bienvenue dans le jeu de l'oie"
	REPETER

		ECRIRE "Veuillez lancer un D6. Quel est le resultat ?"
		LIRE de1
		TANTQUE (de1<1) OU (de1>6)
		FAIRE
			ECRIRE "Votre jet est invalide, quel est le resultat ?"
			LIRE de1
		FINTANTQUE

		ECRIRE "Veuillez lancer votre second D6. Quel est le resultat ?"
		LIRE de2
		TANTQUE (de2<1) OU (de2>6)
		FAIRE
			ECRIRE "Votre jet est invalide, quel est le resultat ?"
			LIRE de2
		FINTANTQUE

		REPETER
			SI (place MOD 9=0) ET NON (place=63) ALORS
				ECRIRE "Vous êtes tombé sur la case ",place,""  qui est une case de l'oie, vous avancez à nouveau du meme nombre de case !"
				place<-place+de1+de2
			FINSI
		JUSQUA (place MOD 9<>0) OU (place=63)

		SI (place>arrivee) ALORS	//Rupture SI permettant de déterminer si le joueur a dépassé la case d'arrivée et doit donc retourner en arrière.
		reste<-place-arrivee 		//la variable "reste" est la différence entre la position où est arrivé le joueur et le maximum du plateau. Il correspond au reste de cases que le joueur doit parcourir en arrière.
		ECRIRE "Vous avez depassé la case 66 et revenez donc en arriere de ",reste," cases."
		place<-arrivee-reste
		FINSI

		ECRIRE "Vous etes actuellement a la case : ",place

		SI (place=mort) ALORS //rupture SI permettant de déterminer si le joueur est tmombé sur la case "mort" le faisant revenir au départ.
			place<-depart
			ECRIRE "Vous etes tombé sur la case "mort" et retournez par conséquent à la case 0 !"
		FINSI

	JUSQUA (place=arrivee) //Condition de sortie
	ECRIRE "Vous avez atteint l'arrivée, vous avez gagné !"
FIN
}

PROGRAM
	JEU_DE_LOIE;

USES
	crt;

CONST
	oie=63; //changer sa valeur permet de modifier la dernière case n'étant pas une case de l'oie.
	multiple_oie=9; //Permet de modifier le multiple correspondant aux cases doublant les déplacements.
	arrivee=66;	//Permet de changer la case finale, celle de l'arrivée
	mort=58; //Permet de modifier la case renvoyant au début du jeu.
	depart=0; //Défini la case de départ.

VAR
	place,de1,de2,reste:INTEGER;
	
BEGIN
	clrscr;
	place:=depart;	//initialisation des variables
	de1:=0;
	de2:=0;		//fin

	writeln('Bienvenue dans le jeu de l oie');
	REPEAT
		writeln('Veuillez lancer un D6. Quel est le resultat ?');
		readln(de1);
		WHILE (de1<1) OR (de1>6) DO 					// Boucle permettant de prendre en compte un score erroné pour le premier dé
			begin
			writeln('Votre jet est invalide, quel est le resultat ?');
			readln(de1);
			end;

		writeln('Veuillez lancer votre second D6. Quel est le resultat ?');
		readln(de2);
		WHILE (de2<1) OR (de2>6) DO 					// Boucle permettant de prendre en compte un score erroné pour le second dé
			begin
			writeln('Votre jet est invalide, quel est le resultat ?');
			readln(de2);
			end;
		place:=place+de1+de2;

		REPEAT	//Boucle répéter permettant au joueur d'activer la case de l'oie plusieurs fois si il tombe à plusieurs reprises dessus en un jet.
		IF (place MOD multiple_oie=0) AND NOT (place>=oie) THEN		//Rupture SI permettant de déterminer si le joueur est oui ou non tombé sur une case de l'oie.
		begin
			writeln('Vous etes tombe sur la case ',place,'  qui est une case de l oie, vous avancez a nouveau du meme nombre de case !');
			place:=place+de1+de2;
		end;
		UNTIL (place MOD multiple_oie<>0) OR (place>=oie);

		IF (place>arrivee) THEN	//Rupture SI permettant de déterminer si le joueur a dépassé la case d'arrivée et doit donc retourner en arrière.
		begin
		reste:=place-arrivee; //la variable "reste" est la différence entre la position où est arrivé le joueur et le maximum du plateau. Il correspond au reste de cases que le joueur doit parcourir en arrière.
		writeln('Vous avez depasse la case 66 et revenez donc en arriere de ',reste,' cases');
		place:=arrivee-reste;
		end;

		writeln('Vous etes actuellement a la case : ',place);

		IF (place=mort) THEN //rupture SI permettant de déterminer si le joueur est tmombé sur la case "mort" le faisant revenir au départ.
		begin
			place:=depart;
			writeln('Vous etes tombe sur la case "mort" et retournez par consequent a la case 0 !');
		end;

	UNTIL (place=arrivee); //Condition de sortie
	writeln('Vous avez atteint l arrivee, vous avez gagne !');
	readkey;

END.