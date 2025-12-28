% MiClase.cls - Plantilla básica de clase en LaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{artbook}[2025/05/05 Clase personalizada por Pedro Guzmán]

% Cargar una clase base (como article, book, report)
\LoadClass[10pt,a4paper,openright,twoside]{book}  % Puedes usar también book, report, etc.

% Definir el tamaño de la página y los márgenes
\RequirePackage{graphicx}   % Para incluir imágenes
\RequirePackage{amsmath}    % Para matemáticas avanzadas
\RequirePackage{tikz}
\RequirePackage{amssymb}    % Para símbolos matemáticos
\RequirePackage[utf8]{inputenc} % Para codificación UTF-8
\RequirePackage[T1]{fontenc} % Para codificación de fuentes
\RequirePackage[spanish,shorthands=off]{babel}
\RequirePackage{geometry}
\geometry{%showframe,% draws lines to show margins
	%asymmetric,% if you want the margin notes to always appear on the right side of the page
	% the following are the margins used by the Tufte-LaTeX document classes
	includemp,
	letterpaper,
	left=1in,
	top=1in,
    %bottom=1in,
	headsep=2\baselineskip,
	textwidth=28pc,
	marginparsep=1pc,
	marginparwidth=13pc,
	%textheight=40\baselineskip,
	headheight=\baselineskip,%showframe
}
\RequirePackage{fullwidth} % Para el entorno fullwidth
\RequirePackage{wrapfig} 
\RequirePackage{mwe}
%\usetikzlibrary{arrows.meta} 
\RequirePackage{marginfix}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{marginnote}
\RequirePackage{sidenotes}
\RequirePackage{comment}
\RequirePackage{etoolbox}
\RequirePackage{polynom}
\RequirePackage{longtable}
\RequirePackage{tasks}
\DeclareMathOperator{\senh}{senh}
\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\csch}{csch}
\RequirePackage[tikz]{bclogo}
%%%%%% Para los teoremas %%%%%%%

%\newtheorem{teo}{Teorema}[section] %-- Listo
%\newtheorem{defi}{Definici\'{o}n}[section] %-- Listo
%\newtheorem{ejemplo}{Ejemplo}[section]
\newtheorem{lemma}{Lema}[section]
\newtheorem{sol}{Soluci\'on}[section]
%\newtheorem{coro}{Corolario}[section]%--Listo
%\newtheorem{prop}{Propiedad}[section]  %-- Listo
%\newtheorem{proposition}{Proposici\'{o}n}[section]
%\newtheorem{note}{Nota}[section]
%\newtheorem{remark}{Observaci\'{o}n}[section]
%\newtheorem{open}{Problema Abierto}[chapter]
\newtheorem{demo}{Demostraci\'{o}n}[section]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[most,many]{tcolorbox} 

%----Cajas para los Teorema, Definicion, Propiedad, Proposicion, Corolario--%

% Definimos un estilo personalizado para teoremas
\tcbset{
	mytheorem/.style={
		enhanced,
		sharp corners,
		attach boxed title to top left={
			xshift=-1mm,
			yshift=-5mm,
			yshifttext=-1mm
		},
		top=1.5em,
		colback=blue!5!white,
		colframe=blue!65!violet,
		fonttitle=\bfseries,
		boxed title style={
			sharp corners,
			size=small,
			colback=blue!65!violet,
			colframe=blue!65!violet,
		},
		coltitle=white,
		breakable % Permite que el contenido se divida entre páginas
	}
}

% Comando para crear teoremas con contador
\newcounter{theorem}[section]
\renewcommand{\thetheorem}{\thesection.\arabic{theorem}}

\newcommand{\Theorem}[2]{
	\refstepcounter{theorem} % Avanza el contador del teorema
	\begin{tcolorbox}[title={Teorema \thetheorem: #1}, mytheorem]
		#2
	\end{tcolorbox}
	
	
}


% Definimos un estilo personalizado para definiciones
\tcbset{
	mydefinition/.style={
		enhanced,
		sharp corners,
		attach boxed title to top left={
			xshift=-1mm,
			yshift=-5mm,
			yshifttext=-1mm
		},
		top=1.5em,
		colback=teal!5!white, 
		colframe=teal!95!black,
		fonttitle=\bfseries,
		boxed title style={
			sharp corners,
			size=small,
			colback=teal!95!black,
			colframe=teal!95!black,
		},
		coltitle=white,
		breakable % Permite que el contenido se divida entre páginas
	}
}

% Comando para crear definiciones con contador
\newcounter{definition}[section]
\renewcommand{\thedefinition}{\thesection.\arabic{definition}}

\newcommand{\Definition}[2]{
	\refstepcounter{definition} % Avanza el contador de la definición
	\begin{tcolorbox}[title={Definición \thedefinition: #1}, mydefinition]
		#2
	\end{tcolorbox}
}

%----------------------------------------------------
% Definimos un estilo personalizado para corolarios
\tcbset{
	mycorollary/.style={
		enhanced,
		sharp corners,
		attach boxed title to top left={
			xshift=-1mm,
			yshift=-5mm,
			yshifttext=-1mm
		},
		top=1.5em,
		colback=white!95!black,
		colframe=black!75!black, % Color del cuadro en black!75!black
		fonttitle=\bfseries,
		boxed title style={
			sharp corners,
			size=small,
			colback=black!75!black, % Color del título en black!75!black
			colframe=black!75!black,
		},
		coltitle=white,
		breakable % Permite que el contenido se divida entre páginas
	}
}

% Comando para crear corolarios con contador
\newcounter{corollary}[section]
\renewcommand{\thecorollary}{\thesection.\arabic{corollary}}

\newcommand{\Corollary}[2]{
	\refstepcounter{corollary} % Avanza el contador del corolario
	\begin{tcolorbox}[title={Corolario \thecorollary: #1}, mycorollary]
		#2
	\end{tcolorbox}
}

%-------------------------------------------------------------------

% Definimos un estilo personalizado para propiedades
\tcbset{
	myproperty/.style={
		enhanced,
		sharp corners,
		attach boxed title to top left={
			xshift=-1mm,
			yshift=-5mm,
			yshifttext=-1mm
		},
		top=1.5em,
		colback=cyan!5!white,
		colframe=cyan!75!black, % Color del cuadro en cyan!75!black
		fonttitle=\bfseries,
		boxed title style={
			sharp corners,
			size=small,
			colback=cyan!75!black, % Color del título en cyan!75!black
			colframe=cyan!75!black,
		},
		coltitle=white,
		breakable % Permite que el contenido se divida entre páginas
	}
}

% Comando para crear propiedades con contador
\newcounter{property}[section]
\renewcommand{\theproperty}{\thesection.\arabic{property}}

\newcommand{\Property}[2]{
	\refstepcounter{property} % Avanza el contador de la propiedad
	\begin{tcolorbox}[title={Propiedad \theproperty: #1}, myproperty]
		#2
	\end{tcolorbox}
}

%-------------------------------------------------------------------

% Definimos un estilo personalizado para proposiciones
\tcbset{
	myproposition/.style={
		enhanced,
		sharp corners,
		attach boxed title to top left={
			xshift=-1mm,
			yshift=-5mm,
			yshifttext=-1mm
		},
		top=1.5em,
		colback=SeaGreen!5!white,
		colframe=SeaGreen!75!black, % Color del cuadro en SeaGreen!85!black
		fonttitle=\bfseries,
		boxed title style={
			sharp corners,
			size=small,
			colback=SeaGreen!75!black, % Color del título en SeaGreen!75!black
			colframe=SeaGreen!75!black,
		},
		coltitle=white,
		breakable % Permite que el contenido se divida entre páginas
	}
}

% Comando para crear proposiciones con contador
\newcounter{proposition}[section]
\renewcommand{\theproposition}{\thesection.\arabic{proposition}}

\newcommand{\Proposition}[2]{
	\refstepcounter{proposition} % Avanza el contador de la proposición
	\begin{tcolorbox}[title={Proposición \theproposition: #1}, myproposition]
		#2
	\end{tcolorbox}
}

%---------------------Aqui termina las cajas----------------------- 

\definecolor{greentitle}{RGB}{61,170,61}
\definecolor{greentitleback}{RGB}{216,233,213}


\newtcolorbox[
auto counter,
number within=section
]{myexample}[2][]{%
	breakable,
	enhanced,
	colback=white,
	colbacktitle=white,
	arc=0pt,
	leftrule=0pt,
	rightrule=0pt,
	toprule=1pt,
	bottomrule=0pt,
	titlerule=0pt,
	colframe=greentitleback,
	fonttitle=\normalcolor,
	overlay={
		\node[
		outer sep=0pt,
		anchor=east,
		text width=3.0cm,
		minimum height=4ex,
		fill=greentitleback,
		font=\color{greentitle}\sffamily\scshape
		] at (title.west) {example~\thetcbcounter};
	},
	title=#2,
	#1
}
\newcommand\Solution{\par\textbf{\textsf{Solution}}\par\medskip}

%%%%%%% Cosas para guardar %%%%%%%%


\NewTotalTColorBox[auto counter, number within=section]{\Example}{ +m +m }{ 
	notitle,
	colback=blue!5!white,
	colbacklower=white,
	frame hidden,
	boxrule=0pt,
	bicolor,
	sharp corners,
	borderline west={4pt}{0pt}{blue!50!black},
	fontupper=%\sffamily
}{
	\textcolor{blue!50!black}{
		%\sffamily
		\textbf{Ejemplo~\thetcbcounter.}%
	}%
	#1
	\tcblower%
	\textcolor{blue!50!black}{
		\sffamily
		%\textbf{Proof.}%
	}%
	#2
}

\NewTotalTColorBox[auto counter]{\Comentario}{ +m +m }{ 
	notitle,
	colback=black!5!white,
	colbacklower=white,
	frame hidden,
	boxrule=0pt,
	bicolor,
	sharp corners,
	borderline west={4pt}{0pt}{black!50!black},
	fontupper=\sffamily
}{
	\textcolor{black!50!black}{
		\sffamily
		\textbf{Comentario~\thetcbcounter.}%
	}%
	#1
	\tcblower%
	\textcolor{black!50!black}{
		\sffamily
		%\textbf{Proof.}%
	}%
	#2
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%% End Fancy Box %%%%%%%
\RequirePackage{tikzpagenodes}
\RequirePackage[hidelinks]{hyperref} 
\RequirePackage{xcolor}
\RequirePackage[dvipsnames]{xcolor}
%\RequirePackage[spanish,shorthands=off]{babel} 
\RequirePackage{import}
%\RequirePackage{etoc}
\RequirePackage{mwe}
\RequirePackage{needspace}
\makeindex      
\RequirePackage{changepage}
\RequirePackage{multicol}
\RequirePackage{pdfpages}   

%------- Titulo ---------% 

\def\makefrontcover{\includepdf{Portada/portada.pdf}}
\def\makefrontcoverback{\includepdf{Portada/backportada.pdf}}

%---- Para el indice ----%

%%%%%%%%%%% Imagen en el margen %%%
%\usepackage{wrapfig}
%\input{insbox/insbox.tex} %Crea 
%%\newcommand{\figuretoc}[1]{
%	\InsertBoxL{0}{
%		\begin{tikzpicture}
%			\node[name=caja]{
%				\includegraphics[height=4.0cm]{#1}
%			};
%			\draw [line width=1pt,rounded corners=5pt](caja.north west) rectangle (caja.south east);
%			\draw [line width=0.5pt] ([yshift=-1mm]caja.south west)--([yshift=-1mm]caja.south east);
%		\end{tikzpicture}
%	}
	
	%\begin{center}
	
	%\end{center}
	
%}


