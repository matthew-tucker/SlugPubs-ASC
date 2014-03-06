%%
%% This is file `slugpubs-asc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% slugpubs-asc.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2010 by Matthew A. Tucker
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 or this license or (at your option) any later
%% version.  The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{slugpubs-asc}
[2010/10/01 v1.0 Class for SlugPubs *ASC Publications, by Matthew A. Tucker]

%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\RequirePackage{ifthen}
\RequirePackage{atbeginend}

\newboolean{hyphenate}
\setboolean{hyphenate}{true}
\newboolean{nopagenums}
\setboolean{nopagenums}{false}
\newboolean{times}
\setboolean{times}{true}
\newboolean{twosided}
\setboolean{twosided}{true}

\DeclareOption{notwoside}{\setboolean{twosided}{false}}
\DeclareOption{nohyphenate}{\setboolean{hyphenate}{false}}
\DeclareOption{pagenums}{\setboolean{nopagenums}{false}}
\DeclareOption{notimes}{\setboolean{times}{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions \relax

\ifthenelse{\boolean{twosided}}%
{\LoadClass[letterpaper,11pt,twoside,draft]{article}}%
{\LoadClass[letterpaper,11pt,draft]{article}}

\RequirePackage%
[letterpaper,left=1.0in,right=1.0in,top=1.0in,bottom=1.0in,foot=0.75in]%
{geometry}

\ifthenelse{\boolean{times}}
{\RequirePackage{txfonts}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage[T1]{tipa}}
{\RequirePackage[T1]{fontenc}
\RequirePackage[T1]{tipa}}

\RequirePackage{fancyhdr}
\RequirePackage{abstract}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage[title]{appendix}
\RequirePackage[longnamesfirst]{natbib}
\RequirePackage[labelfont=bf]{caption}
\RequirePackage{multicol}

\newboolean{haveAuthor}
\newboolean{haveTitle}
\setboolean{haveTitle}{false}
\newboolean{haveSubTitle}
\newboolean{haveInstitution}
\setboolean{haveInstitution}{false}

\newboolean{twoAuthor}
\setboolean{twoAuthor}{false}

\renewcommand{\author}[1]%
{\gdef\@slugauthor{#1}\gdef\@author{#1}\setboolean{haveAuthor}{true}}

\newcommand{\institution}[1]%
{\gdef\@institution{#1}\setboolean{haveInstitution}{true}}

\renewcommand{\title}[1]%
{\gdef\@slugtitle{#1}\gdef\@title{#1}\setboolean{haveTitle}{true}}

\newcommand{\subtitle}[1]%
{\gdef\@slugsubtitle{#1}\setboolean{haveSubTitle}{true}}

\newboolean{hasackfn}
\setboolean{hasackfn}{false}

\newcommand{\ackfn}[1]{\gdef\@ckfn{#1}\setboolean{hasackfn}{true}}
\renewcommand{\thanks}[1]{\ackfn{#1}}%
\newcommand\theackfn%
{\def\thefootnote{\fnsymbol{footnote}}\footnote[1]{\@ckfn}}

\newcommand{\authorone}[1]%
{\gdef\@slugauthorone{#1}\setboolean{twoAuthor}{true}}

\newcommand{\authortwo}[1]%
{\gdef\@slugauthortwo{#1}\setboolean{twoAuthor}{true}}

\newcommand{\institutionone}[1]{\gdef\@institutionone{#1}}
\newcommand{\institutiontwo}[1]{\gdef\@institutiontwo{#1}}

\setlength{\multicolsep}{0.0pt}

\renewcommand{\maketitle}{%
\thispagestyle{empty}

\begin{center}
  \ifthenelse{\boolean{haveTitle}}{
         \fontsize{24pt}{24pt}
         \selectfont
         \textsc{\@title}\ifthenelse{\boolean{haveSubTitle}}
{:\\\vspace{18pt}}{\ifthenelse{\boolean{hasackfn}}
{\theackfn}{}\\\vspace{12pt}}
         \normalsize
     }{}

\ifthenelse{\boolean{haveSubTitle}}{
\fontsize{18pt}{18pt}
\selectfont
\textsc{\@slugsubtitle}\ifthenelse{\boolean{hasackfn}}{\theackfn}{}\\
\vspace{12pt}
}{}

\ifthenelse{\boolean{haveAuthor}}{
     \fontsize{12pt}{12pt}
     \selectfont
     \textsc{\@author}
     \normalsize
     \selectfont
}{}

\ifthenelse{\boolean{haveInstitution}}{
     \normalsize
     \selectfont
     \textit{\@institution}
\vspace{12pt}
}{}

\ifthenelse{\boolean{twoAuthor}}{
\begin{multicols}{2}
\fontsize{12pt}{12pt}
\selectfont
\textsc{\@slugauthorone}\\
\normalsize
\selectfont
\textit{\@institutionone}\\
\columnbreak

\fontsize{12pt}{12pt}
\selectfont
\textsc{\@slugauthortwo}\\
\normalsize
\selectfont
\textit{\@institutiontwo}
\end{multicols}
\vspace{6pt}
\author{\@slugauthorone\ \& \@slugauthortwo}
\vspace{6pt}
}{}

    \end{center}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
\fancyhead{}
\fancyhead[OC]{\fontsize{10pt}{10pt}\selectfont\rm\@title}
\fancyhead[EC]{\fontsize{10pt}{10pt}\selectfont\rm\@author}
\fancyfoot{}
\ifthenelse{\boolean{nopagenums}}{}{\fancyfoot[C]{\thepage}}
}

\ifthenelse{\boolean{hyphenate}}{}{
    \hyphenpenalty=5000
    \tolerance=1000
}

\widowpenalty=15999
\clubpenalty=15999
\raggedbottom

\parindent=0.50in

\renewcommand{\@makefntext}[1]%
{\noindent\makebox[1.8em][r]%
{\fontsize{9pt}{9pt}\selectfont\@makefnmark}%
\fontsize{9}{9}\selectfont #1}

\renewcommand\footnoterule%
{\vspace*{-3pt}\hrule width 2in height 0.5pt \vspace*{2.5pt}}

\setlength{\abovecaptionskip}{12pt}
\setlength{\belowcaptionskip}{-5pt}

\titlelabel{\thetitle\ }
\titleformat*{\section}{\fontsize{14pt}{14pt}\bf}
\titleformat*{\subsection}{\fontsize{12pt}{12pt}\itshape}
\titleformat*{\subsubsection}{\fontsize{12pt}{12pt}\rm}
\titlespacing{\section}{0pt}{18pt}{12pt}
\titlespacing{\subsection}{0pt}{18pt}{12pt}
\titlespacing{\subsubsection}{0pt}{18pt}{12pt}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
\fancyhead{}
\fancyhead[OC]{\fontsize{10pt}{10pt}\selectfont\rm\@title}
\fancyhead[EC]{\fontsize{10pt}{10pt}\selectfont\rm\@author}
\fancyfoot{}
\ifthenelse{\boolean{nopagenums}}{}{\fancyfoot[C]{\thepage}}

\renewcommand\appendixname{Appendix\ }

\setlength{\bibhang}{0.25in}

\bibpunct[:]{(}{)}{;}{a}{,}{;}
\setlength{\bibsep}{0.0pt}
\bibliographystyle{linquiry2}
\newcommand{\keywords}[1]%
{\vspace{12pt}\par\noindent\textbf{Keywords: }\normalfont\rm #1}

\setlength{\absleftindent}{1in}
\setlength{\absrightindent}{1in}
\renewcommand\abstractname{}
\renewcommand\abslabeldelim{}
\setlength\abstitleskip{-3em}
\AfterBegin{abstract}%
{\fontsize{9pt}{9pt}\selectfont\noindent\hspace{-0.3em}}

\endinput
%%
%% End of file `slugpubs-asc.cls'.
