%
% Wojciech Pawlak's DTU Report Latex Class
%

\ProvidesClass{wpdtureport}
\NeedsTeXFormat{LaTeX2e}

% Based on the memoir class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}

% Fixes
\RequirePackage[l2tabu, orthodox]{nag} 	
% warn the user about the use of commands, classes
% and packages which are outdated and superseded

\RequirePackage{memhfixc} % fixes to memoir class
\RequirePackage{etex} % increase register size, include e.g. TikZ without strange errors
\RequirePackage{fixltx2e} % fixes some LaTeX2e errors

% Fonts
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel} % english hyphenation
\RequirePackage{lmodern} % better i18n Postscript version of Knuth's cm fonts
\RequirePackage{textcomp} % provides extra symbols
\RequirePackage{siunitx} % helps in typestting SI-units correctly

% Line breaking
\RequirePackage[final=true,step=1]{microtype}
\RequirePackage{ragged2e}
\RequirePackage[a4paper]{geometry}

% Layout
%\RequirePackage{pdflscape} % landscape layout, work better with PDF

% Colors 
%\RequirePackage{color} 
\RequirePackage{xcolor} % support coloured text

% Graphics
\RequirePackage{graphicx}
\RequirePackage{float} % allows for the placement H for float

% Math
\RequirePackage[intlimits,leqno]{amsmath}
\RequirePackage{amssymb} % Symbol library
\RequirePackage[all,error]{onlyamsmath}  % Error on deprecated math commands like $$ $$.
\RequirePackage{fixmath}

% Misc
\RequirePackage{textpos} % absolute positioning of text on the page
%\RequirePackage[crop=pdfcrop]{pstool} % ?
%\RequirePackage{relsize} %  set font sizes relative to the current size

% Tables
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{multirow} % Columns spanning multiple rows

% Bookmarks for sections and lists and turns references and urls into links.
\RequirePackage[backref]{hyperref} 

% Sourcecode listings
\RequirePackage{listings} 

% Bibliography
%\RequirePackage[square]{natbib} % extension to Bibliography package, for Harvard style 

% Compilation-time checks
\RequirePackage{strict}
\RequirePackage[strict=true]{csquotes}
\RequirePackage{refcheck}

% TODO lists
\RequirePackage{todonotes}

% multiline comments
\RequirePackage{verbatim}

% Nomenclature
%\RequirePackage[intoc]{nomencl} % Nomenclature package

% Index
%\RequirePackage{makeidx}



% Define report data
\def\ThTitleEN{Final Report}
\def\ThSubtitleEN{A GPU-accelerated Navier-Stokes Solver using OpenCL}
\def\ThCourseName{Special Course at GPUlab, Scientific Computing Section, DTU}
\def\ThAuthors{Wojciech Pawlak (s091820)}
\def\ThSupervisors{Allan P. Engsig-Karup Ph.D.}



% Folder where figures should be saved
\graphicspath{{resources/}}

\everymath{\displaystyle}

% Avoid a warning
\pdfminorversion=5

% Define layout dimensions
\setlength{\parindent}{0pt}
\setlength\parskip{1.6\baselineskip plus .8\baselineskip minus 1.4\baselineskip}

\setlrmarginsandblock{30mm}{20mm}{*}
\setulmarginsandblock{30mm}{30mm}{*}
\setheadfoot{8mm}{10mm}
\checkandfixthelayout

% Define chapter style
\makechapterstyle{wpdtu}{%
 	\renewcommand\chapnamefont{\normalfont\Huge\sffamily\raggedleft}
 	\renewcommand\chaptitlefont{\normalfont\Huge\bfseries\sffamily}
 	\renewcommand\chaptername{}
	\renewcommand\chapternamenum{}
 	\renewcommand\printchapternum{%
  	\makebox[0pt][l]{\hspace{0.4em}%
   		\resizebox{!}{0.7cm}{% requires the graphicx package
  		\normalfont\sffamily\bfseries\thechapter}}}
 	\renewcommand\afterchapternum{\par\hspace{1.5cm}\midchapskip}
}


% Enable indexing
%\makeindex

% Enable nomenclature
%\makenomenclature

% Make a list of appendices
\newlistof{listofappendices}{loa}{List of Appendices}
\newcounter{appCnt}
\renewcommand{\theappCnt}{\Alph{appCnt}}
\newcommand{\appChapter}[1]{%
 \refstepcounter{appCnt}%
 \chapter*{\theappCnt\ #1}%
 \addcontentsline{loa}{appCnt}{\numberline{\theappCnt}#1}
}
\newlistentry{appCnt}{loa}{0}
\newlistentry[appCnt]{appSec}{loa}{1}
\newcommand{\appSection}[1]{%
 \refstepcounter{appSec}%
 \section*{\theappSec\ #1}%
 \addcontentsline{loa}{appSec}{\protect\numberline{\theappSec}#1}
}
\setcounter{loadepth}{2}

% Enable line numbering
%\RequirePackage{lineno}
%\pagewiselinenumbers
%\modulolinenumbers[5]

%\EndPreamble

% Table of contents settings
\renewcommand{\contentsname}{Table of Contents}
\maxtocdepth{subsection} % Subsections and above
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3} 

% Figure Macros
\newcommand{\figuremacro}[3]{
	\begin{figure}[H]
		\centering
		\includegraphics[width=1\textwidth]{#1}
		\caption[#2]{\textbf{#2} #3}
		\label{#1}
	\end{figure}
}

\newcommand{\figuremacroW}[4]{
	\begin{figure}[H]
		\centering
		\includegraphics[width=#4\textwidth]{#1}
		\caption[#2]{\textbf{#2} #3}
		\label{#1}
	\end{figure}
}


% Code listings settings
\lstset{ %
language=C,                		% the language of the code
basicstyle=\footnotesize\ttfamily,       	% the size of the fonts that are used for the code
%stringstyle=\texttt,
%numbers=left,                   		% where to put the line-numbers
%numberstyle=\footnotesize,      	% the size of the fonts that are used for the line-numbers
%stepnumber=2,                   	% the step between two line-numbers. If it's 1, each line will be numbered
%numbersep=10pt,                 	% how far the line-numbers are from the code
%backgroundcolor=\color{white},  % choose the background color. You must add \RequirePackage{color}
%showspaces=false,               	% show spaces adding particular underscores
showstringspaces=false,         	% underline spaces within strings
%showtabs=false,                 	% show tabs within strings adding particular underscores
%frame=single,                   		% adds a frame around the code
%tabsize=2,                      		% sets default tabsize to 2 spaces
%captionpos=b,                   		% sets the caption-position to bottom
breaklines=true,                	% sets automatic line breaking
%breakatwhitespace=false,        	% sets if automatic breaks should only happen at whitespace
%title=\lstname,                 		% show the filename of files included with \lstinputlisting;
                                		% also try caption instead of title
%escapeinside={\%*}{*)},        	% if you want to add a comment within your code
%morekeywords={*,...}            	% if you want to add more keywords to the set
keywordstyle=\color[rgb]{0,0,1},
commentstyle=\color[rgb]{0,0.5,0}
}

% Make floats name bold
\captionnamefont{\bfseries}

% Get a signature command
%\makeatletter
%\newcommand*{\getlength}[1]{\strip@pt#1}
%\makeatother
%
%\newlength{\signlength}
%\setlength{\signlength}{0.5\textwidth}
%
%\newcommand{\signature}[1]{%
%\line(1,0){\getlength{\signlength}}\\
%\noindent #1
%}

% Add measuring units to nomenclature
%\newcommand{\nomunit}[1]{\renewcommand{\nomentryend}{\hspace*{\fill}#1}}

% Company logo
\def\bCompanyLogo{false}

% Title Page
\renewcommand{\maketitle}{
	\begin{titlingpage}
  		\begin{flushright}
   			\includegraphics[width=10cm]{resources/tex_dtu_uk_a1_cmyk}
   		\end{flushright}
		 
   		\vspace{\stretch{1}}
   		
   		{\sffamily\large\ThAuthors\\[2cm]}
    	{\sffamily\Huge\textbf{\ThTitleEN}\\[0.2cm]}
    	{\sffamily\Large\ThSubtitleEN\\[2cm]}
    	{\sffamily\large\ThCourseName\\[0.2cm]}
    	{\sffamily\large Supervisor: \ThSupervisors\\[0.5cm]}
    	{\sffamily\today}
    	
   		\vspace{\stretch{2}}

		\includegraphics[width=10cm]{resources/tex_dtu_informatik_a_uk}
	\end{titlingpage}
}