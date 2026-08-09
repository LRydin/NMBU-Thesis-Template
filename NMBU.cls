% NMBU Thesis Class
%
% (c) Leonardo Rydin Gorjão 2024--2026
% Special thanks to Hallvard Lavik for the help with version v0.3.0
%
%% This class can be redistributed and/or modified freely.

\NeedsTeXFormat{LaTeX2e}[2020-10-01]
\ProvidesClass{NMBU}
  [2026/08/09 v0.4.0 NMBU LaTeX class for thesis writing]

% List of all options available:
% - masters: Master's thesis on A4 paper (default)
% - phd: PhD thesis on A5 paper, in a book format
% - a4paper/a5paper: Compatibility options; the degree controls paper size
% - en: English writing
% - bm: Bokmål writing
% - nn: Nynorsk writing
% - article: Use sections as the highest division for a Master's thesis
% - book: Use chapters as the highest division (automatic for a PhD thesis)
% - APA: Use APA 7th citation style (default is numeric)
% - listoffigures: Add a list of figures to the thesis
% - listoftables: Add a list of tables to the thesis
% - acronyms: Add the acronym list supplied with \acronyms{...}
% - forewordfirst: Place the foreword before the abstracts
% - norwegiandates: Accept legacy DD.MM.YYYY access dates in .bib files

% Word of advice: When you are done with your thesis, change the compiler in 
% Overleaf to XeLaTeX! This will make your fonts and title page look much nicer 
% than in pdfLaTeX. Just go to "Menu", in the "Settings", find "Compiler" and 
% change to XeLaTeX.

% This documentclass also comes with a "main.tex" file to help you understand 
% the use of the different commands and how to best write an academic thesis, as
% well as an exemplary bibliography file with a few explanations therein.

% The NMBU class is designed to help you write your thesis, while printing the 
% cover and back page automatically, and managing the metadata of your thesis. 
% Make sure to include the information below to generate your title. You can set
% the language you are writing in with "en" for english, "bm" for bokmål, or 
% "nn" for nynorsk. Currently, there are no implementations for Swedish or 
% Danish, so talk with your supervisor(s) if you intend to write in these 
% languages.

% A table of contents is automatically included. If you have more than one 
% figure, you need a list of figures by adding "listoffigures" to the 
% documentclass parameters. If you have more than one table, you need a list of
% tables by adding "listoftables" to the documentclass parameters.

% There are two primary styles of references/bibliography used: "numeric" and 
% "APA" reference styles (APA 7th). "numeric" style uses numbers in your 
% citation, e.g., [1,2]. "APA", following the American Psychological 
% and will organise the authors differently in the reference list at the end of 
% your document. Add "APA" in the document class if you want to use this style. 
% Confer with your supervisor(s) on which style is preferable. To print the 
% references, use "\references" at the end of your document, but before your 
% appendices!

% Your appendix or appendices should come after your references. To start your 
% appendix section, use "\appendices"

% When you finish your thesis, switch the LaTeX compiler from pdfLaTeX to 
% XeLaTeX (on Overleaf, "Menu"->"Compiler"). This is for 2 reasons: 1) to 
% produce your front page with the Arial font; 2) XeLaTeX produces better fonts
% and (usually) smaller PDFs. Every kilobyte of space we save helps reduce 
% CO2 emissions :)
  
% Good luck with your thesis! If you get in trouble with LaTeX stuff, write to 
% me: leonardo.rydin@gmail.com

% In your .tex file, you need to include the following information to produce 
% the first page of your thesis


% \title{}
% \author{}
% \thesisyear{}
% \credits{30}
% \faculty{Faculty of Science and Technology}
% \studyprogramme{Environmental Physics and Renewable Energy}
% \supervisor{} % Include the name of the supervisor or supervisors
% \engtitle{} % Only if you write a thesis in a Scandinavian language

% Note that the "studyprogramme" is not shown anywhere on the title page but is
% included in the metadata of your thesis

\newif\ifNMBU@book
\newif\ifNMBU@article
\newif\ifNMBU@aivpaper
\newif\ifNMBU@articleoptionrequested
\newif\ifNMBU@aivpaperoptionrequested
\newif\ifNMBU@avpaperoptionrequested
\newif\ifNMBU@apa
\newif\ifNMBU@listoffigures
\newif\ifNMBU@listoftables
\newif\ifNMBU@acronyms
\newif\ifNMBU@forewordfirst
\newif\ifNMBU@norwegiandates
\newif\ifNMBU@namedauthorsalias

\def\NMBU@language{en}
\def\NMBU@degree{masters}
\def\NMBU@colourprofile{masters}
\def\NMBU@fontsize{11pt}
\def\NMBU@baseoptions{}
\def\NMBU@masters{masters}
\def\NMBU@phd{phd}

\def\NMBU@addbaseoption#1{%
  \ifx\NMBU@baseoptions\@empty
    \edef\NMBU@baseoptions{#1}%
  \else
    \edef\NMBU@baseoptions{\NMBU@baseoptions,#1}%
  \fi
}

\DeclareOption{article}{%
  \NMBU@bookfalse
  \NMBU@articleoptionrequestedtrue
}
\DeclareOption{book}{\NMBU@booktrue}

\DeclareOption{10pt}{\def\NMBU@fontsize{10pt}}
\DeclareOption{11pt}{\def\NMBU@fontsize{11pt}}
\DeclareOption{12pt}{\def\NMBU@fontsize{12pt}}

\DeclareOption{en}{\def\NMBU@language{en}}
\DeclareOption{bm}{\def\NMBU@language{bm}}
\DeclareOption{nn}{\def\NMBU@language{nn}}

\DeclareOption{masters}{%
  \def\NMBU@degree{masters}%
  \def\NMBU@colourprofile{masters}%
}
\DeclareOption{phd}{%
  \def\NMBU@degree{phd}%
  \def\NMBU@colourprofile{phd}%
}
\DeclareOption{green}{\def\NMBU@colourprofile{green}}

\DeclareOption{a4paper}{\NMBU@aivpaperoptionrequestedtrue}
\DeclareOption{a5paper}{\NMBU@avpaperoptionrequestedtrue}

\DeclareOption{APA}{\NMBU@apatrue}
\DeclareOption{apa}{\NMBU@apatrue}
\DeclareOption{namedauthors}{%
  \NMBU@apatrue
  \NMBU@namedauthorsaliastrue
}
\DeclareOption{listoffigures}{\NMBU@listoffigurestrue}
\DeclareOption{listoftables}{\NMBU@listoftablestrue}
\DeclareOption{acronyms}{\NMBU@acronymstrue}
\DeclareOption{forewordfirst}{\NMBU@forewordfirsttrue}
\DeclareOption{norwegiandates}{\NMBU@norwegiandatestrue}

\DeclareOption*{\expandafter\NMBU@addbaseoption\expandafter{\CurrentOption}}

\ExecuteOptions{masters,en,11pt}
\ProcessOptions*\relax

\ifNMBU@aivpaperoptionrequested
  \ifNMBU@avpaperoptionrequested
    \ClassWarningNoLine{NMBU}{Both `a4paper' and `a5paper' were requested; the 
    degree option determines the paper size}%
  \fi
\fi

% Master's theses are A4 sized, and may use either article or book structure. 
% PhD theses are A5 sized and should be written in a book format.
\ifx\NMBU@degree\NMBU@phd
  \NMBU@aivpaperfalse
  \def\NMBU@paperoption{a5paper}%
  \ifNMBU@articleoptionrequested
    \ClassWarningNoLine{NMBU}{Option `article' ignored because PhD theses use 
    the book superclass}%
  \fi
  \NMBU@booktrue
  \ifNMBU@aivpaperoptionrequested
    \ClassWarningNoLine{NMBU}{Option `a4paper' ignored because PhD theses use A5
    paper}%
  \fi
\else
  \NMBU@aivpapertrue
  \def\NMBU@paperoption{a4paper}%
  \ifNMBU@avpaperoptionrequested
    \ClassWarningNoLine{NMBU}{Option `a5paper' ignored because Master's theses 
    use A4 paper}%
  \fi
\fi

\ifNMBU@book
  \NMBU@articlefalse
  \def\NMBU@baseclass{book}%
\else
  \NMBU@articletrue
  \def\NMBU@baseclass{article}%
\fi

\ifx\NMBU@baseoptions\@empty\else
  \expandafter\PassOptionsToClass\expandafter{\NMBU@baseoptions}{\NMBU@baseclass}%
\fi
\LoadClass[\NMBU@fontsize,\NMBU@paperoption]{\NMBU@baseclass}

\let\ifBook\ifNMBU@book
\let\Booktrue\NMBU@booktrue
\let\Bookfalse\NMBU@bookfalse
\let\ifArticle\ifNMBU@article
\let\Articletrue\NMBU@articletrue
\let\Articlefalse\NMBU@articlefalse

\ifNMBU@book
  \renewcommand{\cleardoublepage}{%
    \clearpage
    \if@twoside
      \ifodd\c@page\else
        \hbox{}%
        \thispagestyle{empty}%
        \newpage
        \if@twocolumn
          \hbox{}%
          \newpage
        \fi
      \fi
    \fi
  }
\fi

\RequirePackage{iftex}
\RequirePackage{mathtools,amssymb,amsfonts}
\RequirePackage{graphicx}
\RequirePackage[table,dvipsnames]{xcolor}
\RequirePackage{geometry}
\ifNMBU@aivpaper
  \geometry{a4paper,left=3.5cm,right=3.5cm,top=3.5cm,bottom=3cm}
\else
  \geometry{a5paper,inner=24.67mm,outer=24.67mm,top=24.75mm,bottom=21.21mm}
\fi
\RequirePackage{tikz}
\usetikzlibrary{calc}

\frenchspacing
\linespread{1.15}

% The cover uses Arial when it is installed. A metrically similar open font
% is selected otherwise, so XeLaTeX and LuaLaTeX remain usable on Overleaf and
% on systems without Microsoft fonts.
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage{helvet}
  \newcommand*\NMBU@coverfont{\sffamily}
\else
  \RequirePackage{fontspec}
  \IfFontExistsTF{Arial}{%
    \newfontfamily\NMBU@coverfont{Arial}[Ligatures=TeX]%
  }{%
    \IfFontExistsTF{Liberation Sans}{%
      \newfontfamily\NMBU@coverfont{Liberation Sans}[Ligatures=TeX]%
      \ClassWarningNoLine{NMBU}{Arial not found; using Liberation Sans on the
      cover}%
    }{%
      \IfFontExistsTF{TeX Gyre Heros}{%
        \newfontfamily\NMBU@coverfont{TeX Gyre Heros}[Ligatures=TeX]%
        \ClassWarningNoLine{NMBU}{Arial not found; using TeX Gyre Heros on the
        cover}%
      }{%
        \newfontfamily\NMBU@coverfont{Latin Modern Sans}[Ligatures=TeX]%
        \ClassWarningNoLine{NMBU}{Arial not found; using Latin Modern Sans on
        the cover}%
      }%
    }%
  }%
\fi
\providecommand*\arial{\NMBU@coverfont}

\newif\ifEnglish
\def\NMBU@en{en}
\def\NMBU@bm{bm}
\def\NMBU@nn{nn}

\ifx\NMBU@language\NMBU@en
  \Englishtrue
  \RequirePackage[english]{babel}
  \def\NMBU@creditslabel{ECTS}%
  \def\NMBU@abstractname{Abstract}%
  \def\NMBU@norwegianabstractname{Sammendrag}%
  \def\NMBU@acknowledgementsname{Acknowledgements}%
  \def\NMBU@forewordname{Foreword}%
  \def\NMBU@acronymsname{List of Acronyms}%
  \def\NMBU@logotext{\enlogotext}%
  \ifx\NMBU@degree\NMBU@masters
    \def\NMBU@thesislabel{Master's Thesis}%
  \else
    \def\NMBU@thesislabel{PhD Thesis}%
  \fi
\else\ifx\NMBU@language\NMBU@bm
  \Englishfalse
  \RequirePackage[provide=*,norsk]{babel}
  \def\NMBU@creditslabel{stp}%
  \def\NMBU@abstractname{Abstract}%
  \def\NMBU@norwegianabstractname{Sammendrag}%
  \def\NMBU@acknowledgementsname{Takk}%
  \def\NMBU@forewordname{Forord}%
  \def\NMBU@acronymsname{Akronymliste}%
  \def\NMBU@logotext{\bmlogotext}%
  \ifx\NMBU@degree\NMBU@masters
    \def\NMBU@thesislabel{Masteroppgave}%
  \else
    \def\NMBU@thesislabel{Ph.d.-avhandling}%
  \fi
\else
  \Englishfalse
  \RequirePackage[provide=*,nynorsk]{babel}
  \def\NMBU@creditslabel{stp}%
  \def\NMBU@abstractname{Abstract}%
  \def\NMBU@norwegianabstractname{Samandrag}%
  \def\NMBU@acknowledgementsname{Takk}%
  \def\NMBU@forewordname{Føreord}%
  \def\NMBU@acronymsname{Akronymliste}%
  \def\NMBU@logotext{\nnlogotext}%
  \ifx\NMBU@degree\NMBU@masters
    \def\NMBU@thesislabel{Masteroppgåve}%
  \else
    \def\NMBU@thesislabel{Ph.d.-avhandling}%
  \fi
\fi\fi
\RequirePackage{csquotes}

\newcommand*\MT{\NMBU@thesislabel}
\newcommand*\ECTS{\NMBU@creditslabel}
\newcommand*\logotext{\NMBU@logotext}

\let\ifAPA\ifNMBU@apa
\let\ifListoffigures\ifNMBU@listoffigures
\let\ifListoftables\ifNMBU@listoftables
\let\ifAcronyms\ifNMBU@acronyms
\let\ifForewordfirst\ifNMBU@forewordfirst
\let\ifNorwegianDates\ifNMBU@norwegiandates

\ifNMBU@namedauthorsalias
  \ClassWarningNoLine{NMBU}{Option `namedauthors' is deprecated; use `APA'}%
\fi

\def\NMBU@green{green}
\ifx\NMBU@colourprofile\NMBU@green
  \definecolor{NMBUBackground}{RGB}{0,133,113}
  \definecolor{NMBUContrast}{RGB}{91,190,175}
\else\ifx\NMBU@colourprofile\NMBU@phd
  \definecolor{NMBUBackground}{RGB}{0,181,222}
  \definecolor{NMBUContrast}{RGB}{18,193,227}
\else
  \definecolor{NMBUBackground}{RGB}{0,112,93}
  \definecolor{NMBUContrast}{RGB}{48,134,121}
\fi\fi

\def\NMBU@coverx#1{\ifNMBU@aivpaper#1\else\the\dimexpr#1/105*74\relax\fi}
\def\NMBU@covery#1{\ifNMBU@aivpaper#1\else\the\dimexpr#1/99*70\relax\fi}
\ifNMBU@aivpaper
  \def\NMBU@coverxscale{1}%
  \def\NMBU@coveryscale{1}%
\else
  \def\NMBU@coverxscale{0.7047619048}% 148/210
  \def\NMBU@coveryscale{0.7070707071}% 210/297
\fi

\def\NMBU@coverlogoscale{0.835}

\newlength\NMBU@greekx
\newlength\NMBU@greeky
\newlength\NMBU@greekiex
\newlength\NMBU@greekiey
\newlength\NMBU@greekoffsetx
\newlength\NMBU@greekoffsety
\newlength\NMBU@xmargin
\newlength\NMBU@ymargin
\newlength\NMBU@patternlinewidth
\newlength\NMBU@patternradius
\newlength\NMBU@barpadding
\newlength\NMBU@titlewidth
\newlength\NMBU@frontlogowidth
\newlength\NMBU@backlogowidth
\newlength\NMBU@facultypositiony
\newlength\NMBU@backlineoney
\newlength\NMBU@backlogopositionx
\newlength\NMBU@backinstitutex
\newlength\NMBU@backinstitutelineii
\newlength\NMBU@backinstitutelineiii
\newlength\NMBU@backaddressx
\newlength\NMBU@backaddresslineii
\newlength\NMBU@backaddresslineiii
\setlength\NMBU@greekx{\NMBU@coverx{1.84cm}}
\setlength\NMBU@greeky{\NMBU@covery{1.84cm}}
\setlength\NMBU@greekiex{\dimexpr\NMBU@greekx*2/3\relax}
\setlength\NMBU@greekiey{\dimexpr\NMBU@greeky*2/3\relax}
\setlength\NMBU@greekoffsetx{\NMBU@coverx{1.3cm}}
\setlength\NMBU@greekoffsety{\NMBU@covery{0.15cm}}
\setlength\NMBU@xmargin{\NMBU@coverx{5.35cm}}
\setlength\NMBU@ymargin{\NMBU@covery{6.95cm}}
\setlength\NMBU@patternlinewidth{\NMBU@coverx{2.4pt}}
\setlength\NMBU@patternradius{\NMBU@coverx{0.075mm}}
\setlength\NMBU@barpadding{\NMBU@coverx{0.1pt}}
\setlength\NMBU@titlewidth{\NMBU@coverx{12cm}}
\setlength\NMBU@frontlogowidth{\NMBU@coverx{0.53cm}}

\setlength\NMBU@backlogowidth{0.51cm}
\setlength\NMBU@backlineoney{2.92cm}
\setlength\NMBU@backinstitutelineii{2.56cm}
\setlength\NMBU@backinstitutelineiii{2.2cm}
\setlength\NMBU@backlogopositionx{7.48cm}
\setlength\NMBU@backinstitutex{10.68cm}
\setlength\NMBU@backaddressx{17.5cm}
\setlength\NMBU@backaddresslineii{2.61cm}
\setlength\NMBU@backaddresslineiii{2.22cm}
\ifNMBU@aivpaper
  \setlength\NMBU@facultypositiony{17.46cm}
\else
  \setlength\NMBU@facultypositiony{\NMBU@covery{18cm}}
  \addtolength\NMBU@facultypositiony{-0.54cm}
\fi


\ifNMBU@apa
  \RequirePackage[
    style=apa,
    giveninits=true,
    doi=true,
    isbn=true,
    url=true,
    maxbibnames=19,
    backend=biber
  ]{biblatex}
\else
  \RequirePackage[
    style=numeric,
    giveninits=true,
    doi=true,
    isbn=true,
    url=true,
    maxbibnames=19,
    sorting=none,
    sortcites=true,
    backend=biber
  ]{biblatex}
\fi
\urlstyle{same}

\ifNMBU@norwegiandates
  \ClassWarningNoLine{NMBU}{%
    Legacy DD.MM.YYYY bibliography dates are supported; ISO YYYY-MM-DD is 
    preferred}%
  \DeclareSourcemap{
    \maps[datatype=bibtex]{
      \map{
        \step[
          fieldsource=urldate,
          match=\regexp{\A([0-9]{2})\.([0-9]{2})\.([0-9]{4})\Z},
          replace={$3-$2-$1}
        ]
      }
    }
  }
\fi

\DefineBibliographyStrings{norsk}{%
  nodate = {{}u\adddot\addnbthinspace å\adddot},
}
\DefineBibliographyStrings{nynorsk}{%
  nodate = {{}u\adddot\addnbthinspace å\adddot},
}

\RequirePackage[
  unicode=true,
  pdfencoding=auto,
  psdextra,
  colorlinks=true,
  linkcolor=blue,
  urlcolor=blue,
  citecolor=blue,
  breaklinks=true,
  bookmarksnumbered=true,
  pdfdisplaydoctitle=true
]{hyperref}

\newcommand{\references}{%
  \begingroup
    \sloppy
    \setlength\bibitemsep{0pt}%
    \printbibliography[heading=bibintoc]%
  \endgroup
}

\providecommand\@title{}
\providecommand\@author{}
\def\NMBU@studyprogramme{}
\def\NMBU@thesisyear{}
\def\NMBU@credits{}
\def\NMBU@faculty{}
\def\NMBU@engtitle{}
\def\NMBU@supervisor{}

\newcommand{\studyprogramme}[1]{\gdef\NMBU@studyprogramme{#1}}
\newcommand{\thesisyear}[1]{\gdef\NMBU@thesisyear{#1}}
\newcommand{\credits}[1]{\gdef\NMBU@credits{#1}}
\newcommand{\faculty}[1]{\gdef\NMBU@faculty{#1}}
\newcommand{\engtitle}[1]{\gdef\NMBU@engtitle{#1}}
\newcommand{\supervisor}[1]{\gdef\NMBU@supervisor{#1}}

\newcommand{\printtitle}{%
  \ifx\@title\@empty Insert Thesis Title\else\@title\fi
}
\newcommand{\printauthor}{%
  \ifx\@author\@empty Your name\else\@author\fi
}
\newcommand{\printstudyprogramme}{\NMBU@studyprogramme}
\newcommand{\printthesisyear}{%
  \MT~\ifx\NMBU@thesisyear\@empty 20XX\else\NMBU@thesisyear\fi
}
\newcommand{\printcredits}{%
  \ifx\NMBU@credits\@empty XX\else\NMBU@credits\fi~\ECTS
}
\newcommand{\printfaculty}{%
  \ifx\NMBU@faculty\@empty
    Insert Name of the Faculty where the Thesis has been completed%
  \else
    \NMBU@faculty
  \fi
}
\newcommand{\printengtitle}{\NMBU@engtitle}
\newcommand{\printsupervisor}{\NMBU@supervisor}

\newif\ifNMBU@metadatavalidated
\newcommand{\NMBU@validatemetadata}{%
  \ifNMBU@metadatavalidated\else
    \ifx\@title\@empty
      \ClassWarningNoLine{NMBU}{No \string\title\space given}%
    \fi
    \ifx\@author\@empty
      \ClassWarningNoLine{NMBU}{No \string\author\space given}%
    \fi
    \ifx\NMBU@studyprogramme\@empty
      \ClassWarningNoLine{NMBU}{No \string\studyprogramme\space given}%
    \fi
    \ifx\NMBU@thesisyear\@empty
      \ClassWarningNoLine{NMBU}{No \string\thesisyear\space given}%
    \fi
    \ifx\NMBU@credits\@empty
      \ClassWarningNoLine{NMBU}{No \string\credits\space given}%
    \fi
    \ifx\NMBU@faculty\@empty
      \ClassWarningNoLine{NMBU}{No \string\faculty\space given}%
    \fi
    \ifx\NMBU@supervisor\@empty
      \ClassWarningNoLine{NMBU}{No \string\supervisor\space given}%
    \fi
    \ifEnglish\else
      \ifx\NMBU@engtitle\@empty
        \ClassWarningNoLine{NMBU}{No English title given with \string\engtitle}%
      \fi
    \fi
    \global\NMBU@metadatavalidatedtrue
  \fi
}

\pdfstringdefDisableCommands{%
  \def\\{ }%
  \def\and{, }%
}
\newcommand{\NMBU@setmetadata}{%
  \hypersetup{%
    pdftitle={\@title},%
    pdfauthor={\@author},%
    pdfsubject={\NMBU@thesislabel\space\NMBU@thesisyear, \NMBU@credits\space\NMBU@creditslabel},%
    pdfkeywords={Norwegian University of Life Sciences, \NMBU@faculty, \NMBU@studyprogramme},%
    pdfcreator={LaTeX with the NMBU thesis class}%
  }%
}
\newcommand{\setmetadata}{\NMBU@setmetadata}

\def\NMBU@abstract{}
\def\NMBU@sammendrag{}
\def\NMBU@acknowledgements{}
\def\NMBU@foreword{}
\def\NMBU@acronymcontent{}

\@ifundefined{abstract}{%
  \newcommand{\abstract}[1]{\gdef\NMBU@abstract{#1}}%
}{%
  \renewcommand{\abstract}[1]{\gdef\NMBU@abstract{#1}}%
}
\newcommand{\sammendrag}[1]{\gdef\NMBU@sammendrag{#1}}
\newcommand{\acknowledgements}[1]{\gdef\NMBU@acknowledgements{#1}}
\newcommand{\foreword}[1]{\gdef\NMBU@foreword{#1}}
\newcommand{\acronyms}[1]{\gdef\NMBU@acronymcontent{#1}}

\newcommand{\NMBU@printfronttext}[2]{%
  \clearpage
  \thispagestyle{plain}%
  \begin{center}
    \normalfont\LARGE\textbf{#1}%
  \end{center}
  \begin{quotation}
    \sloppy
    #2%
  \end{quotation}
}

\newcommand{\printabstract}{%
  \ifx\NMBU@abstract\@empty\else
    \NMBU@printfronttext{\NMBU@abstractname}{\NMBU@abstract}%
  \fi
}
\newcommand{\printsammendrag}{%
  \ifx\NMBU@sammendrag\@empty\else
    \NMBU@printfronttext{\NMBU@norwegianabstractname}{\NMBU@sammendrag}%
  \fi
}
\newcommand{\printacknowledgements}{%
  \ifx\NMBU@acknowledgements\@empty\else
    \NMBU@printfronttext{\NMBU@acknowledgementsname}{\NMBU@acknowledgements}%
  \fi
}
\newcommand{\printforeword}{%
  \ifx\NMBU@foreword\@empty\else
    \NMBU@printfronttext{\NMBU@forewordname}{\NMBU@foreword}%
  \fi
}
\newcommand{\printacronyms}{%
  \ifx\NMBU@acronymcontent\@empty\else
    \NMBU@printfronttext{\NMBU@acronymsname}{\NMBU@acronymcontent}%
  \fi
}

\newcommand{\NMBU@validatefrontmatter}{%
  \ifx\NMBU@abstract\@empty
    \ClassWarningNoLine{NMBU}{No abstract given with \string\abstract}%
  \fi
  \ifx\NMBU@sammendrag\@empty
    \ClassWarningNoLine{NMBU}{No Norwegian summary given with \string\sammendrag}%
  \fi
  \ifNMBU@acronyms
    \ifx\NMBU@acronymcontent\@empty
      \ClassWarningNoLine{NMBU}{Option `acronyms' selected but no 
      \string\acronyms\space content given}%
    \fi
  \fi
}

\ifNMBU@article
  \renewcommand\section{\@startsection{section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus .2ex}%
    {\normalfont\LARGE\bfseries}}
  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {-3.25ex \@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\Large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-3.25ex \@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\large\bfseries}}
\fi

\newcommand{\appendices}{%
  \appendix
  \ifNMBU@article
    \counterwithin{table}{section}%
    \counterwithin{figure}{section}%
  \fi
}

\newif\ifNMBU@mainmatterstarted
\newcommand{\startthesis}{%
  \ifNMBU@mainmatterstarted
    \ClassWarningNoLine{NMBU}{\string\startthesis\space called more than once; 
    later call ignored}%
  \else
    \clearpage
    \null
    \thispagestyle{empty}%
    \clearpage
    \ifNMBU@book
      \mainmatter
    \else
      \pagenumbering{arabic}%
    \fi
    \global\NMBU@mainmatterstartedtrue
  \fi
}

\newcommand{\orderofabstract}{%
  \ifEnglish
    \printabstract
    \printsammendrag
  \else
    \printsammendrag
    \printabstract
  \fi
}
\let\orderofabstractforewordfirsttrue\orderofabstract

\newcommand{\NMBU@contentspage}[1]{%
  \clearpage
  \thispagestyle{plain}%
  \begingroup
    \hypersetup{linkcolor=black}%
    \linespread{1}\selectfont
    #1%
  \endgroup
}

\newcommand{\NMBU@makefrontmatter}{%
  \NMBU@validatemetadata
  \NMBU@validatefrontmatter
  \NMBU@setmetadata
  \hypersetup{pageanchor=false}%
  \thispagestyle{empty}%
  \frontpage
  \null
  \clearpage
  % Deliberately retain a blank cover verso for printed copies.
  \null
  \thispagestyle{empty}%
  \clearpage
  \ifNMBU@book
    \frontmatter
  \else
    \pagenumbering{roman}%
  \fi
  \hypersetup{pageanchor=true}%
  \ifNMBU@forewordfirst
    \printforeword
  \fi
  \orderofabstract
  \ifNMBU@forewordfirst\else
    \printforeword
  \fi
  \printacknowledgements
  \NMBU@contentspage{\tableofcontents}%
  \ifNMBU@listoffigures
    \NMBU@contentspage{\listoffigures}%
  \fi
  \ifNMBU@listoftables
    \NMBU@contentspage{\listoftables}%
  \fi
  \ifNMBU@acronyms
    \printacronyms
  \fi
  \clearpage
}

\AddToHook{begindocument/end}{\NMBU@makefrontmatter}

\AtEndDocument{%
  \ifNMBU@mainmatterstarted\else
    \ClassWarningNoLine{NMBU}{\string\startthesis\space was not called}%
  \fi
  \clearpage
  % Deliberately retain a blank page before the back cover.
  \null
  \thispagestyle{empty}%
  \clearpage
  \backpage
  \null
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\covertext}{%
\node[below right, align=left] at ($(current page.south west) + 
  (\NMBU@coverx{2.38cm},\NMBU@covery{14.9cm})$)
{{\fontsize{20pt}{20pt}\NMBU@coverfont\parbox[t]{\NMBU@titlewidth}{\raggedright\linespread{1.15}\selectfont\textbf{\printtitle}\\[0.66em]{\fontsize{14.4pt}{18pt}\NMBU@coverfont\linespread{0.5}\selectfont\printengtitle}}}};
\node[below right, align=left] at ($(current page.south west) + 
  (\NMBU@coverx{2.38cm},\NMBU@covery{18.0cm})$)
{\fontsize{12pt}{12pt}\NMBU@coverfont\textbf{\printthesisyear}};
\node[below right, align=left] at ($(current page.south west) + 
  (\NMBU@coverx{7.4cm},\NMBU@covery{18.0cm})$)
{\fontsize{12pt}{12pt}\NMBU@coverfont\textbf{\printcredits}};
\node[below right, align=left] at ($(current page.south west) + 
  (\NMBU@coverx{2.38cm},\NMBU@facultypositiony)$)
{\fontsize{12pt}{12pt}\NMBU@coverfont\printfaculty};
%{\fontsize{11pt}{11pt}\arial\textbf{\printcredits}};
\node[below right, align=left] at ($(current page.south west) + 
  (\NMBU@coverx{2.38cm},\NMBU@covery{2.5cm})$)
{\fontsize{15pt}{15pt}\NMBU@coverfont\printauthor};
\node[below right, align=left] at ($(current page.south west) + 
  (\NMBU@coverx{2.38cm},\NMBU@covery{1.85cm})$)
{\fontsize{10pt}{18pt}\NMBU@coverfont\printstudyprogramme};
}

\newcommand{\frontpage}{%
\begingroup
\fontsize{10.95pt}{13.6pt}\NMBU@coverfont\selectfont
\noindent
\begin{tikzpicture}[
    remember picture,
    overlay,
    font={\fontsize{10pt}{12pt}\NMBU@coverfont\selectfont},
    every node/.append style={inner sep=3.65pt}
  ]%
\begin{scope}
    \path ($(current page.north east)$) node[below left,fill=NMBUBackground, minimum width=1.05*\paperwidth, minimum height=\NMBU@ymargin, outer sep=0] (box){};
    \clip (current page.north west) rectangle  ++(\paperwidth, -\NMBU@ymargin);
    \foreach \x in {2,...,9}
        \foreach \y in {11,...,15}
          \draw[color=NMBUContrast, line width=\NMBU@patternlinewidth, rounded corners=\NMBU@patternradius] (current page.south east) +(-\x*\NMBU@greekx - \NMBU@greekoffsetx, \NMBU@greekiey + \y*\NMBU@greeky - \NMBU@greekoffsety) rectangle ++(-\NMBU@greekx - \x*\NMBU@greekx - \NMBU@greekoffsetx +\NMBU@greekiex/2 ,\y*\NMBU@greeky - \NMBU@greekoffsety);
    \foreach \x in {1,...,8}
        \foreach \y in {11,...,15}
          \draw[color=NMBUContrast, line width=\NMBU@patternlinewidth, rounded corners=\NMBU@patternradius] (current page.south east) +(-2*\NMBU@greekiex  - \x*\NMBU@greekx - \NMBU@greekoffsetx, \NMBU@greekiey/2 + \y*\NMBU@greeky - \NMBU@greekoffsety) rectangle ++(-2*\NMBU@greekx - \x*\NMBU@greekx - \NMBU@greekoffsetx, \y*\NMBU@greeky - \NMBU@greekiey/2 - \NMBU@greekoffsety);
\end{scope}
\path ($(current page.north east) + (-\NMBU@coverx{0.2cm},0)$) node[below right, fill=NMBUBackground, minimum width=1.02*\NMBU@xmargin+\NMBU@barpadding,minimum height=1.1*\paperheight] (box){};
\begin{scope}
    \clip ($(current page.north east) + (\NMBU@coverx{0.01cm},0)$) rectangle ++(-\NMBU@xmargin, -1.1*\paperheight);
    \path (current page.north east) node[below left, fill=NMBUBackground, minimum width=\NMBU@xmargin,minimum height=1.1*\paperheight] (box){};
    %\path ($(current page.north east) + (-0.1,-0.1)$) node[below left, fill=yellow, minimum width=1.02*\xmargin+0.1,minimum height=1.1*\paperheight] (box){};
    \foreach \x in {0,...,2}
        \foreach \y in {1,...,15}
          \draw[color=NMBUContrast, line width=\NMBU@patternlinewidth, rounded corners=\NMBU@patternradius] (current page.south east) +(-\x*\NMBU@greekx - \NMBU@greekoffsetx, \NMBU@greekiey + \y*\NMBU@greeky - \NMBU@greekoffsety) rectangle ++(-\NMBU@greekx - \x*\NMBU@greekx - \NMBU@greekoffsetx +\NMBU@greekiex/2 ,\y*\NMBU@greeky - \NMBU@greekoffsety);
    \foreach \x in {-1,...,1}
        \foreach \y in {1,...,15}
          \draw[color=NMBUContrast, line width=\NMBU@patternlinewidth, rounded corners=\NMBU@patternradius] (current page.south east) +(-2*\NMBU@greekiex  - \x*\NMBU@greekx - \NMBU@greekoffsetx, \NMBU@greekiey/2 + \y*\NMBU@greeky - \NMBU@greekoffsety) rectangle ++(-2*\NMBU@greekx - \x*\NMBU@greekx - \NMBU@greekoffsetx, \y*\NMBU@greeky - \NMBU@greekiey/2 - \NMBU@greekoffsety);
\end{scope}
\covertext
% Scale the complete two-part mark around its original upper-left reference
% point, so the symbol, wordmark, and their relative spacing change together.
\begin{scope}[
    shift={($(current page.south west)+(\NMBU@coverx{1.99cm},\NMBU@covery{21.33cm})$)},
    scale=\NMBU@coverlogoscale,
    transform shape
  ]
  \node[below right, align=left] at (0,0) {
    \resizebox{\NMBU@frontlogowidth}{!}{\enlogo}};
  \node[below right, align=left] at (\NMBU@coverx{3.42cm},-\NMBU@covery{2.34cm}) {
    \resizebox{\NMBU@frontlogowidth}{!}{\logotext}};
\end{scope}
\end{tikzpicture}
\endgroup
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\backpage}{%
\thispagestyle{empty}
\begingroup
\fontsize{10.95pt}{13.6pt}\NMBU@coverfont\selectfont
\noindent
\begin{tikzpicture}[
    remember picture,
    overlay,
    font={\fontsize{10pt}{12pt}\NMBU@coverfont\selectfont},
    every node/.append style={inner sep=3.65pt}
  ]%
% The complete back cover is drawn in an A4 reference coordinate system and
% transformed as one object for A5. This includes the solid colour fields,
% logo, type, line spacing, kerning, and node padding. The geometric mosaic is
% deliberately exclusive to the front cover.
\begin{scope}[
    shift={(current page.south west)},
    xscale=\NMBU@coverxscale,
    yscale=\NMBU@coveryscale,
    transform shape
  ]
  \path[fill=NMBUBackground] (0,22.75cm) rectangle (21cm,29.7cm);
  \path[fill=NMBUBackground] (0,0) rectangle (5.35cm,29.7cm);

  \node[
      below right,
      align=left,
      scale=\NMBU@coverlogoscale,
      transform shape
    ] at (\NMBU@backlogopositionx,3.85cm) {%
    \resizebox{\NMBU@backlogowidth}{!}{\enlogo}
  };
  \node[below right, align=left] at (\NMBU@backinstitutex,\NMBU@backlineoney) {\fontsize{7.5pt}{7.5pt}\NMBU@coverfont\selectfont\textbf{Norges miljø- og biovitenskapelige universitet}};
  \node[below right, align=left] at (\NMBU@backinstitutex,\NMBU@backinstitutelineii) {\fontsize{7.5pt}{7.5pt}\NMBU@coverfont\selectfont N{\kern 0.04em}o{\kern 0.04em}r{\kern 0.04em}e{\kern 0.04em}g{\kern 0.04em}s miljø- og b{\kern 0.04em}i{\kern 0.04em}o{\kern 0.04em}vi{\kern 0.04em}t{\kern 0.04em}skaplege u{\kern 0.04em}n{\kern 0.04em}i{\kern 0.04em}v{\kern 0.04em}e{\kern 0.04em}r{\kern 0.04em}s{\kern 0.04em}i{\kern 0.04em}t{\kern 0.04em}e{\kern 0.04em}t};
  \node[below right, align=left] at (\NMBU@backinstitutex,\NMBU@backinstitutelineiii) {\fontsize{7.5pt}{7.5pt}\NMBU@coverfont\selectfont N{\kern 0.04em}o{\kern 0.04em}r{\kern 0.04em}w{\kern 0.04em}e{\kern 0.04em}g{\kern 0.04em}i{\kern 0.04em}a{\kern 0.04em}n Universit{\kern 0.04em}y o{\kern 0.04em}f{\kern 0.04em} Lif{\kern 0.04em}e Scie{\kern 0.04em}n{\kern 0.04em}ces};

  \node[below right, align=left] at (\NMBU@backaddressx,\NMBU@backlineoney) {\fontsize{7.5pt}{7.5pt}\NMBU@coverfont\selectfont Po{\kern 0.04em}s{\kern 0.04em}t{\kern 0.04em}b{\kern 0.04em}o{\kern 0.08em}k{\kern 0.06em}s 5{\kern 0.06em}0{\kern 0.06em}0{\kern 0.06em}3};
  \node[below right, align=left] at (\NMBU@backaddressx,\NMBU@backaddresslineii) {\fontsize{7.5pt}{7.5pt}\NMBU@coverfont\selectfont N{\kern 0.08em}O-{\kern 0.04em}1432 Å{\kern 0.04em}s};
  \node[below right, align=left] at (\NMBU@backaddressx,\NMBU@backaddresslineiii) {\fontsize{7.5pt}{7.5pt}\NMBU@coverfont\selectfont N{\kern 0.06em}o{\kern 0.06em}r{\kern 0.06em}w{\kern 0.06em}a{\kern 0.06em}y};
\end{scope}
\end{tikzpicture}
\endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{NMBUgreen}{RGB}{0,133,113}
\newcommand{\enlogo}{%
\begin{tikzpicture}[remember picture,overlay]% 
    %\node[below right, align=left] at ($(current page.south west)+(2.38cm,5cm)$) 
    %{\fontsize{8pt}{8pt}\arial Norwegian University of Life Sciences};
  \path[fill=NMBUgreen] (0.1418, -0.4077) -- (0.1588, -0.4077) -- (0.1588, -0.4847) -- (0.1421, -0.4847) -- (0.1135, -0.4392) -- (0.1135, -0.4847) -- (0.0963, -0.4847) -- (0.0963, -0.4077) -- (0.1135, -0.4077) -- (0.1418, -0.4524) -- (0.1418, -0.4077) -- cycle(0.2979, -0.4059) -- (0.2979, -0.3289) -- (0.2775, -0.3289) -- (0.2596, -0.3773) -- (0.2418, -0.3289) -- (0.2207, -0.3289) -- (0.2207, -0.4059) -- (0.2376, -0.4059) -- (0.2376, -0.3622) -- (0.2532, -0.4048) -- (0.2656, -0.4048) -- (0.2813, -0.3627) -- (0.2813, -0.4059) -- (0.2979, -0.4059) -- cycle(0.508, -0.1408) -- (0.508, -0.1876).. controls (0.508, -0.1947) and (0.5056, -0.2032) .. (0.4945, -0.2032).. controls (0.4834, -0.2032) and (0.481, -0.1947) .. (0.481, -0.1876) -- (0.481, -0.1408) -- (0.4638, -0.1408) -- (0.4638, -0.1879).. controls (0.4638, -0.2072) and (0.4755, -0.2193) .. (0.4945, -0.2193).. controls (0.5138, -0.2193) and (0.5252, -0.2077) .. (0.5252, -0.1879) -- (0.5252, -0.1408) -- (0.508, -0.1408) -- cycle(0.3937, -0.2574).. controls (0.399, -0.2611) and (0.4022, -0.2672) .. (0.4022, -0.2741).. controls (0.4022, -0.2818) and (0.3993, -0.2879) .. (0.394, -0.2921).. controls (0.3879, -0.2969) and (0.3805, -0.2974) .. (0.3733, -0.2974) -- (0.3424, -0.2974) -- (0.3424, -0.2201) -- (0.3733, -0.2201).. controls (0.381, -0.2201) and (0.3868, -0.2215) .. (0.3913, -0.2244).. controls (0.3971, -0.2281) and (0.4006, -0.235) .. (0.4006, -0.2418).. controls (0.4008, -0.2471) and (0.3987, -0.2537) .. (0.3937, -0.2574) -- cycle(0.3596, -0.25) -- (0.3744, -0.25).. controls (0.3826, -0.25) and (0.3834, -0.2461) .. (0.3834, -0.2429).. controls (0.3834, -0.2381) and (0.3802, -0.2355) .. (0.3741, -0.2355) -- (0.3596, -0.2355) -- (0.3596, -0.25) -- cycle(0.3847, -0.2738).. controls (0.3847, -0.2717) and (0.3847, -0.2651) .. (0.3741, -0.2651) -- (0.3593, -0.2651) -- (0.3593, -0.2815) -- (0.3739, -0.2815).. controls (0.3781, -0.2815) and (0.3847, -0.2805) .. (0.3847, -0.2738) -- cycle(0.4683, -0.3596) -- (0.3765, -0.3596) -- (0.3765, -0.3289) -- (0.3598, -0.3289) -- (0.3598, -0.3596) -- (0.3291, -0.3596) -- (0.3291, -0.3762) -- (0.3598, -0.3762) -- (0.3598, -0.468) -- (0.1961, -0.468) -- (0.1961, -0.4847) -- (0.3702, -0.4847).. controls (0.3736, -0.4847) and (0.3765, -0.4818) .. (0.3765, -0.4784) -- (0.3765, -0.3762) -- (0.4786, -0.3762).. controls (0.4821, -0.3762) and (0.485, -0.3733) .. (0.485, -0.3699) -- (0.485, -0.2471) -- (0.4683, -0.2471) -- (0.4683, -0.3596) -- cycle(0.2503, -0.2974) -- (0.267, -0.2974) -- (0.267, -0.2664) -- (0.2979, -0.2664) -- (0.2979, -0.2498) -- (0.267, -0.2498) -- (0.267, -0.158) -- (0.4265, -0.158) -- (0.4265, -0.1413) -- (0.2566, -0.1413).. controls (0.2532, -0.1413) and (0.2503, -0.1442) .. (0.2503, -0.1476) -- (0.2503, -0.2498) -- (0.1482, -0.2498).. controls (0.1447, -0.2498) and (0.1418, -0.2527) .. (0.1418, -0.2561) -- (0.1418, -0.3762) -- (0.1585, -0.3762) -- (0.1585, -0.2664) -- (0.2503, -0.2664) -- (0.2503, -0.2974) -- cycle;
\end{tikzpicture}
}

\newcommand{\enlogotext}{%
\begin{tikzpicture}[remember picture,overlay]% 
  \begin{scope}[shift={(-0.8366, 0.285)}]
    \path[fill] (0.8702, -0.095) -- (0.8456, -0.0572) -- (0.8456, -0.095) -- (0.8371, -0.095) -- (0.8371, -0.0452) -- (0.848, -0.0452) -- (0.8707, -0.0807) -- (0.8707, -0.0452) -- (0.8792, -0.0452) -- (0.8792, -0.095) -- cycle;
    \path[fill] (0.9237, -0.0778).. controls (0.9237, -0.0884) and (0.9163, -0.096) .. (0.9059, -0.096).. controls (0.8959, -0.096) and (0.8882, -0.0884) .. (0.8882, -0.0778).. controls (0.8882, -0.0672) and (0.8956, -0.0595) .. (0.9059, -0.0595).. controls (0.9163, -0.0598) and (0.9237, -0.0675) .. (0.9237, -0.0778) -- cycle(0.9155, -0.0778).. controls (0.9155, -0.0706) and (0.911, -0.0669) .. (0.9059, -0.0669).. controls (0.9009, -0.0669) and (0.8964, -0.0706) .. (0.8964, -0.0778).. controls (0.8964, -0.0849) and (0.9009, -0.0886) .. (0.9059, -0.0886).. controls (0.911, -0.0886) and (0.9155, -0.0849) .. (0.9155, -0.0778) -- cycle;
    \path[fill] (0.9525, -0.0688).. controls (0.9514, -0.0685) and (0.9506, -0.0685) .. (0.9499, -0.0685).. controls (0.9435, -0.0685) and (0.9406, -0.0722) .. (0.9406, -0.0786) -- (0.9406, -0.095) -- (0.9324, -0.095) -- (0.9324, -0.0609) -- (0.9403, -0.0609) -- (0.9403, -0.0664).. controls (0.9419, -0.0627) and (0.9456, -0.0606) .. (0.9501, -0.0606).. controls (0.9512, -0.0606) and (0.952, -0.0609) .. (0.9522, -0.0609) -- (0.9522, -0.0688) -- cycle;
    \path[fill] (0.9887, -0.0609) -- (0.9967, -0.0844) -- (1.0036, -0.0609) -- (1.0118, -0.0609) -- (1.0009, -0.095) -- (0.9927, -0.095) -- (0.9843, -0.0704) -- (0.976, -0.095) -- (0.9676, -0.095) -- (0.9565, -0.0609) -- (0.9652, -0.0609) -- (0.9721, -0.0844) -- (0.98, -0.0609) -- cycle;
    \path[fill] (1.0485, -0.0852).. controls (1.0467, -0.0913) and (1.0414, -0.096) .. (1.0332, -0.096).. controls (1.0239, -0.096) and (1.0157, -0.0894) .. (1.0157, -0.0778).. controls (1.0157, -0.0669) and (1.0237, -0.0598) .. (1.0324, -0.0598).. controls (1.043, -0.0598) and (1.0491, -0.0667) .. (1.0491, -0.0775).. controls (1.0491, -0.0788) and (1.0491, -0.0799) .. (1.0488, -0.0802) -- (1.0237, -0.0802).. controls (1.0239, -0.0855) and (1.0279, -0.0892) .. (1.0329, -0.0892).. controls (1.038, -0.0892) and (1.0403, -0.0865) .. (1.0414, -0.0831) -- cycle(1.0406, -0.0741).. controls (1.0403, -0.0701) and (1.0377, -0.0664) .. (1.0321, -0.0664).. controls (1.0271, -0.0664) and (1.0239, -0.0704) .. (1.0237, -0.0741) -- cycle;
    \path[fill] (1.0626, -0.095).. controls (1.0631, -0.0992) and (1.0665, -0.1024) .. (1.071, -0.1024).. controls (1.0774, -0.1024) and (1.0808, -0.0992) .. (1.0808, -0.0921) -- (1.0808, -0.0884).. controls (1.0792, -0.091) and (1.0758, -0.0934) .. (1.0708, -0.0934).. controls (1.0618, -0.0934) and (1.0549, -0.0863) .. (1.0549, -0.0767).. controls (1.0549, -0.0675) and (1.0612, -0.0601) .. (1.0708, -0.0601).. controls (1.0761, -0.0601) and (1.0795, -0.0622) .. (1.0808, -0.0651) -- (1.0808, -0.0609) -- (1.0888, -0.0609) -- (1.0888, -0.0918).. controls (1.0888, -0.1011) and (1.084, -0.1095) .. (1.0713, -0.1095).. controls (1.0623, -0.1095) and (1.056, -0.104) .. (1.0549, -0.0971) -- cycle(1.0811, -0.0767).. controls (1.0811, -0.0709) and (1.0774, -0.0672) .. (1.0724, -0.0672).. controls (1.0671, -0.0672) and (1.0634, -0.0709) .. (1.0634, -0.0767).. controls (1.0634, -0.0828) and (1.0668, -0.0865) .. (1.0724, -0.0865).. controls (1.0776, -0.0865) and (1.0811, -0.0826) .. (1.0811, -0.0767) -- cycle;
    \path[fill] (1.1038, -0.0434).. controls (1.1068, -0.0434) and (1.1091, -0.0458) .. (1.1091, -0.0487).. controls (1.1091, -0.0516) and (1.1068, -0.054) .. (1.1038, -0.054).. controls (1.1009, -0.054) and (1.0986, -0.0516) .. (1.0986, -0.0487).. controls (1.0986, -0.0458) and (1.1009, -0.0434) .. (1.1038, -0.0434) -- cycle(1.0999, -0.095) -- (1.0999, -0.0609) -- (1.1081, -0.0609) -- (1.1081, -0.095) -- cycle;
    \path[fill] (1.1277, -0.0754) -- (1.1364, -0.0741).. controls (1.1382, -0.0738) and (1.139, -0.0728) .. (1.139, -0.0717).. controls (1.139, -0.0688) and (1.1372, -0.0664) .. (1.1327, -0.0664).. controls (1.1284, -0.0664) and (1.1261, -0.0691) .. (1.1255, -0.0725) -- (1.1181, -0.0709).. controls (1.1187, -0.0651) and (1.1242, -0.0598) .. (1.1324, -0.0598).. controls (1.143, -0.0598) and (1.147, -0.0659) .. (1.147, -0.0725) -- (1.147, -0.0894).. controls (1.147, -0.0926) and (1.1472, -0.0945) .. (1.1475, -0.095) -- (1.1398, -0.095).. controls (1.1398, -0.0947) and (1.1396, -0.0934) .. (1.1396, -0.0908).. controls (1.138, -0.0934) and (1.1345, -0.096) .. (1.129, -0.096).. controls (1.1218, -0.096) and (1.1173, -0.091) .. (1.1173, -0.0857).. controls (1.1171, -0.0796) and (1.1216, -0.0762) .. (1.1277, -0.0754) -- cycle(1.1388, -0.0807) -- (1.1388, -0.0791) -- (1.1298, -0.0804).. controls (1.1274, -0.081) and (1.1253, -0.0823) .. (1.1253, -0.0852).. controls (1.1253, -0.0876) and (1.1271, -0.0897) .. (1.1303, -0.0897).. controls (1.1348, -0.0897) and (1.1388, -0.0873) .. (1.1388, -0.0807) -- cycle;
    \path[fill] (1.1658, -0.095) -- (1.1576, -0.095) -- (1.1576, -0.0609) -- (1.1655, -0.0609) -- (1.1655, -0.0654).. controls (1.1676, -0.0614) and (1.1718, -0.0598) .. (1.1755, -0.0598).. controls (1.184, -0.0598) and (1.188, -0.0659) .. (1.188, -0.0733) -- (1.188, -0.095) -- (1.1798, -0.095) -- (1.1798, -0.0749).. controls (1.1798, -0.0706) and (1.1779, -0.0672) .. (1.1726, -0.0672).. controls (1.1679, -0.0672) and (1.1655, -0.0709) .. (1.1655, -0.0754) -- (1.1655, -0.095) -- cycle;
    \path[fill] (0.8366, -0.172) -- (0.8366, -0.1394) -- (0.8451, -0.1394) -- (0.8451, -0.1715).. controls (0.8451, -0.1786) and (0.849, -0.1823) .. (0.8551, -0.1823).. controls (0.8615, -0.1823) and (0.8655, -0.1783) .. (0.8655, -0.1715) -- (0.8655, -0.1394) -- (0.8739, -0.1394) -- (0.8739, -0.172).. controls (0.8739, -0.1839) and (0.8657, -0.1905) .. (0.8554, -0.1905).. controls (0.8448, -0.1905) and (0.8366, -0.1842) .. (0.8366, -0.172) -- cycle;
    \path[fill] (0.893, -0.1894) -- (0.8848, -0.1894) -- (0.8848, -0.1553) -- (0.8927, -0.1553) -- (0.8927, -0.1598).. controls (0.8948, -0.1558) and (0.8991, -0.1543) .. (0.9028, -0.1543).. controls (0.9112, -0.1543) and (0.9152, -0.1603) .. (0.9152, -0.1677) -- (0.9152, -0.1894) -- (0.907, -0.1894) -- (0.907, -0.1693).. controls (0.907, -0.1651) and (0.9051, -0.1617) .. (0.9001, -0.1617).. controls (0.8954, -0.1617) and (0.893, -0.1654) .. (0.893, -0.1699) -- cycle;
    \path[fill] (0.9303, -0.1378).. controls (0.9332, -0.1378) and (0.9356, -0.1402) .. (0.9356, -0.1431).. controls (0.9356, -0.1461) and (0.9332, -0.1484) .. (0.9303, -0.1484).. controls (0.9274, -0.1484) and (0.925, -0.1461) .. (0.925, -0.1431).. controls (0.925, -0.1402) and (0.9274, -0.1378) .. (0.9303, -0.1378) -- cycle(0.926, -0.1894) -- (0.926, -0.1553) -- (0.9342, -0.1553) -- (0.9342, -0.1894) -- cycle;
    \path[fill] (0.9631, -0.1894) -- (0.9549, -0.1894) -- (0.9409, -0.1553) -- (0.9499, -0.1553) -- (0.9589, -0.1797) -- (0.9676, -0.1553) -- (0.976, -0.1553) -- cycle;
    \path[fill] (1.0126, -0.1797).. controls (1.0107, -0.1857) and (1.0054, -0.1905) .. (0.9972, -0.1905).. controls (0.988, -0.1905) and (0.9798, -0.1839) .. (0.9798, -0.1722).. controls (0.9798, -0.1614) and (0.9877, -0.1543) .. (0.9964, -0.1543).. controls (1.007, -0.1543) and (1.0131, -0.1611) .. (1.0131, -0.172).. controls (1.0131, -0.1733) and (1.0131, -0.1744) .. (1.0128, -0.1746) -- (0.9877, -0.1746).. controls (0.988, -0.1799) and (0.9919, -0.1836) .. (0.997, -0.1836).. controls (1.002, -0.1836) and (1.0044, -0.181) .. (1.0054, -0.1775) -- cycle(1.0049, -0.1685).. controls (1.0046, -0.1646) and (1.002, -0.1609) .. (0.9964, -0.1609).. controls (0.9914, -0.1609) and (0.9882, -0.1648) .. (0.988, -0.1685) -- cycle;
    \path[fill] (1.0417, -0.1632).. controls (1.0406, -0.163) and (1.0398, -0.163) .. (1.039, -0.163).. controls (1.0327, -0.163) and (1.0298, -0.1667) .. (1.0298, -0.173) -- (1.0298, -0.1894) -- (1.0216, -0.1894) -- (1.0216, -0.1553) -- (1.0295, -0.1553) -- (1.0295, -0.1609).. controls (1.0311, -0.1572) and (1.0348, -0.155) .. (1.0393, -0.155).. controls (1.0403, -0.155) and (1.0411, -0.1553) .. (1.0414, -0.1553) -- (1.0414, -0.1632) -- cycle;
    \path[fill] (1.0536, -0.1781).. controls (1.0538, -0.1812) and (1.0562, -0.1839) .. (1.0605, -0.1839).. controls (1.0639, -0.1839) and (1.0655, -0.182) .. (1.0655, -0.1799).. controls (1.0655, -0.1781) and (1.0642, -0.1767) .. (1.0615, -0.1762) -- (1.0565, -0.1752).. controls (1.0504, -0.1738) and (1.0472, -0.1699) .. (1.0472, -0.1651).. controls (1.0472, -0.159) and (1.0528, -0.154) .. (1.0599, -0.154).. controls (1.0694, -0.154) and (1.0726, -0.1601) .. (1.0732, -0.1635) -- (1.0663, -0.1654).. controls (1.066, -0.1635) and (1.0644, -0.1603) .. (1.0599, -0.1603).. controls (1.057, -0.1603) and (1.0549, -0.1622) .. (1.0549, -0.1643).. controls (1.0549, -0.1662) and (1.0562, -0.1675) .. (1.0583, -0.168) -- (1.0636, -0.1691).. controls (1.07, -0.1704) and (1.0734, -0.1744) .. (1.0734, -0.1794).. controls (1.0734, -0.1847) and (1.0692, -0.1902) .. (1.0605, -0.1902).. controls (1.0507, -0.1902) and (1.0467, -0.1839) .. (1.0464, -0.1799) -- cycle;
    \path[fill] (1.0864, -0.1378).. controls (1.0893, -0.1378) and (1.0917, -0.1402) .. (1.0917, -0.1431).. controls (1.0917, -0.1461) and (1.0893, -0.1484) .. (1.0864, -0.1484).. controls (1.0835, -0.1484) and (1.0811, -0.1461) .. (1.0811, -0.1431).. controls (1.0811, -0.1402) and (1.0835, -0.1378) .. (1.0864, -0.1378) -- cycle(1.0824, -0.1894) -- (1.0824, -0.1553) -- (1.0906, -0.1553) -- (1.0906, -0.1894) -- cycle;
    \path[fill] (1.1123, -0.155) -- (1.1195, -0.155) -- (1.1195, -0.1622) -- (1.1123, -0.1622) -- (1.1123, -0.1781).. controls (1.1123, -0.181) and (1.1136, -0.1823) .. (1.1165, -0.1823).. controls (1.1176, -0.1823) and (1.1189, -0.182) .. (1.1195, -0.182) -- (1.1195, -0.1886).. controls (1.1189, -0.1889) and (1.1173, -0.1894) .. (1.1144, -0.1894).. controls (1.1081, -0.1894) and (1.1041, -0.1857) .. (1.1041, -0.1794) -- (1.1041, -0.1622) -- (1.0978, -0.1622) -- (1.0978, -0.155) -- (1.0996, -0.155).. controls (1.1033, -0.155) and (1.1049, -0.1527) .. (1.1049, -0.1498) -- (1.1049, -0.1447) -- (1.1123, -0.1447) -- cycle;
    \path[fill] (1.1308, -0.2032) -- (1.139, -0.1852) -- (1.1245, -0.155) -- (1.1337, -0.155) -- (1.1435, -0.1767) -- (1.1528, -0.155) -- (1.1615, -0.155) -- (1.1398, -0.2032) -- cycle;
    \path[fill] (1.2192, -0.1722).. controls (1.2192, -0.1828) and (1.2118, -0.1905) .. (1.2015, -0.1905).. controls (1.1914, -0.1905) and (1.1837, -0.1828) .. (1.1837, -0.1722).. controls (1.1837, -0.1617) and (1.1912, -0.154) .. (1.2015, -0.154).. controls (1.2115, -0.154) and (1.2192, -0.1617) .. (1.2192, -0.1722) -- cycle(1.211, -0.1722).. controls (1.211, -0.1651) and (1.2065, -0.1614) .. (1.2015, -0.1614).. controls (1.1964, -0.1614) and (1.1919, -0.1651) .. (1.1919, -0.1722).. controls (1.1919, -0.1794) and (1.1964, -0.1831) .. (1.2015, -0.1831).. controls (1.2065, -0.1831) and (1.211, -0.1794) .. (1.211, -0.1722) -- cycle;
    \path[fill] (1.238, -0.1505) -- (1.238, -0.155) -- (1.2459, -0.155) -- (1.2459, -0.1622) -- (1.238, -0.1622) -- (1.238, -0.1892) -- (1.2298, -0.1892) -- (1.2298, -0.1622) -- (1.2237, -0.1622) -- (1.2237, -0.155) -- (1.2298, -0.155) -- (1.2298, -0.1503).. controls (1.2298, -0.1426) and (1.2348, -0.1381) .. (1.2417, -0.1381).. controls (1.2438, -0.1381) and (1.2454, -0.1386) .. (1.2459, -0.1389) -- (1.2459, -0.1458).. controls (1.2454, -0.1455) and (1.2446, -0.1455) .. (1.243, -0.1455).. controls (1.2409, -0.1455) and (1.238, -0.1463) .. (1.238, -0.1505) -- cycle;
    \path[fill] (0.8371, -0.2836) -- (0.8371, -0.2339) -- (0.8456, -0.2339) -- (0.8456, -0.2757) -- (0.8684, -0.2757) -- (0.8684, -0.2836) -- cycle;
    \path[fill] (0.8803, -0.232).. controls (0.8832, -0.232) and (0.8856, -0.2344) .. (0.8856, -0.2373).. controls (0.8856, -0.2402) and (0.8832, -0.2426) .. (0.8803, -0.2426).. controls (0.8774, -0.2426) and (0.875, -0.2402) .. (0.875, -0.2373).. controls (0.875, -0.2344) and (0.8774, -0.232) .. (0.8803, -0.232) -- cycle(0.8763, -0.2836) -- (0.8763, -0.2495) -- (0.8845, -0.2495) -- (0.8845, -0.2836) -- cycle;
    \path[fill] (0.9059, -0.245) -- (0.9059, -0.2495) -- (0.9139, -0.2495) -- (0.9139, -0.2566) -- (0.9059, -0.2566) -- (0.9059, -0.2836) -- (0.8977, -0.2836) -- (0.8977, -0.2566) -- (0.8916, -0.2566) -- (0.8916, -0.2495) -- (0.8977, -0.2495) -- (0.8977, -0.2447).. controls (0.8977, -0.2371) and (0.9028, -0.2326) .. (0.9096, -0.2326).. controls (0.9118, -0.2326) and (0.9133, -0.2331) .. (0.9139, -0.2334) -- (0.9139, -0.2402).. controls (0.9133, -0.2402) and (0.9125, -0.24) .. (0.911, -0.24).. controls (0.9086, -0.2397) and (0.9059, -0.2408) .. (0.9059, -0.245) -- cycle;
    \path[fill] (0.9504, -0.2738).. controls (0.9485, -0.2799) and (0.9432, -0.2847) .. (0.935, -0.2847).. controls (0.9258, -0.2847) and (0.9176, -0.2781) .. (0.9176, -0.2664).. controls (0.9176, -0.2556) and (0.9255, -0.2484) .. (0.9342, -0.2484).. controls (0.9448, -0.2484) and (0.9509, -0.2553) .. (0.9509, -0.2662).. controls (0.9509, -0.2675) and (0.9509, -0.2686) .. (0.9506, -0.2688) -- (0.9255, -0.2688).. controls (0.9258, -0.2741) and (0.9297, -0.2778) .. (0.9348, -0.2778).. controls (0.9398, -0.2778) and (0.9422, -0.2752) .. (0.9432, -0.2717) -- cycle(0.9424, -0.263).. controls (0.9422, -0.259) and (0.9395, -0.2553) .. (0.934, -0.2553).. controls (0.929, -0.2553) and (0.9258, -0.2593) .. (0.9255, -0.263) -- cycle;
    \path[fill] (1.0036, -0.2479).. controls (1.003, -0.2447) and (1.0004, -0.2402) .. (0.9938, -0.2402).. controls (0.9887, -0.2402) and (0.9853, -0.2437) .. (0.9853, -0.2474).. controls (0.9853, -0.2506) and (0.9872, -0.2529) .. (0.9911, -0.2537) -- (0.9983, -0.2553).. controls (1.007, -0.2572) and (1.0118, -0.2627) .. (1.0118, -0.2696).. controls (1.0118, -0.2773) and (1.0054, -0.2847) .. (0.994, -0.2847).. controls (0.9813, -0.2847) and (0.9755, -0.2765) .. (0.9747, -0.2693) -- (0.9827, -0.2672).. controls (0.9832, -0.2725) and (0.9869, -0.2773) .. (0.994, -0.2773).. controls (1.0001, -0.2773) and (1.003, -0.2744) .. (1.003, -0.2704).. controls (1.003, -0.2672) and (1.0007, -0.2646) .. (0.9964, -0.2638) -- (0.9893, -0.2622).. controls (0.9816, -0.2606) and (0.9766, -0.2556) .. (0.9766, -0.2482).. controls (0.9766, -0.2397) and (0.9843, -0.2328) .. (0.9935, -0.2328).. controls (1.0052, -0.2328) and (1.0099, -0.24) .. (1.011, -0.2455) -- cycle;
    \path[fill] (1.0258, -0.2667).. controls (1.0258, -0.2736) and (1.0303, -0.2775) .. (1.0353, -0.2775).. controls (1.0406, -0.2775) and (1.043, -0.2738) .. (1.0438, -0.2712) -- (1.0509, -0.2738).. controls (1.0493, -0.2791) and (1.0443, -0.285) .. (1.0353, -0.285).. controls (1.0253, -0.285) and (1.0176, -0.2773) .. (1.0176, -0.2667).. controls (1.0176, -0.2561) and (1.0253, -0.2484) .. (1.0351, -0.2484).. controls (1.0443, -0.2484) and (1.0493, -0.2543) .. (1.0507, -0.2596) -- (1.0433, -0.2622).. controls (1.0425, -0.2593) and (1.0401, -0.2559) .. (1.0351, -0.2559).. controls (1.03, -0.2561) and (1.0258, -0.2598) .. (1.0258, -0.2667) -- cycle;
    \path[fill] (1.0631, -0.232).. controls (1.066, -0.232) and (1.0684, -0.2344) .. (1.0684, -0.2373).. controls (1.0684, -0.2402) and (1.066, -0.2426) .. (1.0631, -0.2426).. controls (1.0602, -0.2426) and (1.0578, -0.2402) .. (1.0578, -0.2373).. controls (1.0578, -0.2344) and (1.0602, -0.232) .. (1.0631, -0.232) -- cycle(1.0591, -0.2836) -- (1.0591, -0.2495) -- (1.0673, -0.2495) -- (1.0673, -0.2836) -- cycle;
    \path[fill] (1.1089, -0.2738).. controls (1.107, -0.2799) and (1.1017, -0.2847) .. (1.0935, -0.2847).. controls (1.0843, -0.2847) and (1.0761, -0.2781) .. (1.0761, -0.2664).. controls (1.0761, -0.2556) and (1.084, -0.2484) .. (1.0927, -0.2484).. controls (1.1033, -0.2484) and (1.1094, -0.2553) .. (1.1094, -0.2662).. controls (1.1094, -0.2675) and (1.1094, -0.2686) .. (1.1091, -0.2688) -- (1.084, -0.2688).. controls (1.0843, -0.2741) and (1.0882, -0.2778) .. (1.0933, -0.2778).. controls (1.0983, -0.2778) and (1.1007, -0.2752) .. (1.1017, -0.2717) -- cycle(1.1009, -0.263).. controls (1.1007, -0.259) and (1.098, -0.2553) .. (1.0925, -0.2553).. controls (1.0874, -0.2553) and (1.0843, -0.2593) .. (1.084, -0.263) -- cycle;
    \path[fill] (1.1261, -0.2836) -- (1.1179, -0.2836) -- (1.1179, -0.2495) -- (1.1258, -0.2495) -- (1.1258, -0.254).. controls (1.1279, -0.25) and (1.1322, -0.2484) .. (1.1359, -0.2484).. controls (1.1443, -0.2484) and (1.1483, -0.2545) .. (1.1483, -0.2619) -- (1.1483, -0.2836) -- (1.1401, -0.2836) -- (1.1401, -0.2635).. controls (1.1401, -0.2593) and (1.1382, -0.2559) .. (1.1329, -0.2559).. controls (1.1282, -0.2559) and (1.1258, -0.2596) .. (1.1258, -0.2641) -- (1.1258, -0.2836) -- cycle;
    \path[fill] (1.1647, -0.2667).. controls (1.1647, -0.2736) and (1.1692, -0.2775) .. (1.1742, -0.2775).. controls (1.1795, -0.2775) and (1.1819, -0.2738) .. (1.1827, -0.2712) -- (1.1898, -0.2738).. controls (1.1882, -0.2791) and (1.1832, -0.285) .. (1.1742, -0.285).. controls (1.1642, -0.285) and (1.1565, -0.2773) .. (1.1565, -0.2667).. controls (1.1565, -0.2561) and (1.1642, -0.2484) .. (1.174, -0.2484).. controls (1.1832, -0.2484) and (1.1882, -0.2543) .. (1.1896, -0.2596) -- (1.1822, -0.2622).. controls (1.1814, -0.2593) and (1.179, -0.2559) .. (1.174, -0.2559).. controls (1.1689, -0.2561) and (1.1647, -0.2598) .. (1.1647, -0.2667) -- cycle;
    \path[fill] (1.2279, -0.2738).. controls (1.2261, -0.2799) and (1.2208, -0.2847) .. (1.2126, -0.2847).. controls (1.2033, -0.2847) and (1.1951, -0.2781) .. (1.1951, -0.2664).. controls (1.1951, -0.2556) and (1.2031, -0.2484) .. (1.2118, -0.2484).. controls (1.2224, -0.2484) and (1.2285, -0.2553) .. (1.2285, -0.2662).. controls (1.2285, -0.2675) and (1.2285, -0.2686) .. (1.2282, -0.2688) -- (1.2031, -0.2688).. controls (1.2033, -0.2741) and (1.2073, -0.2778) .. (1.2123, -0.2778).. controls (1.2173, -0.2778) and (1.2197, -0.2752) .. (1.2208, -0.2717) -- cycle(1.2203, -0.263).. controls (1.22, -0.259) and (1.2173, -0.2553) .. (1.2118, -0.2553).. controls (1.2068, -0.2553) and (1.2036, -0.2593) .. (1.2033, -0.263) -- cycle;
    \path[fill] (1.2412, -0.2725).. controls (1.2414, -0.2757) and (1.2438, -0.2783) .. (1.248, -0.2783).. controls (1.2515, -0.2783) and (1.2531, -0.2765) .. (1.2531, -0.2744).. controls (1.2531, -0.2725) and (1.2517, -0.2712) .. (1.2491, -0.2707) -- (1.2441, -0.2696).. controls (1.238, -0.2683) and (1.2348, -0.2643) .. (1.2348, -0.2596).. controls (1.2348, -0.2535) and (1.2404, -0.2484) .. (1.2475, -0.2484).. controls (1.257, -0.2484) and (1.2602, -0.2545) .. (1.2607, -0.258) -- (1.2539, -0.2598).. controls (1.2536, -0.258) and (1.252, -0.2548) .. (1.2475, -0.2548).. controls (1.2446, -0.2548) and (1.2425, -0.2566) .. (1.2425, -0.2588).. controls (1.2425, -0.2606) and (1.2438, -0.2619) .. (1.2459, -0.2622) -- (1.2512, -0.2633).. controls (1.2576, -0.2646) and (1.261, -0.2686) .. (1.261, -0.2736).. controls (1.261, -0.2789) and (1.2568, -0.2844) .. (1.248, -0.2844).. controls (1.2383, -0.2844) and (1.2343, -0.2781) .. (1.234, -0.2741) -- cycle;
  \end{scope}
\end{tikzpicture}
}

\newcommand{\nnlogotext}{%
\begin{tikzpicture}[remember picture,overlay]% 
  \begin{scope}[shift={(-0.7649, 0.2881)}]
    \path[fill] (0.799, -0.0982) -- (0.7744, -0.0603) -- (0.7744, -0.0982) -- (0.766, -0.0982) -- (0.766, -0.0484) -- (0.7768, -0.0484) -- (0.7996, -0.0839) -- (0.7996, -0.0484) -- (0.808, -0.0484) -- (0.808, -0.0982) -- cycle;
    \path[fill] (0.8525, -0.0812).. controls (0.8525, -0.0918) and (0.8451, -0.0995) .. (0.8348, -0.0995).. controls (0.8247, -0.0995) and (0.817, -0.0918) .. (0.817, -0.0812).. controls (0.817, -0.0706) and (0.8244, -0.063) .. (0.8348, -0.063).. controls (0.8451, -0.063) and (0.8525, -0.0706) .. (0.8525, -0.0812) -- cycle(0.8443, -0.0812).. controls (0.8443, -0.0741) and (0.8398, -0.0704) .. (0.8348, -0.0704).. controls (0.8297, -0.0704) and (0.8252, -0.0741) .. (0.8252, -0.0812).. controls (0.8252, -0.0884) and (0.8297, -0.0921) .. (0.8348, -0.0921).. controls (0.8398, -0.0921) and (0.8443, -0.0884) .. (0.8443, -0.0812) -- cycle;
    \path[fill] (0.8813, -0.0722).. controls (0.8803, -0.072) and (0.8795, -0.072) .. (0.8787, -0.072).. controls (0.8723, -0.072) and (0.8694, -0.0757) .. (0.8694, -0.082) -- (0.8694, -0.0984) -- (0.8612, -0.0984) -- (0.8612, -0.0643) -- (0.8692, -0.0643) -- (0.8692, -0.0699).. controls (0.8707, -0.0661) and (0.8744, -0.064) .. (0.8789, -0.064).. controls (0.88, -0.064) and (0.8808, -0.0643) .. (0.8811, -0.0643) -- (0.8811, -0.0722) -- cycle;
    \path[fill] (0.9189, -0.0884).. controls (0.917, -0.0945) and (0.9118, -0.0992) .. (0.9036, -0.0992).. controls (0.8943, -0.0992) and (0.8861, -0.0926) .. (0.8861, -0.081).. controls (0.8861, -0.0701) and (0.894, -0.063) .. (0.9028, -0.063).. controls (0.9133, -0.063) and (0.9194, -0.0699) .. (0.9194, -0.0807).. controls (0.9194, -0.082) and (0.9194, -0.0831) .. (0.9192, -0.0833) -- (0.894, -0.0833).. controls (0.8943, -0.0886) and (0.8983, -0.0923) .. (0.9033, -0.0923).. controls (0.9083, -0.0923) and (0.9107, -0.0897) .. (0.9118, -0.0863) -- cycle(0.9112, -0.0775).. controls (0.911, -0.0736) and (0.9083, -0.0699) .. (0.9028, -0.0699).. controls (0.8977, -0.0699) and (0.8946, -0.0738) .. (0.8943, -0.0775) -- cycle;
    \path[fill] (0.9332, -0.0982).. controls (0.9337, -0.1024) and (0.9372, -0.1056) .. (0.9417, -0.1056).. controls (0.948, -0.1056) and (0.9514, -0.1024) .. (0.9514, -0.0953) -- (0.9514, -0.0918).. controls (0.9499, -0.0945) and (0.9464, -0.0968) .. (0.9414, -0.0968).. controls (0.9324, -0.0968) and (0.9255, -0.0897) .. (0.9255, -0.0802).. controls (0.9255, -0.0709) and (0.9319, -0.0635) .. (0.9414, -0.0635).. controls (0.9467, -0.0635) and (0.9501, -0.0656) .. (0.9514, -0.0685) -- (0.9514, -0.0643) -- (0.9594, -0.0643) -- (0.9594, -0.0953).. controls (0.9594, -0.1045) and (0.9546, -0.113) .. (0.9419, -0.113).. controls (0.9329, -0.113) and (0.9266, -0.1074) .. (0.9255, -0.1005) -- cycle(0.9514, -0.0802).. controls (0.9514, -0.0743) and (0.9477, -0.0706) .. (0.9427, -0.0706).. controls (0.9374, -0.0706) and (0.9337, -0.0743) .. (0.9337, -0.0802).. controls (0.9337, -0.0863) and (0.9372, -0.09) .. (0.9427, -0.09).. controls (0.948, -0.0897) and (0.9514, -0.086) .. (0.9514, -0.0802) -- cycle;
    \path[fill] (0.9745, -0.087).. controls (0.9747, -0.0902) and (0.9771, -0.0929) .. (0.9813, -0.0929).. controls (0.9848, -0.0929) and (0.9864, -0.091) .. (0.9864, -0.0889).. controls (0.9864, -0.087) and (0.985, -0.0857) .. (0.9824, -0.0852) -- (0.9774, -0.0841).. controls (0.9713, -0.0828) and (0.9681, -0.0788) .. (0.9681, -0.0741).. controls (0.9681, -0.068) and (0.9737, -0.063) .. (0.9808, -0.063).. controls (0.9903, -0.063) and (0.9935, -0.0691) .. (0.994, -0.0725) -- (0.9872, -0.0743).. controls (0.9869, -0.0725) and (0.9853, -0.0693) .. (0.9808, -0.0693).. controls (0.9779, -0.0693) and (0.9758, -0.0712) .. (0.9758, -0.0733).. controls (0.9758, -0.0751) and (0.9771, -0.0765) .. (0.9792, -0.077) -- (0.9845, -0.0781).. controls (0.9909, -0.0794) and (0.9943, -0.0833) .. (0.9943, -0.0884).. controls (0.9943, -0.0937) and (0.9901, -0.0992) .. (0.9813, -0.0992).. controls (0.9716, -0.0992) and (0.9676, -0.0929) .. (0.9673, -0.0889) -- cycle;
    \path[fill] (1.0216, -0.0982) -- (1.0216, -0.064) -- (1.0292, -0.064) -- (1.0292, -0.0683).. controls (1.0311, -0.0648) and (1.0356, -0.063) .. (1.0393, -0.063).. controls (1.0438, -0.063) and (1.0478, -0.0651) .. (1.0496, -0.0691).. controls (1.0522, -0.0646) and (1.0562, -0.063) .. (1.0607, -0.063).. controls (1.0668, -0.063) and (1.0729, -0.0669) .. (1.0729, -0.0759) -- (1.0729, -0.0982) -- (1.0649, -0.0982) -- (1.0649, -0.0773).. controls (1.0649, -0.0733) and (1.0628, -0.0701) .. (1.0583, -0.0701).. controls (1.0541, -0.0701) and (1.0512, -0.0736) .. (1.0512, -0.0778) -- (1.0512, -0.0982) -- (1.0433, -0.0982) -- (1.0433, -0.0773).. controls (1.0433, -0.0733) and (1.0414, -0.0701) .. (1.0366, -0.0701).. controls (1.0324, -0.0701) and (1.0295, -0.0733) .. (1.0295, -0.0778) -- (1.0295, -0.0982) -- cycle;
    \path[fill] (1.0877, -0.0468).. controls (1.0906, -0.0468) and (1.093, -0.0492) .. (1.093, -0.0521).. controls (1.093, -0.055) and (1.0906, -0.0574) .. (1.0877, -0.0574).. controls (1.0848, -0.0574) and (1.0824, -0.055) .. (1.0824, -0.0521).. controls (1.0824, -0.0492) and (1.0848, -0.0468) .. (1.0877, -0.0468) -- cycle(1.0837, -0.0982) -- (1.0837, -0.064) -- (1.0919, -0.064) -- (1.0919, -0.0982) -- cycle;
    \path[fill] (1.1033, -0.0982) -- (1.1033, -0.0474) -- (1.1113, -0.0474) -- (1.1113, -0.0982) -- cycle;
    \path[fill] (1.1226, -0.064) -- (1.1308, -0.064) -- (1.1308, -0.1016).. controls (1.1308, -0.108) and (1.1269, -0.1124) .. (1.1208, -0.1124).. controls (1.1181, -0.1124) and (1.1165, -0.1119) .. (1.1163, -0.1119) -- (1.1163, -0.1053).. controls (1.1165, -0.1053) and (1.1179, -0.1056) .. (1.1187, -0.1056).. controls (1.1218, -0.1056) and (1.1229, -0.104) .. (1.1229, -0.1011) -- (1.1229, -0.064) -- cycle(1.1266, -0.0466).. controls (1.1295, -0.0466) and (1.1319, -0.0489) .. (1.1319, -0.0519).. controls (1.1319, -0.0548) and (1.1295, -0.0572) .. (1.1266, -0.0572).. controls (1.1237, -0.0572) and (1.1213, -0.0548) .. (1.1213, -0.0519).. controls (1.1216, -0.0489) and (1.124, -0.0466) .. (1.1266, -0.0466) -- cycle;
    \path[fill] (1.1663, -0.0654) -- (1.17, -0.0609) -- (1.1742, -0.0646) -- (1.1705, -0.0691).. controls (1.1732, -0.0722) and (1.175, -0.0765) .. (1.175, -0.0812).. controls (1.175, -0.0918) and (1.1676, -0.0995) .. (1.1573, -0.0995).. controls (1.1538, -0.0995) and (1.1509, -0.0987) .. (1.1486, -0.0974) -- (1.1451, -0.1019) -- (1.1406, -0.0982) -- (1.1441, -0.0937).. controls (1.1411, -0.0905) and (1.1396, -0.0863) .. (1.1396, -0.0812).. controls (1.1396, -0.0706) and (1.147, -0.063) .. (1.1573, -0.063).. controls (1.1607, -0.063) and (1.1636, -0.0638) .. (1.1663, -0.0654) -- cycle(1.1491, -0.087) -- (1.1615, -0.0714).. controls (1.1602, -0.0709) and (1.1586, -0.0704) .. (1.1573, -0.0704).. controls (1.1523, -0.0704) and (1.1478, -0.0741) .. (1.1478, -0.0812).. controls (1.1478, -0.0836) and (1.1483, -0.0855) .. (1.1491, -0.087) -- cycle(1.1668, -0.0812).. controls (1.1668, -0.0791) and (1.1663, -0.077) .. (1.1655, -0.0754) -- (1.1531, -0.091).. controls (1.1544, -0.0915) and (1.1557, -0.0918) .. (1.1573, -0.0918).. controls (1.1623, -0.0921) and (1.1668, -0.0884) .. (1.1668, -0.0812) -- cycle;
    \path[fill] (1.1816, -0.0812) -- (1.1816, -0.0741) -- (1.2015, -0.0741) -- (1.2015, -0.0812) -- cycle;
    \path[fill] (1.2584, -0.0812).. controls (1.2584, -0.0918) and (1.251, -0.0995) .. (1.2406, -0.0995).. controls (1.2306, -0.0995) and (1.2229, -0.0918) .. (1.2229, -0.0812).. controls (1.2229, -0.0706) and (1.2303, -0.063) .. (1.2406, -0.063).. controls (1.2507, -0.063) and (1.2584, -0.0706) .. (1.2584, -0.0812) -- cycle(1.2502, -0.0812).. controls (1.2502, -0.0741) and (1.2457, -0.0704) .. (1.2406, -0.0704).. controls (1.2356, -0.0704) and (1.2311, -0.0741) .. (1.2311, -0.0812).. controls (1.2311, -0.0884) and (1.2356, -0.0921) .. (1.2406, -0.0921).. controls (1.2457, -0.0921) and (1.2502, -0.0884) .. (1.2502, -0.0812) -- cycle;
    \path[fill] (1.2721, -0.0982).. controls (1.2726, -0.1024) and (1.2761, -0.1056) .. (1.2806, -0.1056).. controls (1.2869, -0.1056) and (1.2904, -0.1024) .. (1.2904, -0.0953) -- (1.2904, -0.0918).. controls (1.2888, -0.0945) and (1.2853, -0.0968) .. (1.2803, -0.0968).. controls (1.2713, -0.0968) and (1.2644, -0.0897) .. (1.2644, -0.0802).. controls (1.2644, -0.0709) and (1.2708, -0.0635) .. (1.2803, -0.0635).. controls (1.2856, -0.0635) and (1.2891, -0.0656) .. (1.2904, -0.0685) -- (1.2904, -0.0643) -- (1.2983, -0.0643) -- (1.2983, -0.0953).. controls (1.2983, -0.1045) and (1.2935, -0.113) .. (1.2808, -0.113).. controls (1.2719, -0.113) and (1.2655, -0.1074) .. (1.2644, -0.1005) -- cycle(1.2906, -0.0802).. controls (1.2906, -0.0743) and (1.2869, -0.0706) .. (1.2819, -0.0706).. controls (1.2766, -0.0706) and (1.2729, -0.0743) .. (1.2729, -0.0802).. controls (1.2729, -0.0863) and (1.2764, -0.09) .. (1.2819, -0.09).. controls (1.2869, -0.0897) and (1.2906, -0.086) .. (1.2906, -0.0802) -- cycle;
    \path[fill] (0.7652, -0.1926) -- (0.7652, -0.1418) -- (0.7731, -0.1418) -- (0.7731, -0.1627).. controls (0.7747, -0.1601) and (0.7787, -0.1577) .. (0.784, -0.1577).. controls (0.7943, -0.1577) and (0.7998, -0.1654) .. (0.7998, -0.1754).. controls (0.7998, -0.1857) and (0.7938, -0.1937) .. (0.7837, -0.1937).. controls (0.7789, -0.1937) and (0.7752, -0.1916) .. (0.7731, -0.1884) -- (0.7731, -0.1929) -- (0.7652, -0.1929) -- cycle(0.7824, -0.1648).. controls (0.7771, -0.1648) and (0.7731, -0.1688) .. (0.7731, -0.1754).. controls (0.7731, -0.182) and (0.7771, -0.1863) .. (0.7824, -0.1863).. controls (0.7877, -0.1863) and (0.7916, -0.1823) .. (0.7916, -0.1754).. controls (0.7916, -0.1685) and (0.7877, -0.1648) .. (0.7824, -0.1648) -- cycle;
    \path[fill] (0.8125, -0.141).. controls (0.8154, -0.141) and (0.8178, -0.1434) .. (0.8178, -0.1463).. controls (0.8178, -0.1492) and (0.8154, -0.1516) .. (0.8125, -0.1516).. controls (0.8096, -0.1516) and (0.8072, -0.1492) .. (0.8072, -0.1463).. controls (0.8072, -0.1434) and (0.8096, -0.141) .. (0.8125, -0.141) -- cycle(0.8086, -0.1926) -- (0.8086, -0.1585) -- (0.8165, -0.1585) -- (0.8165, -0.1926) -- cycle;
    \path[fill] (0.8607, -0.1754).. controls (0.8607, -0.186) and (0.8533, -0.1937) .. (0.843, -0.1937).. controls (0.8326, -0.1937) and (0.8252, -0.186) .. (0.8252, -0.1754).. controls (0.8252, -0.1648) and (0.8326, -0.1572) .. (0.843, -0.1572).. controls (0.8533, -0.1574) and (0.8607, -0.1651) .. (0.8607, -0.1754) -- cycle(0.8525, -0.1754).. controls (0.8525, -0.1683) and (0.848, -0.1646) .. (0.843, -0.1646).. controls (0.8379, -0.1646) and (0.8334, -0.1683) .. (0.8334, -0.1754).. controls (0.8334, -0.1826) and (0.8379, -0.1863) .. (0.843, -0.1863).. controls (0.848, -0.1865) and (0.8525, -0.1826) .. (0.8525, -0.1754) -- cycle;
    \path[fill] (0.8861, -0.1926) -- (0.8779, -0.1926) -- (0.8639, -0.1585) -- (0.8729, -0.1585) -- (0.8819, -0.1828) -- (0.8906, -0.1585) -- (0.8991, -0.1585) -- cycle;
    \path[fill] (0.9102, -0.141).. controls (0.9131, -0.141) and (0.9155, -0.1434) .. (0.9155, -0.1463).. controls (0.9155, -0.1492) and (0.9131, -0.1516) .. (0.9102, -0.1516).. controls (0.9073, -0.1516) and (0.9049, -0.1492) .. (0.9049, -0.1463).. controls (0.9049, -0.1434) and (0.9073, -0.141) .. (0.9102, -0.141) -- cycle(0.9062, -0.1926) -- (0.9062, -0.1585) -- (0.9144, -0.1585) -- (0.9144, -0.1926) -- cycle;
    \path[fill] (0.9361, -0.1585) -- (0.9432, -0.1585) -- (0.9432, -0.1656) -- (0.9361, -0.1656) -- (0.9361, -0.1815).. controls (0.9361, -0.1844) and (0.9374, -0.1857) .. (0.9403, -0.1857).. controls (0.9414, -0.1857) and (0.9427, -0.1855) .. (0.9432, -0.1855) -- (0.9432, -0.1921).. controls (0.9427, -0.1924) and (0.9411, -0.1929) .. (0.9382, -0.1929).. controls (0.9319, -0.1929) and (0.9279, -0.1892) .. (0.9279, -0.1828) -- (0.9279, -0.1656) -- (0.9215, -0.1656) -- (0.9215, -0.1585) -- (0.9234, -0.1585).. controls (0.9271, -0.1585) and (0.9287, -0.1561) .. (0.9287, -0.1532) -- (0.9287, -0.1482) -- (0.9361, -0.1482) -- cycle;
    \path[fill] (0.957, -0.1815).. controls (0.9573, -0.1847) and (0.9596, -0.1873) .. (0.9639, -0.1873).. controls (0.9673, -0.1873) and (0.9689, -0.1855) .. (0.9689, -0.1834).. controls (0.9689, -0.1815) and (0.9676, -0.1802) .. (0.9649, -0.1797) -- (0.9599, -0.1786).. controls (0.9538, -0.1773) and (0.9506, -0.1733) .. (0.9506, -0.1685).. controls (0.9506, -0.1625) and (0.9562, -0.1574) .. (0.9633, -0.1574).. controls (0.9729, -0.1574) and (0.976, -0.1635) .. (0.9766, -0.167) -- (0.9697, -0.1688).. controls (0.9694, -0.167) and (0.9678, -0.1638) .. (0.9633, -0.1638).. controls (0.9604, -0.1638) and (0.9583, -0.1656) .. (0.9583, -0.1677).. controls (0.9583, -0.1696) and (0.9596, -0.1709) .. (0.9618, -0.1715) -- (0.9671, -0.1725).. controls (0.9734, -0.1738) and (0.9768, -0.1778) .. (0.9768, -0.1828).. controls (0.9768, -0.1881) and (0.9726, -0.1937) .. (0.9639, -0.1937).. controls (0.9541, -0.1937) and (0.9501, -0.1873) .. (0.9499, -0.1834) -- cycle;
    \path[fill] (1.0038, -0.173) -- (1.0181, -0.1929) -- (1.0081, -0.1929) -- (0.998, -0.1789) -- (0.9938, -0.1834) -- (0.9938, -0.1929) -- (0.9856, -0.1929) -- (0.9856, -0.1421) -- (0.9938, -0.1421) -- (0.9938, -0.1725) -- (1.007, -0.1588) -- (1.0179, -0.1588) -- cycle;
    \path[fill] (1.0321, -0.173) -- (1.0409, -0.1717).. controls (1.0427, -0.1715) and (1.0435, -0.1704) .. (1.0435, -0.1693).. controls (1.0435, -0.1664) and (1.0417, -0.164) .. (1.0372, -0.164).. controls (1.0329, -0.164) and (1.0306, -0.1667) .. (1.03, -0.1701) -- (1.0226, -0.1685).. controls (1.0231, -0.1627) and (1.0287, -0.1574) .. (1.0369, -0.1574).. controls (1.0475, -0.1574) and (1.0515, -0.1635) .. (1.0515, -0.1701) -- (1.0515, -0.1871).. controls (1.0515, -0.1902) and (1.0517, -0.1921) .. (1.052, -0.1926) -- (1.0443, -0.1926).. controls (1.0443, -0.1924) and (1.044, -0.191) .. (1.044, -0.1884).. controls (1.0425, -0.191) and (1.039, -0.1937) .. (1.0335, -0.1937).. controls (1.0263, -0.1937) and (1.0218, -0.1886) .. (1.0218, -0.1834).. controls (1.0218, -0.1773) and (1.0263, -0.1738) .. (1.0321, -0.173) -- cycle(1.0435, -0.1786) -- (1.0435, -0.177) -- (1.0345, -0.1783).. controls (1.0321, -0.1789) and (1.03, -0.1802) .. (1.03, -0.1831).. controls (1.03, -0.1855) and (1.0319, -0.1876) .. (1.0351, -0.1876).. controls (1.0395, -0.1873) and (1.0435, -0.1852) .. (1.0435, -0.1786) -- cycle;
    \path[fill] (1.0623, -0.2061) -- (1.0623, -0.1585) -- (1.0702, -0.1585) -- (1.0702, -0.1632).. controls (1.0718, -0.1603) and (1.0758, -0.158) .. (1.0811, -0.158).. controls (1.0911, -0.158) and (1.097, -0.1656) .. (1.097, -0.1757).. controls (1.097, -0.186) and (1.0906, -0.1937) .. (1.0808, -0.1937).. controls (1.0758, -0.1937) and (1.0721, -0.1916) .. (1.0705, -0.1889) -- (1.0705, -0.2061) -- cycle(1.0795, -0.1648).. controls (1.0742, -0.1648) and (1.0702, -0.1691) .. (1.0702, -0.1754).. controls (1.0702, -0.182) and (1.0742, -0.1863) .. (1.0795, -0.1863).. controls (1.0848, -0.1863) and (1.0888, -0.182) .. (1.0888, -0.1754).. controls (1.0888, -0.1691) and (1.0851, -0.1648) .. (1.0795, -0.1648) -- cycle;
    \path[fill] (1.1057, -0.1926) -- (1.1057, -0.1418) -- (1.1139, -0.1418) -- (1.1139, -0.1926) -- cycle;
    \path[fill] (1.1554, -0.1828).. controls (1.1536, -0.1889) and (1.1483, -0.1937) .. (1.1401, -0.1937).. controls (1.1308, -0.1937) and (1.1226, -0.1871) .. (1.1226, -0.1754).. controls (1.1226, -0.1646) and (1.1306, -0.1574) .. (1.1393, -0.1574).. controls (1.1499, -0.1574) and (1.156, -0.1643) .. (1.156, -0.1752).. controls (1.156, -0.1765) and (1.156, -0.1775) .. (1.1557, -0.1778) -- (1.1306, -0.1778).. controls (1.1308, -0.1831) and (1.1348, -0.1868) .. (1.1398, -0.1868).. controls (1.1449, -0.1868) and (1.1472, -0.1842) .. (1.1483, -0.1807) -- cycle(1.1475, -0.1717).. controls (1.1472, -0.1677) and (1.1446, -0.164) .. (1.139, -0.164).. controls (1.134, -0.164) and (1.1308, -0.168) .. (1.1306, -0.1717) -- cycle;
    \path[fill] (1.1695, -0.1926).. controls (1.17, -0.1969) and (1.1734, -0.2) .. (1.1779, -0.2).. controls (1.1843, -0.2) and (1.1877, -0.1969) .. (1.1877, -0.1897) -- (1.1877, -0.186).. controls (1.1861, -0.1886) and (1.1827, -0.191) .. (1.1777, -0.191).. controls (1.1687, -0.191) and (1.1618, -0.1839) .. (1.1618, -0.1744).. controls (1.1618, -0.1651) and (1.1681, -0.1577) .. (1.1777, -0.1577).. controls (1.183, -0.1577) and (1.1864, -0.1598) .. (1.1877, -0.1627) -- (1.1877, -0.1585) -- (1.1957, -0.1585) -- (1.1957, -0.1894).. controls (1.1957, -0.1984) and (1.1909, -0.2072) .. (1.1782, -0.2072).. controls (1.1692, -0.2072) and (1.1628, -0.2016) .. (1.1618, -0.1947) -- cycle(1.188, -0.1744).. controls (1.188, -0.1685) and (1.1843, -0.1648) .. (1.1792, -0.1648).. controls (1.174, -0.1648) and (1.1703, -0.1685) .. (1.1703, -0.1744).. controls (1.1703, -0.1804) and (1.1737, -0.1842) .. (1.1792, -0.1842).. controls (1.1845, -0.1842) and (1.188, -0.1804) .. (1.188, -0.1744) -- cycle;
    \path[fill] (1.2369, -0.1828).. controls (1.2351, -0.1889) and (1.2298, -0.1937) .. (1.2216, -0.1937).. controls (1.2123, -0.1937) and (1.2041, -0.1871) .. (1.2041, -0.1754).. controls (1.2041, -0.1646) and (1.2121, -0.1574) .. (1.2208, -0.1574).. controls (1.2314, -0.1574) and (1.2375, -0.1643) .. (1.2375, -0.1752).. controls (1.2375, -0.1765) and (1.2375, -0.1775) .. (1.2372, -0.1778) -- (1.2121, -0.1778).. controls (1.2123, -0.1831) and (1.2163, -0.1868) .. (1.2213, -0.1868).. controls (1.2263, -0.1868) and (1.2287, -0.1842) .. (1.2298, -0.1807) -- cycle(1.2293, -0.1717).. controls (1.229, -0.1677) and (1.2263, -0.164) .. (1.2208, -0.164).. controls (1.2158, -0.164) and (1.2126, -0.168) .. (1.2123, -0.1717) -- cycle;
    \path[fill] (0.7779, -0.2881).. controls (0.7697, -0.2881) and (0.7649, -0.282) .. (0.7649, -0.2746) -- (0.7649, -0.2529) -- (0.7731, -0.2529) -- (0.7731, -0.2731).. controls (0.7731, -0.2773) and (0.775, -0.2807) .. (0.78, -0.2807).. controls (0.7848, -0.2807) and (0.7871, -0.2775) .. (0.7871, -0.2731) -- (0.7871, -0.2529) -- (0.7953, -0.2529) -- (0.7953, -0.281).. controls (0.7953, -0.2839) and (0.7956, -0.286) .. (0.7956, -0.2873) -- (0.7879, -0.2873).. controls (0.7877, -0.2865) and (0.7877, -0.285) .. (0.7877, -0.2836).. controls (0.7858, -0.2863) and (0.7818, -0.2881) .. (0.7779, -0.2881) -- cycle;
    \path[fill] (0.8149, -0.2871) -- (0.8067, -0.2871) -- (0.8067, -0.2529) -- (0.8147, -0.2529) -- (0.8147, -0.2574).. controls (0.8168, -0.2535) and (0.821, -0.2519) .. (0.8247, -0.2519).. controls (0.8332, -0.2519) and (0.8371, -0.258) .. (0.8371, -0.2654) -- (0.8371, -0.2871) -- (0.8289, -0.2871) -- (0.8289, -0.267).. controls (0.8289, -0.2627) and (0.8271, -0.2593) .. (0.8218, -0.2593).. controls (0.8173, -0.2593) and (0.8147, -0.263) .. (0.8147, -0.2675) -- (0.8147, -0.2871) -- cycle;
    \path[fill] (0.852, -0.2355).. controls (0.8549, -0.2355) and (0.8573, -0.2379) .. (0.8573, -0.2408).. controls (0.8573, -0.2437) and (0.8549, -0.2461) .. (0.852, -0.2461).. controls (0.849, -0.2461) and (0.8467, -0.2437) .. (0.8467, -0.2408).. controls (0.8467, -0.2379) and (0.849, -0.2355) .. (0.852, -0.2355) -- cycle(0.8477, -0.2871) -- (0.8477, -0.2529) -- (0.8559, -0.2529) -- (0.8559, -0.2871) -- cycle;
    \path[fill] (0.8848, -0.2871) -- (0.8766, -0.2871) -- (0.8625, -0.2529) -- (0.8715, -0.2529) -- (0.8805, -0.2773) -- (0.8893, -0.2529) -- (0.8977, -0.2529) -- cycle;
    \path[fill] (0.9342, -0.2773).. controls (0.9324, -0.2834) and (0.9271, -0.2881) .. (0.9189, -0.2881).. controls (0.9096, -0.2881) and (0.9014, -0.2815) .. (0.9014, -0.2699).. controls (0.9014, -0.259) and (0.9094, -0.2519) .. (0.9181, -0.2519).. controls (0.9287, -0.2519) and (0.9348, -0.2588) .. (0.9348, -0.2696).. controls (0.9348, -0.2709) and (0.9348, -0.272) .. (0.9345, -0.2723) -- (0.9094, -0.2723).. controls (0.9096, -0.2775) and (0.9136, -0.2813) .. (0.9186, -0.2813).. controls (0.9237, -0.2813) and (0.926, -0.2786) .. (0.9271, -0.2752) -- cycle(0.9266, -0.2662).. controls (0.9263, -0.2622) and (0.9237, -0.2585) .. (0.9181, -0.2585).. controls (0.9131, -0.2585) and (0.9099, -0.2625) .. (0.9096, -0.2662) -- cycle;
    \path[fill] (0.9633, -0.2609).. controls (0.9623, -0.2606) and (0.9615, -0.2606) .. (0.9607, -0.2606).. controls (0.9544, -0.2606) and (0.9514, -0.2643) .. (0.9514, -0.2707) -- (0.9514, -0.2871) -- (0.9432, -0.2871) -- (0.9432, -0.2529) -- (0.9512, -0.2529) -- (0.9512, -0.2585).. controls (0.9528, -0.2548) and (0.9565, -0.2527) .. (0.961, -0.2527).. controls (0.962, -0.2527) and (0.9628, -0.2527) .. (0.9631, -0.2529) -- (0.9631, -0.2609) -- cycle;
    \path[fill] (0.9753, -0.2757).. controls (0.9755, -0.2789) and (0.9779, -0.2815) .. (0.9821, -0.2815).. controls (0.9856, -0.2815) and (0.9872, -0.2797) .. (0.9872, -0.2775).. controls (0.9872, -0.2757) and (0.9858, -0.2744) .. (0.9832, -0.2738) -- (0.9782, -0.2728).. controls (0.9721, -0.2715) and (0.9689, -0.2675) .. (0.9689, -0.2627).. controls (0.9689, -0.2566) and (0.9745, -0.2516) .. (0.9816, -0.2516).. controls (0.9911, -0.2516) and (0.9943, -0.2577) .. (0.9948, -0.2611) -- (0.988, -0.263).. controls (0.9877, -0.2611) and (0.9861, -0.258) .. (0.9816, -0.258).. controls (0.9787, -0.258) and (0.9766, -0.2598) .. (0.9766, -0.2619).. controls (0.9766, -0.2638) and (0.9779, -0.2651) .. (0.98, -0.2654) -- (0.9853, -0.2664).. controls (0.9917, -0.2678) and (0.9951, -0.2717) .. (0.9951, -0.2768).. controls (0.9951, -0.282) and (0.9909, -0.2876) .. (0.9821, -0.2876).. controls (0.9723, -0.2876) and (0.9684, -0.2813) .. (0.9681, -0.2773) -- cycle;
    \path[fill] (1.0081, -0.2355).. controls (1.011, -0.2355) and (1.0134, -0.2379) .. (1.0134, -0.2408).. controls (1.0134, -0.2437) and (1.011, -0.2461) .. (1.0081, -0.2461).. controls (1.0052, -0.2461) and (1.0028, -0.2437) .. (1.0028, -0.2408).. controls (1.0028, -0.2379) and (1.0052, -0.2355) .. (1.0081, -0.2355) -- cycle(1.0041, -0.2871) -- (1.0041, -0.2529) -- (1.0123, -0.2529) -- (1.0123, -0.2871) -- cycle;
    \path[fill] (1.034, -0.2529) -- (1.0411, -0.2529) -- (1.0411, -0.2601) -- (1.034, -0.2601) -- (1.034, -0.276).. controls (1.034, -0.2789) and (1.0353, -0.2802) .. (1.0382, -0.2802).. controls (1.0393, -0.2802) and (1.0406, -0.2799) .. (1.0411, -0.2799) -- (1.0411, -0.2865).. controls (1.0406, -0.2868) and (1.039, -0.2873) .. (1.0361, -0.2873).. controls (1.0298, -0.2873) and (1.0258, -0.2836) .. (1.0258, -0.2773) -- (1.0258, -0.2601) -- (1.0194, -0.2601) -- (1.0194, -0.2529) -- (1.0213, -0.2529).. controls (1.025, -0.2529) and (1.0266, -0.2506) .. (1.0266, -0.2477) -- (1.0266, -0.2426) -- (1.034, -0.2426) -- cycle;
    \path[fill] (1.08, -0.2773).. controls (1.0782, -0.2834) and (1.0729, -0.2881) .. (1.0647, -0.2881).. controls (1.0554, -0.2881) and (1.0472, -0.2815) .. (1.0472, -0.2699).. controls (1.0472, -0.259) and (1.0552, -0.2519) .. (1.0639, -0.2519).. controls (1.0745, -0.2519) and (1.0806, -0.2588) .. (1.0806, -0.2696).. controls (1.0806, -0.2709) and (1.0806, -0.272) .. (1.0803, -0.2723) -- (1.0552, -0.2723).. controls (1.0554, -0.2775) and (1.0594, -0.2813) .. (1.0644, -0.2813).. controls (1.0694, -0.2813) and (1.0718, -0.2786) .. (1.0729, -0.2752) -- cycle(1.0724, -0.2662).. controls (1.0721, -0.2622) and (1.0694, -0.2585) .. (1.0639, -0.2585).. controls (1.0589, -0.2585) and (1.0557, -0.2625) .. (1.0554, -0.2662) -- cycle;
    \path[fill] (1.0996, -0.2529) -- (1.1068, -0.2529) -- (1.1068, -0.2601) -- (1.0996, -0.2601) -- (1.0996, -0.276).. controls (1.0996, -0.2789) and (1.1009, -0.2802) .. (1.1038, -0.2802).. controls (1.1049, -0.2802) and (1.1062, -0.2799) .. (1.1068, -0.2799) -- (1.1068, -0.2865).. controls (1.1062, -0.2868) and (1.1046, -0.2873) .. (1.1017, -0.2873).. controls (1.0954, -0.2873) and (1.0914, -0.2836) .. (1.0914, -0.2773) -- (1.0914, -0.2601) -- (1.0851, -0.2601) -- (1.0851, -0.2529) -- (1.0869, -0.2529).. controls (1.0906, -0.2529) and (1.0922, -0.2506) .. (1.0922, -0.2477) -- (1.0922, -0.2426) -- (1.0996, -0.2426) -- cycle;
  \end{scope}
\end{tikzpicture}
}

\newcommand{\bmlogotext}{%
\begin{tikzpicture}[remember picture,overlay]% 
  \begin{scope}[shift={(-0.7649, 0.2881)}]
    \path[fill] (0.799, -0.0982) -- (0.7744, -0.0603) -- (0.7744, -0.0982) -- (0.766, -0.0982) -- (0.766, -0.0484) -- (0.7768, -0.0484) -- (0.7993, -0.0836) -- (0.7993, -0.0484) -- (0.8078, -0.0484) -- (0.8078, -0.0982) -- cycle;
    \path[fill] (0.8525, -0.0812).. controls (0.8525, -0.0918) and (0.8451, -0.0995) .. (0.8348, -0.0995).. controls (0.8244, -0.0995) and (0.817, -0.0918) .. (0.817, -0.0812).. controls (0.817, -0.0706) and (0.8244, -0.063) .. (0.8348, -0.063).. controls (0.8451, -0.063) and (0.8525, -0.0706) .. (0.8525, -0.0812) -- cycle(0.8443, -0.0812).. controls (0.8443, -0.0741) and (0.8398, -0.0704) .. (0.8348, -0.0704).. controls (0.8297, -0.0704) and (0.8252, -0.0741) .. (0.8252, -0.0812).. controls (0.8252, -0.0884) and (0.8297, -0.0921) .. (0.8348, -0.0921).. controls (0.8398, -0.0921) and (0.8443, -0.0884) .. (0.8443, -0.0812) -- cycle;
    \path[fill] (0.8813, -0.0722).. controls (0.8803, -0.072) and (0.8795, -0.072) .. (0.8787, -0.072).. controls (0.8723, -0.072) and (0.8694, -0.0757) .. (0.8694, -0.082) -- (0.8694, -0.0984) -- (0.8612, -0.0984) -- (0.8612, -0.0643) -- (0.8692, -0.0643) -- (0.8692, -0.0699).. controls (0.8707, -0.0661) and (0.8744, -0.064) .. (0.8789, -0.064).. controls (0.88, -0.064) and (0.8808, -0.064) .. (0.8811, -0.0643) -- (0.8811, -0.0722) -- cycle;
    \path[fill] (0.8938, -0.0982).. controls (0.8943, -0.1024) and (0.8977, -0.1056) .. (0.9022, -0.1056).. controls (0.9086, -0.1056) and (0.912, -0.1024) .. (0.912, -0.0953) -- (0.912, -0.0918).. controls (0.9104, -0.0945) and (0.907, -0.0968) .. (0.902, -0.0968).. controls (0.893, -0.0968) and (0.8861, -0.09) .. (0.8861, -0.0802).. controls (0.8861, -0.0712) and (0.8924, -0.0635) .. (0.902, -0.0635).. controls (0.9073, -0.0635) and (0.9107, -0.0656) .. (0.912, -0.0685) -- (0.912, -0.064) -- (0.92, -0.064) -- (0.92, -0.095).. controls (0.92, -0.1042) and (0.9152, -0.1127) .. (0.9025, -0.1127).. controls (0.8935, -0.1127) and (0.8871, -0.1072) .. (0.8861, -0.1003) -- cycle(0.9123, -0.0802).. controls (0.9123, -0.0743) and (0.9086, -0.0706) .. (0.9036, -0.0706).. controls (0.8983, -0.0706) and (0.8946, -0.0743) .. (0.8946, -0.0802).. controls (0.8946, -0.0863) and (0.898, -0.09) .. (0.9036, -0.09).. controls (0.9086, -0.0897) and (0.9123, -0.086) .. (0.9123, -0.0802) -- cycle;
    \path[fill] (0.9612, -0.0884).. controls (0.9594, -0.0945) and (0.9541, -0.0992) .. (0.9459, -0.0992).. controls (0.9366, -0.0992) and (0.9284, -0.0926) .. (0.9284, -0.081).. controls (0.9284, -0.0701) and (0.9364, -0.063) .. (0.9451, -0.063).. controls (0.9557, -0.063) and (0.9618, -0.0699) .. (0.9618, -0.0807).. controls (0.9618, -0.082) and (0.9618, -0.0831) .. (0.9615, -0.0833) -- (0.9364, -0.0833).. controls (0.9366, -0.0886) and (0.9406, -0.0923) .. (0.9456, -0.0923).. controls (0.9506, -0.0923) and (0.953, -0.0897) .. (0.9541, -0.0863) -- cycle(0.9533, -0.0775).. controls (0.953, -0.0736) and (0.9504, -0.0699) .. (0.9448, -0.0699).. controls (0.9398, -0.0699) and (0.9366, -0.0738) .. (0.9364, -0.0775) -- cycle;
    \path[fill] (0.9745, -0.087).. controls (0.9747, -0.0902) and (0.9771, -0.0929) .. (0.9813, -0.0929).. controls (0.9848, -0.0929) and (0.9864, -0.091) .. (0.9864, -0.0889).. controls (0.9864, -0.087) and (0.985, -0.0857) .. (0.9824, -0.0852) -- (0.9774, -0.0841).. controls (0.9713, -0.0828) and (0.9681, -0.0788) .. (0.9681, -0.0741).. controls (0.9681, -0.068) and (0.9737, -0.063) .. (0.9808, -0.063).. controls (0.9903, -0.063) and (0.9935, -0.0691) .. (0.994, -0.0725) -- (0.9872, -0.0743).. controls (0.9869, -0.0725) and (0.9853, -0.0693) .. (0.9808, -0.0693).. controls (0.9779, -0.0693) and (0.9758, -0.0712) .. (0.9758, -0.0733).. controls (0.9758, -0.0751) and (0.9771, -0.0765) .. (0.9792, -0.077) -- (0.9845, -0.0781).. controls (0.9909, -0.0794) and (0.9943, -0.0833) .. (0.9943, -0.0884).. controls (0.9943, -0.0937) and (0.9901, -0.0992) .. (0.9813, -0.0992).. controls (0.9716, -0.0992) and (0.9676, -0.0929) .. (0.9673, -0.0889) -- cycle;
    \path[fill] (1.0216, -0.0982) -- (1.0216, -0.064) -- (1.0292, -0.064) -- (1.0292, -0.0685).. controls (1.0311, -0.0651) and (1.0356, -0.0632) .. (1.0393, -0.0632).. controls (1.0438, -0.0632) and (1.0478, -0.0654) .. (1.0496, -0.0693).. controls (1.0522, -0.0648) and (1.0562, -0.0632) .. (1.0607, -0.0632).. controls (1.0668, -0.0632) and (1.0729, -0.0672) .. (1.0729, -0.0762) -- (1.0729, -0.0984) -- (1.0649, -0.0984) -- (1.0649, -0.0775).. controls (1.0649, -0.0736) and (1.0628, -0.0704) .. (1.0583, -0.0704).. controls (1.0541, -0.0704) and (1.0512, -0.0738) .. (1.0512, -0.0781) -- (1.0512, -0.0984) -- (1.0433, -0.0984) -- (1.0433, -0.0775).. controls (1.0433, -0.0736) and (1.0414, -0.0704) .. (1.0366, -0.0704).. controls (1.0324, -0.0704) and (1.0295, -0.0736) .. (1.0295, -0.0781) -- (1.0295, -0.0984) -- (1.0216, -0.0984) -- cycle;
    \path[fill] (1.0877, -0.0468).. controls (1.0906, -0.0468) and (1.093, -0.0492) .. (1.093, -0.0521).. controls (1.093, -0.055) and (1.0906, -0.0574) .. (1.0877, -0.0574).. controls (1.0848, -0.0574) and (1.0824, -0.055) .. (1.0824, -0.0521).. controls (1.0824, -0.0492) and (1.0848, -0.0468) .. (1.0877, -0.0468) -- cycle(1.0837, -0.0982) -- (1.0837, -0.064) -- (1.0919, -0.064) -- (1.0919, -0.0982) -- cycle;
    \path[fill] (1.1033, -0.0982) -- (1.1033, -0.0474) -- (1.1113, -0.0474) -- (1.1113, -0.0982) -- cycle;
    \path[fill] (1.1226, -0.064) -- (1.1308, -0.064) -- (1.1308, -0.1016).. controls (1.1308, -0.108) and (1.1269, -0.1127) .. (1.1208, -0.1127).. controls (1.1181, -0.1127) and (1.1165, -0.1122) .. (1.1163, -0.1122) -- (1.1163, -0.1056).. controls (1.1165, -0.1056) and (1.1179, -0.1058) .. (1.1187, -0.1058).. controls (1.1218, -0.1058) and (1.1229, -0.1042) .. (1.1229, -0.1013) -- (1.1229, -0.064) -- cycle(1.1266, -0.0466).. controls (1.1295, -0.0466) and (1.1319, -0.0489) .. (1.1319, -0.0519).. controls (1.1319, -0.0548) and (1.1295, -0.0572) .. (1.1266, -0.0572).. controls (1.1237, -0.0572) and (1.1213, -0.0548) .. (1.1213, -0.0519).. controls (1.1216, -0.0489) and (1.124, -0.0466) .. (1.1266, -0.0466) -- cycle;
    \path[fill] (1.1663, -0.0654) -- (1.17, -0.0609) -- (1.1742, -0.0646) -- (1.1705, -0.0691).. controls (1.1732, -0.0722) and (1.175, -0.0765) .. (1.175, -0.0812).. controls (1.175, -0.0918) and (1.1676, -0.0995) .. (1.1573, -0.0995).. controls (1.1538, -0.0995) and (1.1509, -0.0987) .. (1.1486, -0.0974) -- (1.1451, -0.1019) -- (1.1406, -0.0984) -- (1.1441, -0.0939).. controls (1.1411, -0.0908) and (1.1396, -0.0865) .. (1.1396, -0.0815).. controls (1.1396, -0.0709) and (1.147, -0.0632) .. (1.1573, -0.0632).. controls (1.1607, -0.063) and (1.1636, -0.0638) .. (1.1663, -0.0654) -- cycle(1.1491, -0.087) -- (1.1615, -0.0714).. controls (1.1602, -0.0709) and (1.1586, -0.0704) .. (1.1573, -0.0704).. controls (1.1523, -0.0704) and (1.1478, -0.0741) .. (1.1478, -0.0812).. controls (1.1478, -0.0836) and (1.1483, -0.0855) .. (1.1491, -0.087) -- cycle(1.1668, -0.0812).. controls (1.1668, -0.0791) and (1.1663, -0.077) .. (1.1655, -0.0754) -- (1.1531, -0.091).. controls (1.1544, -0.0915) and (1.1557, -0.0918) .. (1.1573, -0.0918).. controls (1.1623, -0.0921) and (1.1668, -0.0884) .. (1.1668, -0.0812) -- cycle;
    \path[fill] (1.1816, -0.0812) -- (1.1816, -0.0741) -- (1.2015, -0.0741) -- (1.2015, -0.0812) -- cycle;
    \path[fill] (1.2584, -0.0812).. controls (1.2584, -0.0918) and (1.251, -0.0995) .. (1.2406, -0.0995).. controls (1.2306, -0.0995) and (1.2229, -0.0918) .. (1.2229, -0.0812).. controls (1.2229, -0.0706) and (1.2303, -0.063) .. (1.2406, -0.063).. controls (1.2507, -0.063) and (1.2584, -0.0706) .. (1.2584, -0.0812) -- cycle(1.2502, -0.0812).. controls (1.2502, -0.0741) and (1.2457, -0.0704) .. (1.2406, -0.0704).. controls (1.2356, -0.0704) and (1.2311, -0.0741) .. (1.2311, -0.0812).. controls (1.2311, -0.0884) and (1.2356, -0.0921) .. (1.2406, -0.0921).. controls (1.2457, -0.0921) and (1.2502, -0.0884) .. (1.2502, -0.0812) -- cycle;
    \path[fill] (1.2721, -0.0982).. controls (1.2726, -0.1024) and (1.2761, -0.1056) .. (1.2806, -0.1056).. controls (1.2869, -0.1056) and (1.2904, -0.1024) .. (1.2904, -0.0953) -- (1.2904, -0.0918).. controls (1.2888, -0.0945) and (1.2853, -0.0968) .. (1.2803, -0.0968).. controls (1.2713, -0.0968) and (1.2644, -0.09) .. (1.2644, -0.0802).. controls (1.2644, -0.0712) and (1.2708, -0.0635) .. (1.2803, -0.0635).. controls (1.2856, -0.0635) and (1.2891, -0.0656) .. (1.2904, -0.0685) -- (1.2904, -0.064) -- (1.2983, -0.064) -- (1.2983, -0.095).. controls (1.2983, -0.1042) and (1.2935, -0.1127) .. (1.2808, -0.1127).. controls (1.2719, -0.1127) and (1.2655, -0.1072) .. (1.2644, -0.1003) -- cycle(1.2906, -0.0802).. controls (1.2906, -0.0743) and (1.2869, -0.0706) .. (1.2819, -0.0706).. controls (1.2766, -0.0706) and (1.2729, -0.0743) .. (1.2729, -0.0802).. controls (1.2729, -0.0863) and (1.2764, -0.09) .. (1.2819, -0.09).. controls (1.2869, -0.0897) and (1.2906, -0.086) .. (1.2906, -0.0802) -- cycle;
    \path[fill] (0.7652, -0.1926) -- (0.7652, -0.1418) -- (0.7731, -0.1418) -- (0.7731, -0.1627).. controls (0.7747, -0.1601) and (0.7787, -0.1577) .. (0.784, -0.1577).. controls (0.7943, -0.1577) and (0.7998, -0.1654) .. (0.7998, -0.1754).. controls (0.7998, -0.1857) and (0.7938, -0.1937) .. (0.7837, -0.1937).. controls (0.7789, -0.1937) and (0.7752, -0.1916) .. (0.7731, -0.1881) -- (0.7731, -0.1926) -- cycle(0.7824, -0.1648).. controls (0.7771, -0.1648) and (0.7731, -0.1688) .. (0.7731, -0.1754).. controls (0.7731, -0.182) and (0.7771, -0.1863) .. (0.7824, -0.1863).. controls (0.7877, -0.1863) and (0.7916, -0.1823) .. (0.7916, -0.1754).. controls (0.7916, -0.1685) and (0.7877, -0.1648) .. (0.7824, -0.1648) -- cycle;
    \path[fill] (0.8125, -0.141).. controls (0.8154, -0.141) and (0.8178, -0.1434) .. (0.8178, -0.1463).. controls (0.8178, -0.1492) and (0.8154, -0.1516) .. (0.8125, -0.1516).. controls (0.8096, -0.1516) and (0.8072, -0.1492) .. (0.8072, -0.1463).. controls (0.8072, -0.1434) and (0.8096, -0.141) .. (0.8125, -0.141) -- cycle(0.8086, -0.1926) -- (0.8086, -0.1585) -- (0.8168, -0.1585) -- (0.8168, -0.1926) -- cycle;
    \path[fill] (0.8607, -0.1754).. controls (0.8607, -0.186) and (0.8533, -0.1937) .. (0.843, -0.1937).. controls (0.8326, -0.1937) and (0.8252, -0.186) .. (0.8252, -0.1754).. controls (0.8252, -0.1648) and (0.8326, -0.1574) .. (0.843, -0.1574).. controls (0.8533, -0.1574) and (0.8607, -0.1651) .. (0.8607, -0.1754) -- cycle(0.8525, -0.1754).. controls (0.8525, -0.1683) and (0.848, -0.1646) .. (0.843, -0.1646).. controls (0.8379, -0.1646) and (0.8334, -0.1683) .. (0.8334, -0.1754).. controls (0.8334, -0.1826) and (0.8379, -0.1863) .. (0.843, -0.1863).. controls (0.848, -0.1865) and (0.8525, -0.1828) .. (0.8525, -0.1754) -- cycle;
    \path[fill] (0.8861, -0.1926) -- (0.8779, -0.1926) -- (0.8639, -0.1585) -- (0.8729, -0.1585) -- (0.8819, -0.1828) -- (0.8906, -0.1585) -- (0.8991, -0.1585) -- cycle;
    \path[fill] (0.9102, -0.141).. controls (0.9131, -0.141) and (0.9155, -0.1434) .. (0.9155, -0.1463).. controls (0.9155, -0.1492) and (0.9131, -0.1516) .. (0.9102, -0.1516).. controls (0.9073, -0.1516) and (0.9049, -0.1492) .. (0.9049, -0.1463).. controls (0.9049, -0.1434) and (0.9073, -0.141) .. (0.9102, -0.141) -- cycle(0.9062, -0.1926) -- (0.9062, -0.1585) -- (0.9144, -0.1585) -- (0.9144, -0.1926) -- cycle;
    \path[fill] (0.9361, -0.1585) -- (0.9432, -0.1585) -- (0.9432, -0.1656) -- (0.9361, -0.1656) -- (0.9361, -0.1815).. controls (0.9361, -0.1844) and (0.9374, -0.1857) .. (0.9403, -0.1857).. controls (0.9414, -0.1857) and (0.9427, -0.1855) .. (0.9432, -0.1855) -- (0.9432, -0.1921).. controls (0.9427, -0.1924) and (0.9411, -0.1929) .. (0.9382, -0.1929).. controls (0.9319, -0.1929) and (0.9279, -0.1892) .. (0.9279, -0.1828) -- (0.9279, -0.1656) -- (0.9215, -0.1656) -- (0.9215, -0.1585) -- (0.9234, -0.1585).. controls (0.9271, -0.1585) and (0.9287, -0.1561) .. (0.9287, -0.1532) -- (0.9287, -0.1482) -- (0.9361, -0.1482) -- cycle;
    \path[fill] (0.9821, -0.1828).. controls (0.9803, -0.1889) and (0.975, -0.1937) .. (0.9668, -0.1937).. controls (0.9575, -0.1937) and (0.9493, -0.1871) .. (0.9493, -0.1754).. controls (0.9493, -0.1646) and (0.9573, -0.1574) .. (0.966, -0.1574).. controls (0.9766, -0.1574) and (0.9827, -0.1643) .. (0.9827, -0.1752).. controls (0.9827, -0.1765) and (0.9827, -0.1775) .. (0.9824, -0.1778) -- (0.9573, -0.1778).. controls (0.9575, -0.1831) and (0.9615, -0.1868) .. (0.9665, -0.1868).. controls (0.9716, -0.1868) and (0.9739, -0.1842) .. (0.975, -0.1807) -- cycle(0.9745, -0.1717).. controls (0.9742, -0.1677) and (0.9716, -0.164) .. (0.966, -0.164).. controls (0.961, -0.164) and (0.9578, -0.168) .. (0.9575, -0.1717) -- cycle;
    \path[fill] (0.9996, -0.1926) -- (0.9914, -0.1926) -- (0.9914, -0.1585) -- (0.9993, -0.1585) -- (0.9993, -0.163).. controls (1.0014, -0.159) and (1.0057, -0.1574) .. (1.0094, -0.1574).. controls (1.0179, -0.1574) and (1.0218, -0.1635) .. (1.0218, -0.1709) -- (1.0218, -0.1926) -- (1.0136, -0.1926) -- (1.0136, -0.1725).. controls (1.0136, -0.1683) and (1.0118, -0.1648) .. (1.0065, -0.1648).. controls (1.0017, -0.1648) and (0.9993, -0.1685) .. (0.9993, -0.173) -- (0.9993, -0.1926) -- cycle;
    \path[fill] (1.0366, -0.1815).. controls (1.0369, -0.1847) and (1.0393, -0.1873) .. (1.0435, -0.1873).. controls (1.047, -0.1873) and (1.0485, -0.1855) .. (1.0485, -0.1834).. controls (1.0485, -0.1815) and (1.0472, -0.1802) .. (1.0446, -0.1797) -- (1.0395, -0.1786).. controls (1.0335, -0.1773) and (1.0303, -0.1733) .. (1.0303, -0.1685).. controls (1.0303, -0.1625) and (1.0358, -0.1574) .. (1.043, -0.1574).. controls (1.0525, -0.1574) and (1.0557, -0.1635) .. (1.0562, -0.167) -- (1.0493, -0.1688).. controls (1.0491, -0.167) and (1.0475, -0.1638) .. (1.043, -0.1638).. controls (1.0401, -0.1638) and (1.038, -0.1656) .. (1.038, -0.1677).. controls (1.038, -0.1696) and (1.0393, -0.1709) .. (1.0414, -0.1712) -- (1.0467, -0.1722).. controls (1.053, -0.1736) and (1.0565, -0.1775) .. (1.0565, -0.1826).. controls (1.0565, -0.1879) and (1.0522, -0.1937) .. (1.0435, -0.1937).. controls (1.0337, -0.1937) and (1.0298, -0.1871) .. (1.0295, -0.1834) -- cycle;
    \path[fill] (1.0835, -0.173) -- (1.0978, -0.1929) -- (1.0877, -0.1929) -- (1.0776, -0.1789) -- (1.0734, -0.1834) -- (1.0734, -0.1929) -- (1.0652, -0.1929) -- (1.0652, -0.1421) -- (1.0734, -0.1421) -- (1.0734, -0.1725) -- (1.0866, -0.1588) -- (1.0975, -0.1588) -- cycle;
    \path[fill] (1.112, -0.173) -- (1.1208, -0.1717).. controls (1.1226, -0.1715) and (1.1234, -0.1704) .. (1.1234, -0.1693).. controls (1.1234, -0.1664) and (1.1216, -0.164) .. (1.1171, -0.164).. controls (1.1128, -0.164) and (1.1105, -0.1667) .. (1.1099, -0.1701) -- (1.1025, -0.1685).. controls (1.103, -0.1627) and (1.1086, -0.1574) .. (1.1168, -0.1574).. controls (1.1274, -0.1574) and (1.1314, -0.1635) .. (1.1314, -0.1701) -- (1.1314, -0.1871).. controls (1.1314, -0.1902) and (1.1316, -0.1921) .. (1.1319, -0.1926) -- (1.1242, -0.1926).. controls (1.1242, -0.1924) and (1.124, -0.191) .. (1.124, -0.1881).. controls (1.1224, -0.1908) and (1.1189, -0.1937) .. (1.1134, -0.1937).. controls (1.1062, -0.1937) and (1.1017, -0.1886) .. (1.1017, -0.1834).. controls (1.1015, -0.1773) and (1.106, -0.1738) .. (1.112, -0.173) -- cycle(1.1232, -0.1786) -- (1.1232, -0.177) -- (1.1142, -0.1783).. controls (1.1118, -0.1789) and (1.1097, -0.1802) .. (1.1097, -0.1831).. controls (1.1097, -0.1855) and (1.1115, -0.1876) .. (1.1147, -0.1876).. controls (1.1192, -0.1873) and (1.1232, -0.1852) .. (1.1232, -0.1786) -- cycle;
    \path[fill] (1.1419, -0.2061) -- (1.1419, -0.1585) -- (1.1499, -0.1585) -- (1.1499, -0.163).. controls (1.1515, -0.1601) and (1.1554, -0.1577) .. (1.1607, -0.1577).. controls (1.1708, -0.1577) and (1.1766, -0.1654) .. (1.1766, -0.1754).. controls (1.1766, -0.1857) and (1.1703, -0.1934) .. (1.1605, -0.1934).. controls (1.1554, -0.1934) and (1.1517, -0.1913) .. (1.1501, -0.1886) -- (1.1501, -0.2058) -- (1.1419, -0.2058) -- cycle(1.1591, -0.1648).. controls (1.1538, -0.1648) and (1.1499, -0.1691) .. (1.1499, -0.1754).. controls (1.1499, -0.182) and (1.1538, -0.1863) .. (1.1591, -0.1863).. controls (1.1644, -0.1863) and (1.1684, -0.182) .. (1.1684, -0.1754).. controls (1.1684, -0.1691) and (1.1647, -0.1648) .. (1.1591, -0.1648) -- cycle;
    \path[fill] (1.2155, -0.1828).. controls (1.2136, -0.1889) and (1.2084, -0.1937) .. (1.2002, -0.1937).. controls (1.1909, -0.1937) and (1.1827, -0.1871) .. (1.1827, -0.1754).. controls (1.1827, -0.1646) and (1.1906, -0.1574) .. (1.1994, -0.1574).. controls (1.2099, -0.1574) and (1.216, -0.1643) .. (1.216, -0.1752).. controls (1.216, -0.1765) and (1.216, -0.1775) .. (1.2158, -0.1778) -- (1.1906, -0.1778).. controls (1.1909, -0.1831) and (1.1949, -0.1868) .. (1.1999, -0.1868).. controls (1.2049, -0.1868) and (1.2073, -0.1842) .. (1.2084, -0.1807) -- cycle(1.2078, -0.1717).. controls (1.2076, -0.1677) and (1.2049, -0.164) .. (1.1994, -0.164).. controls (1.1943, -0.164) and (1.1912, -0.168) .. (1.1909, -0.1717) -- cycle;
    \path[fill] (1.2248, -0.1926) -- (1.2248, -0.1418) -- (1.233, -0.1418) -- (1.233, -0.1926) -- cycle;
    \path[fill] (1.248, -0.141).. controls (1.251, -0.141) and (1.2533, -0.1434) .. (1.2533, -0.1463).. controls (1.2533, -0.1492) and (1.251, -0.1516) .. (1.248, -0.1516).. controls (1.2451, -0.1516) and (1.2427, -0.1492) .. (1.2427, -0.1463).. controls (1.2427, -0.1434) and (1.2454, -0.141) .. (1.248, -0.141) -- cycle(1.2441, -0.1926) -- (1.2441, -0.1585) -- (1.2523, -0.1585) -- (1.2523, -0.1926) -- cycle;
    \path[fill] (1.2687, -0.1926).. controls (1.2692, -0.1969) and (1.2726, -0.2) .. (1.2771, -0.2).. controls (1.2835, -0.2) and (1.2869, -0.1969) .. (1.2869, -0.1897) -- (1.2869, -0.186).. controls (1.2853, -0.1886) and (1.2819, -0.191) .. (1.2769, -0.191).. controls (1.2679, -0.191) and (1.261, -0.1839) .. (1.261, -0.1744).. controls (1.261, -0.1651) and (1.2674, -0.1577) .. (1.2769, -0.1577).. controls (1.2822, -0.1577) and (1.2856, -0.1598) .. (1.2869, -0.1627) -- (1.2869, -0.1585) -- (1.2949, -0.1585) -- (1.2949, -0.1894).. controls (1.2949, -0.1984) and (1.2901, -0.2072) .. (1.2774, -0.2072).. controls (1.2684, -0.2072) and (1.2621, -0.2016) .. (1.261, -0.1947) -- cycle(1.2872, -0.1744).. controls (1.2872, -0.1685) and (1.2835, -0.1648) .. (1.2785, -0.1648).. controls (1.2732, -0.1648) and (1.2695, -0.1685) .. (1.2695, -0.1744).. controls (1.2695, -0.1804) and (1.2729, -0.1842) .. (1.2785, -0.1842).. controls (1.2835, -0.1842) and (1.2872, -0.1804) .. (1.2872, -0.1744) -- cycle;
    \path[fill] (1.3361, -0.1828).. controls (1.3343, -0.1889) and (1.329, -0.1937) .. (1.3208, -0.1937).. controls (1.3115, -0.1937) and (1.3033, -0.1871) .. (1.3033, -0.1754).. controls (1.3033, -0.1646) and (1.3113, -0.1574) .. (1.32, -0.1574).. controls (1.3306, -0.1574) and (1.3367, -0.1643) .. (1.3367, -0.1752).. controls (1.3367, -0.1765) and (1.3367, -0.1775) .. (1.3364, -0.1778) -- (1.3113, -0.1778).. controls (1.3115, -0.1831) and (1.3155, -0.1868) .. (1.3205, -0.1868).. controls (1.3256, -0.1868) and (1.3279, -0.1842) .. (1.329, -0.1807) -- cycle(1.3285, -0.1717).. controls (1.3282, -0.1677) and (1.3256, -0.164) .. (1.32, -0.164).. controls (1.315, -0.164) and (1.3118, -0.168) .. (1.3115, -0.1717) -- cycle;
    \path[fill] (0.7779, -0.2881).. controls (0.7697, -0.2881) and (0.7649, -0.282) .. (0.7649, -0.2746) -- (0.7649, -0.2529) -- (0.7731, -0.2529) -- (0.7731, -0.2731).. controls (0.7731, -0.2773) and (0.775, -0.2807) .. (0.78, -0.2807).. controls (0.7848, -0.2807) and (0.7871, -0.2775) .. (0.7871, -0.2731) -- (0.7871, -0.2529) -- (0.7953, -0.2529) -- (0.7953, -0.281).. controls (0.7953, -0.2839) and (0.7956, -0.286) .. (0.7956, -0.2873) -- (0.7879, -0.2873).. controls (0.7877, -0.2865) and (0.7877, -0.285) .. (0.7877, -0.2836).. controls (0.7858, -0.2863) and (0.7818, -0.2881) .. (0.7779, -0.2881) -- cycle;
    \path[fill] (0.8149, -0.2871) -- (0.8067, -0.2871) -- (0.8067, -0.2529) -- (0.8147, -0.2529) -- (0.8147, -0.2574).. controls (0.8168, -0.2535) and (0.821, -0.2519) .. (0.8247, -0.2519).. controls (0.8332, -0.2519) and (0.8371, -0.258) .. (0.8371, -0.2654) -- (0.8371, -0.2871) -- (0.8289, -0.2871) -- (0.8289, -0.267).. controls (0.8289, -0.2627) and (0.8271, -0.2593) .. (0.8218, -0.2593).. controls (0.817, -0.2593) and (0.8147, -0.263) .. (0.8147, -0.2675) -- (0.8147, -0.2871) -- cycle;
    \path[fill] (0.852, -0.2355).. controls (0.8549, -0.2355) and (0.8573, -0.2379) .. (0.8573, -0.2408).. controls (0.8573, -0.2437) and (0.8549, -0.2461) .. (0.852, -0.2461).. controls (0.849, -0.2461) and (0.8467, -0.2437) .. (0.8467, -0.2408).. controls (0.8467, -0.2379) and (0.849, -0.2355) .. (0.852, -0.2355) -- cycle(0.8477, -0.2871) -- (0.8477, -0.2529) -- (0.8559, -0.2529) -- (0.8559, -0.2871) -- cycle;
    \path[fill] (0.8848, -0.2871) -- (0.8766, -0.2871) -- (0.8625, -0.2529) -- (0.8715, -0.2529) -- (0.8805, -0.2773) -- (0.8893, -0.2529) -- (0.8977, -0.2529) -- cycle;
    \path[fill] (0.9342, -0.2773).. controls (0.9324, -0.2834) and (0.9271, -0.2881) .. (0.9189, -0.2881).. controls (0.9096, -0.2881) and (0.9014, -0.2815) .. (0.9014, -0.2699).. controls (0.9014, -0.259) and (0.9094, -0.2519) .. (0.9181, -0.2519).. controls (0.9287, -0.2519) and (0.9348, -0.2588) .. (0.9348, -0.2696).. controls (0.9348, -0.2709) and (0.9348, -0.272) .. (0.9345, -0.2723) -- (0.9094, -0.2723).. controls (0.9096, -0.2775) and (0.9136, -0.2813) .. (0.9186, -0.2813).. controls (0.9237, -0.2813) and (0.926, -0.2786) .. (0.9271, -0.2752) -- cycle(0.9266, -0.2662).. controls (0.9263, -0.2622) and (0.9237, -0.2585) .. (0.9181, -0.2585).. controls (0.9131, -0.2585) and (0.9099, -0.2625) .. (0.9096, -0.2662) -- cycle;
    \path[fill] (0.9633, -0.2609).. controls (0.9623, -0.2606) and (0.9615, -0.2606) .. (0.9607, -0.2606).. controls (0.9544, -0.2606) and (0.9514, -0.2643) .. (0.9514, -0.2707) -- (0.9514, -0.2871) -- (0.9432, -0.2871) -- (0.9432, -0.2529) -- (0.9512, -0.2529) -- (0.9512, -0.2585).. controls (0.9528, -0.2548) and (0.9565, -0.2527) .. (0.961, -0.2527).. controls (0.962, -0.2527) and (0.9628, -0.2527) .. (0.9631, -0.2529) -- (0.9631, -0.2609) -- cycle;
    \path[fill] (0.9753, -0.2757).. controls (0.9755, -0.2789) and (0.9779, -0.2815) .. (0.9821, -0.2815).. controls (0.9856, -0.2815) and (0.9872, -0.2797) .. (0.9872, -0.2775).. controls (0.9872, -0.2757) and (0.9858, -0.2744) .. (0.9832, -0.2738) -- (0.9782, -0.2728).. controls (0.9721, -0.2715) and (0.9689, -0.2675) .. (0.9689, -0.2627).. controls (0.9689, -0.2566) and (0.9745, -0.2516) .. (0.9816, -0.2516).. controls (0.9911, -0.2516) and (0.9943, -0.2577) .. (0.9948, -0.2611) -- (0.988, -0.263).. controls (0.9877, -0.2611) and (0.9861, -0.258) .. (0.9816, -0.258).. controls (0.9787, -0.258) and (0.9766, -0.2598) .. (0.9766, -0.2619).. controls (0.9766, -0.2638) and (0.9779, -0.2651) .. (0.98, -0.2654) -- (0.9853, -0.2664).. controls (0.9917, -0.2678) and (0.9951, -0.2717) .. (0.9951, -0.2768).. controls (0.9951, -0.282) and (0.9909, -0.2876) .. (0.9821, -0.2876).. controls (0.9723, -0.2876) and (0.9684, -0.2813) .. (0.9681, -0.2773) -- cycle;
    \path[fill] (1.0081, -0.2355).. controls (1.011, -0.2355) and (1.0134, -0.2379) .. (1.0134, -0.2408).. controls (1.0134, -0.2437) and (1.011, -0.2461) .. (1.0081, -0.2461).. controls (1.0052, -0.2461) and (1.0028, -0.2437) .. (1.0028, -0.2408).. controls (1.0028, -0.2379) and (1.0052, -0.2355) .. (1.0081, -0.2355) -- cycle(1.0041, -0.2871) -- (1.0041, -0.2529) -- (1.0123, -0.2529) -- (1.0123, -0.2871) -- cycle;
    \path[fill] (1.034, -0.2529) -- (1.0411, -0.2529) -- (1.0411, -0.2601) -- (1.034, -0.2601) -- (1.034, -0.276).. controls (1.034, -0.2789) and (1.0353, -0.2802) .. (1.0382, -0.2802).. controls (1.0393, -0.2802) and (1.0406, -0.2799) .. (1.0411, -0.2799) -- (1.0411, -0.2865).. controls (1.0406, -0.2868) and (1.039, -0.2876) .. (1.0361, -0.2876).. controls (1.0298, -0.2876) and (1.0258, -0.2839) .. (1.0258, -0.2775) -- (1.0258, -0.2604) -- (1.0194, -0.2604) -- (1.0194, -0.2532) -- (1.0213, -0.2532).. controls (1.025, -0.2532) and (1.0266, -0.2508) .. (1.0266, -0.2479) -- (1.0266, -0.2429) -- (1.034, -0.2429) -- cycle;
    \path[fill] (1.08, -0.2773).. controls (1.0782, -0.2834) and (1.0729, -0.2881) .. (1.0647, -0.2881).. controls (1.0554, -0.2881) and (1.0472, -0.2815) .. (1.0472, -0.2699).. controls (1.0472, -0.259) and (1.0552, -0.2519) .. (1.0639, -0.2519).. controls (1.0745, -0.2519) and (1.0806, -0.2588) .. (1.0806, -0.2696).. controls (1.0806, -0.2709) and (1.0806, -0.272) .. (1.0803, -0.2723) -- (1.0552, -0.2723).. controls (1.0554, -0.2775) and (1.0594, -0.2813) .. (1.0644, -0.2813).. controls (1.0694, -0.2813) and (1.0718, -0.2786) .. (1.0729, -0.2752) -- cycle(1.0724, -0.2662).. controls (1.0721, -0.2622) and (1.0694, -0.2585) .. (1.0639, -0.2585).. controls (1.0589, -0.2585) and (1.0557, -0.2625) .. (1.0554, -0.2662) -- cycle;
    \path[fill] (1.0996, -0.2529) -- (1.1068, -0.2529) -- (1.1068, -0.2601) -- (1.0996, -0.2601) -- (1.0996, -0.276).. controls (1.0996, -0.2789) and (1.1009, -0.2802) .. (1.1038, -0.2802).. controls (1.1049, -0.2802) and (1.1062, -0.2799) .. (1.1068, -0.2799) -- (1.1068, -0.2865).. controls (1.1062, -0.2868) and (1.1046, -0.2876) .. (1.1017, -0.2876).. controls (1.0954, -0.2876) and (1.0914, -0.2839) .. (1.0914, -0.2775) -- (1.0914, -0.2604) -- (1.0851, -0.2604) -- (1.0851, -0.2532) -- (1.0869, -0.2532).. controls (1.0906, -0.2532) and (1.0922, -0.2508) .. (1.0922, -0.2479) -- (1.0922, -0.2429) -- (1.0996, -0.2429) -- cycle;
  \end{scope}
\end{tikzpicture}
}

\endinput
%%
%% End of file `NMBU.cls'.
