%% This is file `infor.cls'.
%%
%% LaTeX 2e class file for articles in info journal published by VTeX.
%%
%% Macros written by VTeX Ltd., Lithuania
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% Copyright 2020 by VTEX UAB
%%
%% You are free to use this class file as you see fit, provided
%% that you do not make changes to the file.
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.3 or (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{infor}[2020/04/05 v0.0.00 Informatica Journal class]
\def\fmt@name{infor}

\RequirePackage{etoolbox}

\PassOptionsToClass{twoside,fleqn}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

\RequirePackage[T1]{fontenc}
\usepackage{textcomp}
\LoadClass{article}
\let\CRC\relax
\let\xch\@gobble
\def\nohyphen{\pretolerance=\@M \tolerance=\@M \hyphenpenalty=\@M \exhyphenpenalty=\@M}


\InputIfFileExists{infor.cfg}{}{}

\def\@journal{Informatica}
\def\@journalabbrev{Informatica}
\def\@journal@url{https://informatica.vu.lt/journal/INFORMATICA}
\def\@JOURNAL{INFORMATICA}
\def\@jid{infor}
\def\@JID{INFOR}

%************************* FONTS
\def\@xivpt{14}
\def\@xviipt{17}
\def\@xviiipt{18}
\def\@xxpt{20}
\def\@xxivpt{24}

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{13pt plus .1pt minus .5pt}%
   \abovedisplayskip 12\p@ \@plus2\p@ \@minus2\p@%
   \abovedisplayshortskip 6\p@ \@plus2\p@%
   \belowdisplayshortskip 6\p@ \@plus2\p@%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\small{%
   \@setfontsize\small\@ixpt{11\p@ plus .2\p@ minus .2\p@}%
   \abovedisplayskip 11\p@ \@plus2\p@
   \abovedisplayshortskip 6\p@ \@plus2\p@%
   \belowdisplayshortskip 6\p@ \@plus2\p@%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{10\p@ plus .1pt minus .1pt}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus2\p@
   \abovedisplayshortskip 5\p@ \@plus2\p@%
   \belowdisplayshortskip 5\p@ \@plus2\p@%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{16}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{26}}
\renewcommand\Huge{\@setfontsize\Huge\@xxivpt{26}}

% Customization of fonts
\RequirePackage{tgheros}
\RequirePackage{tgtermes}
\renewcommand{\ttdefault}{pcr}
\normalfont\normalsize
\renewcommand\sldefault{it}
\renewcommand\bfdefault{b}
\let\slshape\itshape

\def\doiprefix#1{\gdef\doi@prefix{#1}}
\def\doi@prefix{DOI:~}
\@ifundefined{doi@base}{\def\doi@base{https://doi.org/}}{}
\def\print@doi{\doi@prefix\href{\doi@base\@doi}{\doi@base\@doi}}
\def\@ppages{\@firstpage--\@lastpage}
\def\print@volume{\@journal\space\@volume\space (\@issue) (\@pubyear) \@ppages}

\csdef{@volume}{0}
\csdef{@pubyear}{0000}
\csdef{@@ppages}{\empty}
\csdef{@firstpage}{0}
\csdef{@lastpage}{0}
\csdef{@doi}{\empty}
\def\doc@stage{300}

\def\volume#1{\gdef\@volume{#1}}
\def\issue#1{\gdef\@issue{#1}}
\def\pubyear#1{\gdef\@pubyear{#1}}
\def\firstpage#1{\gdef\@firstpage{#1}\setcounter{page}{#1}}
\def\lastpage#1{\gdef\@lastpage{#1}}
\def\doi#1{\gdef\@doi{#1}}

\def\logo@vtex{info-logo-vtex}
\def\includevtexlogo{\null}
\def\@vtex@url{http://www.vtex.lt/en/}

\newif\if@open@access \global\@open@accesstrue
\def\cclicense@link{http://creativecommons.org/licenses/by/4.0/}
\def\@openaccess{Open access article under the \href{\cclicense@link}{CC BY} license.}
\def\copyright@statement{\lower5pc\hbox{\parbox{\textwidth}{\color[gray]{.7}\texttt{Preprint submitted to VTeX / Modern Stochastics: Theory and Applications\linebreak<\today>}}}}
\def\copyright@line{\@copyright@fmt{\copyright@statement}}
\def\@copyright@fmt#1{\vbox to0pt{\vskip-4.6pc\noindent\hbox{\footnotesize #1\hfill}\vss}}
\def\nocopyrightline{\gdef\copyright@line{\@copyright@fmt{}}}
\def\credit@line{\@credit@fmt{\@credit}}
\def\@credit@fmt#1{{\parindent0pt#1}}
\def\@credit{%
  \vbox to 0pt{%
    \vskip-1.85pc
    \hskip-\textwidth
    \noindent
    \raise4mm\hbox to \textwidth{%
      \footnotesize
      \href{\@journal@url}{www.info.org}%
      \hfill
      \href{\@vtex@url}{\includevtexlogo}%
      }%
    }%
  }

\let\@received\@empty
\let\@revised\@empty
\let\@accepted\@empty
\let\@publishedonline\@empty
\def\received#1{\gdef\@received{{Received:~\hbox{#1}}}}
\def\revised#1{\gdef\@revised{{Revised:~\hbox{#1}}}}
\def\accepted#1{\gdef\@accepted{{Accepted:~\hbox{#1}}}}
\def\publishedonline#1{\gdef\@publishedonline{{Published~online:~\hbox{#1}}}}
\def\print@history{%
  \def\sep{\def\sep{, \allowbreak}}% 
  \ifx\@received\@empty\else\sep\@received\fi%
  \ifx\@revised\@empty\else\sep\@revised\fi%
  \ifx\@accepted\@empty\else\sep\@accepted\fi%
  \ifx\@publishedonline\@empty\else\sep\@publishedonline\fi%
  }

%************************** MATH SETTINGS
\DeclareMathSizes{5}     {6}   {6}  {6}
\DeclareMathSizes{6}     {6}   {6}  {6}
\DeclareMathSizes{7}     {6.8} {6}  {6}
\DeclareMathSizes{8}     {8}   {6.8}{6}
\DeclareMathSizes{9}     {9}   {7.6}{6}
\DeclareMathSizes{10}   {10}   {7.6}{6}
\DeclareMathSizes{10.95}{10.95}{7.6}{6}
\DeclareMathSizes{12}   {12}   {9}  {7}
\DeclareMathSizes{14.4} {14.4} {10} {8}
\DeclareMathSizes{17.28}{17.28}{12} {9}
\DeclareMathSizes{20.74}{20.74}{14.4}{10}
\DeclareMathSizes{24.88}{24.88}{17.28}{12}

\DeclareTextSymbolDefault{\textbullet}{OMS}
\DeclareTextSymbol{\textbullet}{OMS}{15}  

\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}
% fix accents
\def\accentclass@{0}

\newcommand\hmmax{0}
\newcommand\bmmax{1}
\RequirePackage{bm}

\setlength\@mathmargin{2em}
\mathindent=\@mathmargin
\setlength\arraycolsep{2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins=\skip\footins
\preto\eqnarray{\topsep=\the\abovedisplayskip}

\RequirePackage{amssymb}

\let\kernel@bordmatrix@left(                                       
\let\kernel@bordmatrix@right)
\def\kernel@bordermatrix#1{%
    \begingroup 
        \m@th \@tempdima 8.75\p@
        \setbox\z@\vbox{%
            \def\cr{\crcr\noalign{\kern2\p@\global\let\cr\endline}}%
            \ialign{$##$\hfil\kern2\p@\kern\@tempdima&\thinspace\hfil$##$\hfil
  	        &&\quad\hfil$##$\hfil\crcr
                \omit\strut\hfil\crcr\noalign{\kern-\baselineskip}%
	        #1\crcr\omit\strut\cr
                }%
            }%
        \setbox\tw@\vbox{\unvcopy\z@\global\setbox\@ne\lastbox}%
        \setbox\tw@\hbox{\unhbox\@ne\unskip\global\setbox\@ne\lastbox}%
        \setbox\tw@\hbox{$\kern\wd\@ne\kern-\@tempdima
            \left\kernel@bordmatrix@left\kern-\wd\@ne
            \global\setbox\@ne\vbox{\box\@ne\kern2\p@}%
            \vcenter{\kern-\ht\@ne\unvbox\z@\kern-\baselineskip}
            \,\right\kernel@bordmatrix@right$%
            }%
        \null\;\vbox{\kern\ht\@ne\box\tw@}%
    \endgroup
    }
\def\set@bordermatrix@braces#1#2{%
    \let\kernel@bordmatrix@left#1\relax
    \let\kernel@bordmatrix@right#2\relax
    \kernel@bordermatrix
    }
\def\bordermatrix#1#{%
    \ifx\relax#1\relax
        \expandafter\kernel@bordermatrix
    \else
        \expandafter\set@bordermatrix@braces
    \fi#1%
    }

\AtBeginDocument{%
  \def\tfrac#1#2{{\textstyle\frac{#1}{#2}}}%
  \def\dfrac#1#2{{\displaystyle\frac{#1}{#2}}}%
  }%
\def\dvt{\colon\ }
\def\dvtx{\nobreak\,\colon\relax}
%
\let\ge\geqslant
\let\geq\geqslant
\let\le\leqslant
\let\leq\leqslant

% *********** THEOREMS
\RequirePackage{amsthm}

\ifdefined\theorempreskipamount\else \newskip\theorempreskipamount\fi
\ifdefined\theorempostskipamount\else \newskip\theorempostskipamount\fi
\setlength\theorempreskipamount{12\p@ \@plus 2\p@ \@minus 1\p@}
\setlength\theorempostskipamount{12\p@ \@plus 2\p@ \@minus 1\p@}
\thm@headsep=5em
\let\thm@head@dot@font\empty

\def\thmhead@plain #1#2#3{%
  \thmname {#1}%
  \thmnumber {\@ifnotempty {#1}{ }\@upn {#2}}%
  \thmnote { {\gdef\thm@head@dot@font{\rm}\the \thm@notefont {\rm (}#3{\rm )}}}%
  }

\def\normal@cite@font{%
  \def\@safe@activesfalse{\normalfont}%
  \preto\NAT@open{\normalfont}}
  
\newtheoremstyle{proclaim}           % name
  {\theorempreskipamount}            % Space above
  {\theorempostskipamount}           % Space below
  {\leftmargin=\labelwidth 
    \thm@notefont={\normalfont
      % cite in theorem head should be in roman font
      \normal@cite@font
      \itshape\mathversion{normal}}% thm section title font
   \normalfont}   % Body font
  {}                                 % Indent amount
  {\scshape}      % Theorem head font
  {.}                                % Punctuation after theorem head
  {.5em}                             % Space after theorem head
  {}                                 % Theorem head (thmhead) spec

\newtheoremstyle{plain}        % name
  {\theorempreskipamount}      % Space above
  {\theorempostskipamount}     % Space below
  {\itshape\thm@notefont={\normalfont\mathversion{normal}}}% Body font / thm style overriding
  {}                           % Indent amount
  {\bfseries\mathversion{bold}}% Theorem head font
  {{\thm@head@dot@font .}\global\let\thm@head@dot@font\empty }                          % Punctuation after theorem head
  {.5em}                       % Space after theorem head
  {}                           % Theorem head (thmhead) spec

\let\old@newtheorem\newtheorem
\def\newproclaim{%
  \def\newtheorem{\theoremstyle{plain}\old@newtheorem}%
  \theoremstyle{proclaim}\old@newtheorem}
\def\thethm{\@arabic\c@thm}

\def\settheoremstyle#1#2{%
  %% redefines theorem styles
  \expandafter\expandafter\expandafter
    \let\expandafter\expandafter\csname th@#1\endcsname\csname th@#2\endcsname
  }
\settheoremstyle{definition}{proclaim}
\settheoremstyle{remark}{proclaim}

\renewenvironment{proof}[1][\proofname]%
  {%
    \par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item[\hskip\labelsep
          \textit{#1\@addpunct{.}}]%
    \ignorespaces
  }{%
    \popQED
    \endtrivlist
    \@endpefalse
  }%

% ********************* DIMENSIONS:
% TEXT DIMENSIONS
\setlength\parindent    {14pt}
\setlength\columnsep    {2pc}
\setlength\columnwidth  {18pc}
\setlength\columnseprule{0\p@}

% HEADS:
\setlength\headheight{12\p@}
\setlength\headsep   {13\p@}
\setlength\topskip   {10\p@}
\setlength\footskip  {24\p@}
\setlength\maxdepth  {.5\topskip}


% TEXT PARAMETERS
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}


% BREAKS
\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{12\p@ \@plus 2\p@ \@minus 1\p@}
\setlength\bigskipamount{24\p@ \@plus 3\p@ \@minus 2\p@}

% PAGE-BREAKING PENALTIES
\clubpenalty=4000
\widowpenalty=4000
\displaywidowpenalty=50
\predisplaypenalty=10000   % Breaking before a math display.
\tolerance=1600
\hbadness=1600
\emergencystretch=3\p@
\hfuzz=1\p@           % do not be to critical about boxes

% FOOTNOTES
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{24\p@ \@plus 6\p@}

% FRAMED BOXES
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\voffset=-1in
\hoffset=-1in
\RequirePackage{geometry}
\geometry{%
  twoside,
  paperwidth=170mm,
  paperheight=240mm,
  textheight=556\p@,
  textwidth=29.5pc,
  top=51pt
  }

% SIDE MARGINS
\setlength\oddsidemargin   {20mm}
\setlength\evensidemargin  {25mm}
\setlength\topmargin       {36pt}

\RequirePackage{rotating}
\RequirePackage{graphicx}
\RequirePackage{array}

\ifdefined\HCode
\else
  \AtBeginDocument{%
    \let\Mathop\mathop
    \let\Mathord\mathord
    \let\Mathrel\mathrel
    \let\Mathbin\mathbin
    \let\Mathopen\mathopen
    \let\Mathclose\mathclose
    \let\Mathpunct\mathpunct
    }%
\fi

\renewcommand{\ttdefault}{pcr}%

\RequirePackage{textcomp}
\normalfont\normalsize

% LT language TeX Gyre:
 \AtBeginDocument{\def\ltfamily{qtm}}


%% frontmatter
\newif\iflongmktitle \longmktitlefalse
\def\@@@Label#1{%
  \@bsphack
  \protected@write\@auxout{}{\string\Newlabel{#1}{\@currentlabel}}%
  \@esphack
  }
\def\Newlabel#1#2{%
  \expandafter\gdef\csname X@#1\endcsname{#2}%
  }
\def\@@@Ref#1{%
  \@ifundefined{X@#1}
    {0}
    {\csname X@#1\endcsname}%
  }
\RequirePackage{pifont}

\newcommand\abstract@fmt[1]{\textbf{#1\abstract@name@skip}}
\newcommand\abstract@name{Abstract}
\newcommand\abstract@name@skip{.\space}
\newbox\absbox
\renewenvironment{abstract}
  {%
    \global\setbox\absbox=\vbox\bgroup
    \hsize=\textwidth\def\baselinestretch{1}%
    \small
    \noindent\unskip\abstract@fmt{\abstract@name}%
    \ignorespaces
  }{%
    \par
    \egroup
  }

\def\keywords@prefixsep{:\space}
\newcount\keyboxcnt
\newenvironment{keywords}[1][]%
  {%
    \expandafter\newsavebox\csname keybox#1\endcsname
    \@ifundefined{keybox@list}
      {%
        \csxdef{keybox@list}{keybox#1}%
      }{%
        \csxappto{keybox@list}{,keybox#1}%
      }%
    \def\@tempa{#1}%
    \def\PACS@name{PACS}%
    \def\JEL@name{JEL}%
    \def\MSC@MMX@name{MSC2010}%
    \ifx\@tempa\@empty
      \def\keywords@prefix{\textbf{Key words\keywords@prefixsep}}%
    \else
      \ifx\@tempa\PACS@name
        \def\keywords@prefix{\it PACS\keywords@prefixsep}%
      \else
        \ifx\@tempa\JEL@name
          \def\keywords@prefix{\textbf{JEL~classification}\keywords@prefixsep}%
        \else
          \ifx\@tempa\MSC@MMX@name
            \def\keywords@prefix{\textbf{2010~MSC}\keywords@prefixsep}%
            \def\MSC@active@keywords{1}%
          \else
            \def\keywords@prefix{\textbf{#1~MSC}\keywords@prefixsep}%
            \def\msc@tempa{2010}%
            \ifx\@tempa\msc@tempa
              \def\MSC@active@keywords{1}%
            \fi
          \fi
        \fi
      \fi
    \fi
    \@firstkwdtrue
    \global\advance\keyboxcnt\@ne
    \global\expandafter\setbox\csname keybox#1\endcsname=\vbox\bgroup
      \hsize=\textwidth
      \normalsize\normalfont
      \def\baselinestretch{1}%
      \small
      \parskip\z@
      % 10pt between abstract/keyword boxes and baselineskip + 2pt between keyword baselines
      \ifdefined\first@keyword@env
        \prevdepth\z@
        \vskip2pt
      \fi
      \noindent{\keywords@prefix}%
      \raggedright % Keywords are not justified.
      \ignorespaces
  }{%
      .\par
    \egroup
    \gdef\first@keyword@env{1}%
  }

\newif\if@firstkwd
\def\kwd@sep{\unskip, }%
\def\msc@hrefprefix{http://www.ams.org/msc/msc2010.html?s=}
\newcommand\kwd[2][]{%
  \bgroup
    \def\@tempa{#1}%
    \if@firstkwd
      \global\@firstkwdfalse
      \let\kwd@sep\@empty
    \fi
    \ifx\@tempa\@empty
      \kwd@sep
    \else
      \@tempa
    \fi
    \ifdefined\MSC@active@keywords
      \href{\msc@hrefprefix #2}{#2}%
    \else
      #2%
    \fi
  \egroup
  \ignorespaces
  }

\newdimen\Columnwidth
\Columnwidth=\columnwidth

\def\printWarning{%
  \mbox{}\par\vfill\par
  \bgroup
    \fboxsep=12pt
    \fboxrule=1pt
    \hspace*{.18\textwidth}%
    \fcolorbox{gray50}{gray10}{\box\warnbox}%
  \egroup
  \par\vfill\thispagestyle{empty}%
  \setcounter{page}{0}%
  \clearpage
  }

\long\def\finalMaketitle{%
  \thispagestyle{copyright}%
  \MaketitleBox
  }

\def\output@frontmatter@authors{%
  \def\do##1{%
    \author@fmt{\the\c@author}{\csuse{##1t@loc@notes}}{\author@sep\csuse{##1}}%
    \def\author@sep{\unskip,\space}%
    }%
  \front@author@defs 
  \expandafter\docsvlist\expandafter{\author@list}%
  \par
  }

\def\validate@frontmatter@authors{%
  \def\do##1{%
    \setbox\@tempboxa=\hbox{%
      \let\bio\@gobble
      \let\degs\@gobble
      \let\prefix\@gobble
      \let\inits\@gobble
      \let\fnms\@gobble
      \let\snm\@gobble
      \let\suffix\@gobble
      \let\roles\@gobble
      \def\thanks##1##{\@gobble}%
      \def\thanksref##1##{\@gobble}%
      \let\thankstext\@gobble
      \def\ead####1####{\global\stepcounter{countead}}%
      \csname ##1\endcsname}%
    }%
  \expandafter\docsvlist\expandafter{\author@list}%
  }

\def\output@publishedonline{%
  \ifx\@empty\@publishedonline
  \else
    \publishedonline@prefix\hbox{\@publishedonline}\publishedonline@postfix
    \@historytrue
  \fi
  }

\AtBeginDocument{\csname \@articletype @articletype@control\endcsname}

\def\printaug{%
  \begin{flushright}
    \def\do##1{\csuse{##1}\\}%
    \expandafter\docsvlist\expandafter{\author@list}%
  \end{flushright}
  }

\ifdefined\HCode
  \let\printaug\relax
\else
  \def\editorial@articletype@control{%
    \let\output@frontmatter@authors\validate@frontmatter@authors
    \let\output@publishedonline\relax
    }
  \def\other@articletype@control{%
    \let\output@publishedonline\relax
    \gdef\author@list{}%
    \nocopyrightline
    }
\fi

\def\@articletypesize{\large}
\def\pretitle@size{\large\bfseries}
\def\title@font{\LARGE}
\def\subtitle@font{\Large}
\def\authors@size{\large}
\def\abstract@size{\small}
\def\address@size{\small\itshape}

\def\address@list{}
\def\title@preskip{13pt}
\def\title@afterskip{12pt}
\def\subtitle@afterskip{12pt}
\let\author@sep\relax
\def\editorial@word{editorial}
\long\def\MaketitleBox{%
  \def\baselinestretch{1}%
  \bgroup
    \parindent=\z@
    \raggedright
    \def\baselinestretch{1}%
    \null
    \vskip\title@preskip
    \title@fmt{\@title}{\csuse{title@t@loc@notes}}%
    \vskip\title@afterskip
    \ifdefined\@subtitle
      \subtitle@fmt{\@subtitle}{\csuse{subtitle@t@loc@notes}}%
      \par
      \vskip\subtitle@afterskip
    \fi
    \output@frontmatter@authors
    \ifx\@articletype\editorial@word
    \else
      \par
      \vskip 1pt
      \def\do##1{%
        \address@fmt{\csuse{##1@counter}}{\csuse{##1t@loc@notes}}{\csuse{##1}}%
        }%
      \expandafter\docsvlist\expandafter{\address@list}%
      \par
      %%\output@glob@notes
      \output@frontmatter@emails
      \par
      \vskip\history@skip
      \output@frontmatter@history
    \fi
  \egroup  
  \par
  \vskip11pt
  \ifdefined\@dedicated
    \unskip\vskip9.5pt
    \dedicated@fmt{\@dedicated}%
    \par\vskip15pt
  \fi
  \ifvoid\absbox
  \else
    \vskip7pt
    \unvbox\absbox
    \par
    \vskip6pt
  \fi
  \ifdefined\keybox@list
    \newdimen\saveboxdepth
    \count@=\z@
    \def\do##1{%
      \saveboxdepth=\expandafter\dp\csname##1\endcsname
      \expandafter\unvbox\expandafter\csname ##1\endcsname
      \advance\count@\@ne
      % depth is 0 for all keyword boxes except the last one
      \ifnum\count@=\keyboxcnt
        \prevdepth=\the\saveboxdepth
      \else
        \addvspace{-\the\saveboxdepth}%
      \fi
      }%
    \expandafter\docsvlist\expandafter{\keybox@list}%
    % \par
  \fi
  }

\def\endfrontmater@skip{24pt plus6pt minus6pt}

\def\FNtext#1{\par\bgroup\footnotesize#1\egroup}
\newdimen\space@left
\def\alarm#1{%
  \typeout{******************************}%
  \typeout{#1}%
  \typeout{******************************}%
  }
\long\def\getSpaceLeft{%
  \global\setbox0=\vbox{\hsize=\textwidth\MaketitleBox}%
  \global\setbox1=\vbox{\hsize=\textwidth
  \let\footnotetext\FNtext
  \printFirstPageNotes}%
  \xdef\noteheight{\the\ht1}%
  \xdef\titleheight{\the\ht0}%
  \@tempdima=\vsize
  \advance\@tempdima-\noteheight
  \advance\@tempdima-1\baselineskip
  }
  
\newbox\@@@@boxa
\newbox\@@@@boxb
\def\maketitle{%
  \iflongmktitle\getSpaceLeft
    \global\setbox\@@@@boxa=\vsplit0 to \@tempdima
    \box\@@@@boxa\par\resetTitleCounters
    \thispagestyle{copyright}%
    \printFirstPageNotes
    \box0%
  \else
    \finalMaketitle
  \fi
  }%

\def\ps@copyright{%
  \def\@oddhead{%
    \parbox[t]{\textwidth}{%
      \bgroup
        \normalfont\fontsize{8}{10}\selectfont
        \noindent
        \print@volume\\[-1.075pt]
        \print@doi
      \egroup
      \vskip6pt
      \hrule width\hsize
      }%
    }%
  \let\@evenhead\@oddhead
  \def\@oddfoot{\copyright@line\credit@line}%
  \let\@evenfoot\@oddfoot
  }

\def\etal{et al.}

% Normal RH
%
% </running headline auto format support>
%
\def\check@head@line{%
  \bgroup
      \settowidth\@tempdima{\pseudo@head@line}%
      \ifdim\@tempdima<\textwidth\relax
      \else
        \@latex@error{headline too long, reassign it with runtitle!}{}%
        \global\let\check@head@line\relax
      \fi
  \egroup
  }

\def\ps@headings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\small\rlap{\thepage}\hfill\textit{\leftmark}\hfill}%
  \def\pseudo@head@line{{%
      \small
      \hfil{\itshape\rightmark}\hfil
      \hbox{\quad \thepage}}%
      }%
  \def\@oddhead{%
    \csname check@head@line\endcsname
    \setbox\@tempboxa=\hbox{\quad \small \thepage}%
    \hb@xt@\textwidth{\hss\small\hbox to \wd\@tempboxa{\null}%
      \hfill{\itshape\rightmark}\hfill%
      \box\@tempboxa
      }%
    }%
  \def\rightmark{\@runtitle}%
  \def\leftmark{\@runauthor}%
  }
  
% Empty RH
\def\ps@empty{\let\@mkboth\@gobbletwo
  \def\@oddhead{\hfill}\def\@oddfoot{} 
  \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

% RH  with page number in a foot
\def\ps@plain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\hfill}\def\@oddfoot{}
  \let\@evenhead\@oddhead
  \def\@oddfoot{\hfill\small\thepage\hfill}
  \let\@evenfoot\@oddfoot
  }

% COVER RH
\def\ps@cover{%
      \def\@oddfoot{\parbox[b]{\textwidth}{
      \fontsize{12}{14}\sffamily\cover@copyright}}
      \let\@evenfoot\@empty
      \def\@evenhead{\hfill}%
      \def\@oddhead{\hfill\fontsize{11}{11}\sffamily\bfseries\makebox[24mm][l]{ISSN \@issn}}%
}%

% TITLE PAGE RH
\def\ps@titlepage{%
      \let\@oddfoot\@empty
      \let\@evenfoot\@empty
      \def\@evenhead{\hfill}%
      \def\@oddhead{\hfill\fontsize{11}{11}\sffamily\bfseries ISSN \@issn}%
}%

% Copyright RH
\def\ps@copyright{\let\@mkboth\@gobbletwo
  \def\@evenhead{\parbox[t]{\textwidth}{\ltitleheadline}}%
  \def\@oddhead{\parbox[t]{\textwidth}{\rtitleheadline}}%
  \def\@oddfoot{}\let\@evenfoot\@oddfoot}
  
% COPYRIGHT
% Define font psyr for copyright:
\DeclareFixedFont{\copyrf}{U}{psy}{m}{n}{8}
\DeclareFixedFont{\copyrfa}{U}{psy}{m}{n}{9}
\def\copyright@sign{{\copyrf\char'323}}
\def\copyright@signa{{\copyrfa\char'323}}
\def\rtitleheadline{%
  \footnotesize \@JOURNAL, \@pubyear,\ Vol. \@volume, No. \@issue, \@ppages
  \hfill {\normalsize\thepage}\break
  \copyright@sign\ \@pubyear\ \textit{\@publisher}\hfill\break
  \print@doi
  }
\let\ltitleheadline\rtitleheadline

\pagestyle{headings}

% ************************ FOOTNOTE
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width12pc
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent 14pt
    \@makefnmark #1}
\def\@makefnmark{\@textsuperscript{\normalfont\@thefnmark}}%

% ************************ SECTIONS
\renewcommand\section{\@startsection {section}{1}{\z@}%
         {-\bigskipamount}%
         {\medskipamount}%
         {\normalsize\bfseries\nohyphen\raggedright}}

\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
         {-\medskipamount}%
         {\medskipamount}%
         {\normalsize\itshape\nohyphen\raggedright}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
           {-\medskipamount}%
           {0.1pt}%
           {\normalsize\itshape\nohyphen\raggedright}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
          {\medskipamount}%
          {-1em}%
          {\normalsize\itshape}}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
             {\smallskipamount}%
             {-1em}%
             {\normalsize\itshape}}
% Format for the counter:
\def\@seccntformat#1{\expandafter\upshape{\csname the#1\endcsname}.\enspace}

%% caption
\RequirePackage{caption}
\captionsetup{margin=0pt,font=footnotesize,labelsep=period,skip=11pt}
\captionsetup[table]{position=top,justification=centering,skip=4pt} 
\def\table@caption@setup{%
  \captionwidth=\tablewidth 
  \def\caption@lsep{\\}
  }
\appto\caption@beginhook{\csuse{\@captype @caption@setup}}
\renewcommand\figurename{Fig.}

\def\floatfmt{\centering\footnotesize}
\appto\@floatboxreset\floatfmt

\setlength\floatsep       {18\p@ \@plus 6\p@ \@minus 2\p@}
\setlength\textfloatsep   {18\p@ \@plus 6\p@ \@minus 2\p@}
\setlength\intextsep      {18\p@ \@plus 6\p@ \@minus 2\p@}
\setlength\dblfloatsep    {18\p@ \@plus 6\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{24\p@ \@plus 6\p@ \@minus 2\p@}

%
%************************** TABULAR
\let\savehline\hline
\def\thline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}%
\def\fhline{\noalign{\vskip1pt}\savehline\noalign{\vskip7pt}}%
\def\bhline{\noalign{\vskip3pt}\noalign{\global\arrayrulewidth=1\p@}\savehline\noalign{\global\arrayrulewidth=.5\p@}\noalign{\vskip3pt}}%
\def\lhline{\noalign{\vskip3pt}\noalign{\global\arrayrulewidth=.3\p@}\savehline\noalign{\global\arrayrulewidth=.5\p@}\noalign{\vskip3pt}}

\def\hline{\noalign{\vskip1\p@}%
  \noalign{\ifnum0=`}\fi\hrule \@height \arrayrulewidth 
  \futurelet\reserved@a\@xhline}

\AtBeginDocument{%
  \def\@xhline{\ifx\reserved@a\hline
    \vskip\doublerulesep\vskip-\arrayrulewidth\fi
    \ifnum0=`{\fi}%
    \noalign{\vskip2\p@}}%
  }

\let\oldcline\cline
\def\cline#1{\noalign{\vskip1\p@}\@cline#1\@nil\noalign{\vskip2\p@}}
\def\ccline#1{\noalign{\vskip1\p@}\do@ccline(#1,1-0)\noalign{\vskip2\p@}}
\def\do@ccline(#1-#2,#3){%
  \noalign{\ifnum#1>#2\gdef\temp@next{}\else\gdef\temp@next{\@cline#1-#2\@nil\do@ccline(#3,1-0)}\fi}%
  \temp@next
  }


\newtoks\fm@temp@toks
\newenvironment{frontmatter}
  {%
    \global\@firstauthortrue
    \let\saved@thefootnote\thefootnote
  }{%
    \do@pdfmeta@authors
    \maketitle
    \prepare@runauthor
    \check@articletype@pretitle@status
    \ifnum\c@author=0\relax
    \else
        \ifnum\c@countead=0\relax
            \ClassError{\fmt@name}{At least one email address is required!}{}%
        \fi
    \fi
    \par\unskip
    \vskip\endfrontmater@skip
  }
\def\check@articletype@pretitle@status{%
  \ifx\@articletype\@empty
    {\vtxClassError{\fmt@name}{Command \string\articletype{}\space is missing or is empty!}\@ehc}
  \fi
  \ifx\@pretitle\@empty
    {\vtxClassError{\fmt@name}{Command \string\pretitle{}\space is missing or is empty!}\@ehc}
  \fi
  }

\def\init@standard@footnote{%
  \ifdefined\init@standard@footnote@done
  \else
    \gdef\init@standard@footnote@done{1}%
    \global\let\thefootnote\saved@thefootnote
    \setcounter{footnote}{0}%
  \fi
  }

%% lists

%%%%%%%%%%%%%% Hooks
% general list indent
\def\list@parindent{1pc}

% enumerate
\def\enumerate@indent{\z@}
\def\enumerate@parindent{\list@parindent}
\def\enumerate@labelsep{.5em}
\def\enumerate@firsttopsep{\smallskipamount}
\def\enumerate@topsep{\z@}
\def\enumerate@rightskip{\z@}% {\z@ plus 1fill}
\let\enumerate@hook\relax

% itemize
\def\itemize@indent{\z@}
\def\itemize@parindent{\list@parindent}
\def\itemize@labelsep{.5em}
\def\itemize@firsttopsep{\smallskipamount}
\def\itemize@topsep{\z@}
\def\itemize@rightskip{\z@}% {\z@ plus 1fill}
\let\itemize@hook\relax

% description
\def\description@indent{\list@parindent}
\let\description@topsep\smallskipamount
\let\description@hook\relax

%%%%%%%%%%%%%% Parameters
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty


%%%%%%%%%%%%%% General list parameters (not important}

\parsep\z@
\topsep\z@
\partopsep\z@
\itemsep\z@

\def\@listi  {\leftmargin\leftmargini \parsep=\z@}
\def\@listii {\leftmargin\leftmarginii%
             \labelwidth\leftmarginii%
             \advance\labelwidth-\labelsep
             }%

\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep}

\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              }

\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              }

\setlength\leftmargini   {2em}
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv   {1em}
\setlength\leftmarginvi  {1em}

\@listi

\def\labelitemi  {\textbullet}
\def\labelitemii {\textendash}
\def\labelitemiii{\textasteriskcentered} 
\def\labelitemiv {{\footnotesize +}}

%%%%%%%%%%%%%% Enumerate

\def\theenumi  {\@arabic\c@enumi}
\def\theenumii {\@alph\c@enumii}
\def\theenumiii{\@roman\c@enumiii}
\def\theenumiv {\@Alph\c@enumiv}

\def\labelenumi  {\theenumi.}
\def\labelenumii {\theenumii)}
\def\labelenumiii{\theenumiii.}
\def\labelenumiv {\theenumiv.}

\@listi

\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

%%%%%%%%%%%%%% Enumerate

\def\enumerate{\@ifnextchar[{\@enumerate}{\@enumerate[]}}

\def\@enumerate[#1]{%
    \ifnum \@enumdepth >\thr@@ \@toodeep\else
    \advance\@enumdepth \@ne 
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \list {\csname label\@enumctr\endcsname}%
       {\usecounter{\@enumctr}
        \def\makelabel##1{{\hfill\normalfont ##1}}
%
        \ifx.#1.%
           \setcounter{\@enumctr}{3}% 
           \expandafter\settowidth\expandafter\labelwidth\expandafter{\csname label\@enumctr\endcsname}%
           \setcounter{\@enumctr}{0}%
        \else%
           \settowidth{\labelwidth}{#1}
        \fi%
        \labelsep=\enumerate@labelsep%
        \itemindent=\labelwidth \advance\itemindent\labelsep%
        \ifnum \@enumdepth=1\advance\itemindent by\enumerate@indent\fi%
        \leftmargin=\the\itemindent%
        \itemindent\z@%
        \partopsep\z@  \parsep\z@ \itemsep\z@ \rightmargin\z@
        \ifnum \@enumdepth=1 \topsep\enumerate@firsttopsep \else \topsep\enumerate@topsep\fi%
        \listparindent\enumerate@parindent%        
        \@rightskip\enumerate@rightskip%
        \enumerate@hook% 
        }\fi}

\let\endenumerate =\endlist

%%%%%%%%%%%%%%  setenumtype

\def\setenumtype#1{%
\if#1a \let\enumerate\longlist\fi%
\if#1c \def\enumerate@indent{\z@}\fi}%

%%%%%%%%%%%%%%  itemize

\def\itemize{\@ifnextchar[{\@itemize}{\@itemize[]}}

\def\@itemize[#1]{%
    \ifnum \@itemdepth >\thr@@ \@toodeep\else
    \advance\@itemdepth \@ne 
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \list {\csname\@itemitem\endcsname}%
       {\def\makelabel##1{{\hfill\normalfont ##1}}        
%
        \ifx.#1.%
           \settowidth\labelwidth{\csname\@itemitem\endcsname}%
        \else%
           \settowidth{\labelwidth}{#1}
        \fi%
        \labelsep=\itemize@labelsep%
        \itemindent=\labelwidth \advance\itemindent\labelsep%
        \ifnum \@itemdepth=1\advance\itemindent by\itemize@indent\fi%
        \leftmargin=\the\itemindent%
        \itemindent\z@%
        \partopsep\z@  \parsep\z@ \itemsep\z@ \rightmargin\z@
        \ifnum \@itemdepth=1 \topsep\itemize@firsttopsep \else \topsep\itemize@topsep\fi%
        \listparindent\itemize@parindent%        
        \@rightskip\itemize@rightskip%
        \itemize@hook% 
        }\fi}

\let\enditemize =\endlist

%%%%%%%%%%%%%%  description

\def\description{%
         \list{}{\labelwidth\z@ \labelsep\z@  \rightmargin\z@
         \leftmargin\z@ \advance\leftmargin by\description@indent
         \itemindent-\description@indent
         \partopsep\z@ \topsep\description@topsep \parsep\z@
         \itemsep\z@ \listparindent\z@
         \description@hook%
         \let\makelabel\descriptionlabel}}

\def\enddescription{\endlist}

\def\descriptionlabel#1{\if.#1.\else\bfseries #1\hskip.5em\fi}


%%%%%%%%%%%%%% Bibliography
\IfFileExists{vtexnatbib.sty}
  {\RequirePackage{vtexnatbib}}
  {\RequirePackage{natbib}}
\setcitestyle{authoryear}  

\ifdefined\linksfromyear
\else
  %% special \cite modification to make hyperlink only from year part
  \def\NAT@citex%
    [#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
      \@for\@citeb:=\NAT@cite@list\do
      {\@safe@activestrue
       \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
       \@safe@activesfalse
       \@ifundefined{b@\@citeb\@extra@b@citeb}{\@citea%
         {\reset@font\bfseries ?}\NAT@citeundefined
                   \PackageWarning{natbib}%
         {Citation `\@citeb' on page \thepage \space undefined}\def\NAT@date{}}%
       {\let\NAT@last@nm=\NAT@nm\let\NAT@last@yr=\NAT@year
        \NAT@parse{\@citeb}%
        \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
          \let\NAT@name=\NAT@all@names
          \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
        \fi
       \ifNAT@full\let\NAT@nm\NAT@all@names\else
         \let\NAT@nm\NAT@name\fi
       \ifNAT@swa\ifcase\NAT@ctype
         \if\relax\NAT@date\relax
           \@citea\NAT@nmfmt{\NAT@nm}\NAT@hyper@{\NAT@date}%
         \else
           \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
              \ifx\NAT@last@yr\NAT@year
                \def\NAT@temp{{?}}%
                \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                 {Multiple citation on page \thepage: same authors and
                 year\MessageBreak without distinguishing extra
                 letter,\MessageBreak appears as question mark}\fi
                \NAT@hyper@{\NAT@exlab}%
              \else\unskip\NAT@spacechar
                \NAT@hyper@{\NAT@date}%
              \fi
           \else
             \@citea
              \NAT@nmfmt{\NAT@nm}%
              \NAT@aysep\NAT@spacechar
              \NAT@hyper@{\NAT@date}%
           \fi
         \fi
       \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
       \or\@citea\NAT@hyper@{\NAT@date}%
       \or\@citea\NAT@hyper@{\NAT@alias}%
       \fi \NAT@def@citea
       \else
         \ifcase\NAT@ctype
          \if\relax\NAT@date\relax
            \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
          \else
           \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
              \ifx\NAT@last@yr\NAT@year
                \def\NAT@temp{{?}}%
                \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                 {Multiple citation on page \thepage: same authors and
                 year\MessageBreak without distinguishing extra
                 letter,\MessageBreak appears as question mark}\fi
                \NAT@hyper@{\NAT@exlab}%
              \else
                \unskip\NAT@spacechar
                \NAT@hyper@{\NAT@date}%
              \fi
           \else
             \@citea
               \NAT@nmfmt{\NAT@nm}%
               \NAT@spacechar\NAT@@open\if*#1*\else#1\NAT@spacechar\fi
               \NAT@hyper@{\NAT@date}%
           \fi
          \fi
         \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
         \or\@citea\NAT@hyper@{\NAT@date}%
         \or\@citea\NAT@hyper@{\NAT@alias}%
         \fi
         \if\relax\NAT@date\relax
           \NAT@def@citea
         \else
           \NAT@def@citea@close
         \fi
       \fi
       }}\ifNAT@swa\else\if*#2*\else\NAT@cmt#2\fi
       \if\relax\NAT@date\relax\else\NAT@@close\fi\fi}{#1}{#2}}
	\let\@citex\NAT@citex
\fi


\DeclareRobustCommand\surl[1]{#1}
\DeclareRobustCommand\doiurl[1]{#1}
\DeclareRobustCommand\arxivurl[1]{#1}

\ifdefined\bvolume
\else
  \def\set@bibl@cmd#1{\expandafter\def\csname #1\endcsname##1{{\csname #1@style\endcsname ##1}}}
  \def\set@bibl@env#1{%
    \newenvironment{#1}
      {%
        \csname start@bibenv@hook\endcsname
        \csname start@#1@hook\endcsname
      }{%
        \unskip
        \csname stop@#1@hook\endcsname
        \csname stop@bibenv@hook\endcsname
        \nolinebreak
      }%
    }
  \def\bibl@cmds@I{bvolume,binits,bsnm,bparticle,bsuffix,bdegs,%
    bsertitle,batitle,bjtitle,bctitle,bbtitle,bauthor,%
    binstitute,bissue,bnumber,bmonth,bedition,bpublisher,blocation,%
    bisbn,bfpage,blpage,byear,bcomment,bsupplement,%
    beditor,bseriesno,bconflocation,bconfdate,%
    oauthor,oinstitute}
  \def\do#1{\set@bibl@cmd{#1}}
  \expandafter\docsvlist\expandafter{\bibl@cmds@I}
  \def\do#1{\set@bibl@env{#1}}
  \docsvlist{barticle,bchapter,botherref,bbook}
  \@ifundefined{adsurl}{\let\adsurl\surl}{}
  \@ifundefined{url}{\let\url\surl}{}
  \let\endbibitem\relax
  \let\betal@style\relax
  \long\def\OrigBibText#1\endOrigBibText{}
  \def\bptok#1{\ignorespaces}
\fi

\let\betal@style\relax
\def\betal{{\betal@style et al.}}%
\let\inlinecite\cite
\def\bjtitle#1{\textit{#1}}
\def\bbtitle#1{\textit{#1}}

\def\bibfont{\footnotesize}
\def\bibsection{\section*{\refname}}

\def\MR@url{http://www.ams.org/mathscinet-getitem?mr=}
\def\MR#1{\href{\MR@url#1}{MR#1}}


\RequirePackage{xcolor}
\definecolor{linkblue}{rgb}{0 0.4235 0.6392}
\RequirePackage{hyperref}

\hypersetup{%
  colorlinks=true,
  pdfborder={0 0 1},
  linkcolor=linkblue,
  citecolor=linkblue,
  urlcolor=linkblue,
  breaklinks,
  hypertexnames=false
  }

\appto\maketitle{%
  \hypersetup{%
    pdfinfo={%
      Title={\@title},
      Subject={},
      Author={\the\pdfmeta@authors},
      Creator={VTeX},
      Producer={VTeX},
      }%
    }%
  }

\@namedef{infor@section@level@1@sep}{}
\@namedef{infor@section@level@2@sep}{}
\@namedef{infor@section@level@3@sep}{}
\@namedef{infor@section@level@4@sep}{.}
\@namedef{infor@section@level@5@sep}{.}
\def\infor@section@numlevel{0}
\def\infor@section@namelevel{undef}
\AtBeginDocument{%
  \global\let\infor@Sectionformat\Sectionformat
  \global\let\infor@startsection\@startsection
  \def\@startsection#1#2#3#4#5#6{%
    \xdef\infor@section@namelevel{#1}%
    \xdef\infor@section@numlevel{#2}%
    \infor@startsection{#1}{#2}{#3}{#4}{#5}{#6}%
    }%
  \gdef\Sectionformat#1#2{%
    \infor@Sectionformat{#1\@nameuse{infor@section@level@\infor@section@numlevel @sep}}{#2}%
    }%
  }

%% >>> index >>>
\usepackage{index}
\newindex{default}{idx}{ind}{Raw Index}
%% <<< index <<<

%% >>> startlocaldefs, endlocaldefs >>>
\let\check@localdefs@status\relax
\def\startlocaldefs{%
  \gdef\check@localdefs@status{\dbl@error{Missing command \string\endlocaldefs!}}%
  \gdef\startlocaldefs{\dbl@error{Command \string\startlocaldefs already exists!}}%
  \makeatletter}
\def\endlocaldefs{%
  \makeatother
  \ifx\check@localdefs@status\relax
    \gdef\check@localdefs@status{\dbl@error{Missing command \string\startlocaldefs!}}%
  \else
    \global\let\check@localdefs@status\relax
  \fi
  \gdef\endlocaldefs{\dbl@error{Command \string\endlocaldefs already exists!}}%
  }
\AtBeginDocument{\check@localdefs@status}%
%% <<< startlocaldefs, endlocaldefs <<<

%% >>> \bid >>>
\define@key{bid}{mr}{\def\bid@mr{\MR{#1}}}
\define@key{bid}{doi}{\def\bid@doi{\doiurl{#1}}}
\define@key{bid}{pubmed}{}
\define@key{bid}{pii}{}

\def\bid#1{%
  \bgroup
  \let\bid@output\@empty
  \setkeys{bid}{#1}\ignorespaces%
  % Output sequence:
  % <MR>. <DOI>
  \ifdefvoid\bid@mr{}{\appto\bid@output{\bid@mr}}%
  \ifdefvoid\bid@doi{}{%
    \ifdefempty\bid@output{}{\appto\bid@output{. }}% separator if output not empty
    \appto\bid@output{\bid@doi}%
    }%
  \bid@output
  \egroup
  }

\def\set@proof@mr{%
  \define@key{bid}{mr}{%
    \@nameuse{startchkuriskip}%
    \safe@href{http://www.ams.org/mathscinet-getitem?mr=##1}{MR##1}%
    \@nameuse{endchkuriskip}%
    \ignorespaces
    }%
  \define@key{bid}{doi}{%
    \ifnum\doc@stage<200\relax
      \@nameuse{startchkuriskip}%
      \safe@href{\doi@base ##1}{\doi@base ##1}%
      \@nameuse{endchkuriskip}%
      \space
    \fi
    }%
  }
\def\set@crc@mr{%
  \define@key{bid}{mr}{%
    \if@sici
      \global\@biblinktrue
    \fi
    \ignorespaces
    }%
  }
%% <<< \bid <<<

\frenchspacing

%% >>> Metadata >>>
\def\@publisheraddress{}
\def\@publisher{Vilnius University}
\def\@issn{0868-4952}
\def\@eissn{1822-8844}
\def\@articletype{}
\def\articletype#1{\gdef\@articletype{#1}}
\@onlypreamble\articletype
\def\aid#1{\gdef\@aid{#1}}
%% <<< Metadata <<<

%% >>> Frontmatter >>>
\def\pretitle{\@ifnextchar[\@@pretitle{\@@pretitle[]}}
\def\@@pretitle[#1]#2{\gdef\@pretitle{#2}}

\newenvironment{aug}
  {}
  {%
    \global\let\thefootnote\saved@thefootnote
    \setcounter{footnote}{\the\c@authornote}% footnote counter is continuous with authornote
  }
%% >>> author setup >>>
\def\author@font{\large}
\def\author@preskip{12\p@}
\newif\if@firstauthor
\newif\if@newelem
\let\cmd@for@aut@elem\@gobblethree
\let\mdforvkt\@gobblethree
\let\orcid\@gobble

\def\runtitle#1{\gdef\@runtitle{#1}}                      
\def\@runtitle{}
\def\runauthor#1{{\gdef\@runauthor{#1}}} 
\def\@runauthor{}

\def\runauthor@sep{, }
\def\runauthor@cmds{%
    \let\bio\@gobble
    \let\degs\@gobble
    \let\prefix\@gobble
    \let\inits\@gobble
    \def\fnms##1{##1 }%
    \def\snm##1{##1}%
    \let\suffix\@gobble
    \let\roles\@gobble
    \let\thanksref\@gobble
    \let\thanks\@gobble
    \let\thankstext\@gobble
    %\let\ead\@undefined
    \def\ead##1##{\@gobble}%
    \def\inits##1{##1}%
    \let\fnms\@gobble
  }
\def\runauthor@etal{\space et al.}
\def\prepare@runauthor{%
  \ifx\@runauthor\empty
    \ifnum\c@author>0\relax
      \ifnum\c@author>2\relax
          \gdef\@runauthor{{\runauthor@cmds \csuse{author1}\runauthor@etal}}%
      \else
        \ifnum\c@author=1\relax
          \gdef\@runauthor{{\runauthor@cmds \csuse{author1}}}%
        \else
          \gdef\@runauthor{{\runauthor@cmds \csuse{author1}\runauthor@sep\csuse{author2}}}%
        \fi
      \fi
    \fi
  \fi  
  }

\newcounter{author}
\def\author{%
  \@ifnextchar[%
    {\author@optarg}
    {\author@optarg[]}%
  }
  
\protected\def\fmt@snm#1{\uppercase{#1}}
\protected\def\fmt@fnms#1{#1}
\let\write@aux@au\@gobbletwo
\protected\def\@write@aux@au#1#2{%
  \protect\protected@write\@auxout{}{\string\global\string\@namedef{#1@\the\c@author @metadata}{#2}}%
  }
\protected\def\inforbio#1{\csxdef{dg@bio@#1@label}{1}}

\def\front@author@defs{%
  \let\bio\inforbio
  \let\write@aux@au\@write@aux@au
  \protected\def\degs##1{##1}%
  \protected\def\prefix##1{%
    \write@aux@au{prefix}{##1}%
    \fmt@prefix{##1}%
    }%
  \protected\def\fnms##1{\fmt@fnms{##1}}%
  \protected\def\inits##1{%
    \csdef{@inits}{##1}%
    \write@aux@au{inits}{##1}%
    }%
  \protected\def\snm##1{%
    \csdef{@snm}{##1}%
    \write@aux@au{snm}{##1}%
    \fmt@snm{##1}%
    }%
  \protected\def\suffix##1{##1}%
  \protected\def\roles##1{##1}%
  }

\def\author@optarg[#1]#2{%
  \stepcounter{author}%
  \beg@elem
  \@for\@tempa:=#1\do{\expandafter\add@addressref\expandafter{\@tempa}}%
  \let\oldunderscore\_%
  \let\_\textunderscore
  \init@fm@element{author}{#2}%
  \let\_\oldunderscore
  \temptoks=\expandafter{\@author}%
  \csxdef{author\the\c@author}{\expandonce{\the\temptoks}}%
  \protected\csxdef{author\the\c@author t@loc@notes}{\the\t@loc@notes}%
  \@ifundefined{author@list}
    {%
      \xdef\author@list{author\the\c@author}%
    }{%
      \xappto\author@list{,author\the\c@author}%
    }%
  \csname author@end@hook\endcsname
  }%

\newtoks\pdfmeta@authors
\def\addto@pdfmeta@authors#1{%
  \begingroup
    \xdef\@act{\global\noexpand\pdfmeta@authors{\the\pdfmeta@authors#1}}%
    \@act
  \endgroup
  }
\def\do@pdfmeta@authors{%
  \@tempcnta\z@
  \@whilenum\@tempcnta<\c@author\do{%
    \advance\@tempcnta\@ne
    \ifnum\@tempcnta>\@ne
      \addto@pdfmeta@authors{, }%
    \fi
    \addto@pdfmeta@authors{%
      \@nameuse{inits@\the\@tempcnta @metadata}%
      \@ifundefined{inits@\the\@tempcnta @metadata}
        {}
        { }\@nameuse{snm@\the\@tempcnta @metadata}%
      }%
    }%
  }

\newtoks\temptoks
\def\author@fmt#1#2#3{%
  \ifdefined\author@fmt@init@done
  \else
    \author@fmt@init
  \fi
  \edef\@tempb{#2}%
  \ifx\@tempb\@empty
    #3%
  \else
    #3\fm@textsuperscript{#2}%
  \fi
  }
\def\fm@textsuperscript#1{%
  %$^{\mathrm{\scriptsize #1}}$%
  \unskip\textsuperscript{{\normalfont #1}}%
  }

\def\author@fmt@init{%
  \gdef\author@fmt@init@done{1}%
  \vskip\author@preskip
  \author@font
  \leavevmode
  }

\def\author@note@fmt{%
  \def\thefootnote{\sxarabic{footnote}}}

\def\sxarabic#1{%
  \expandafter
  \ifcase\value{#1}%
  \or *%
  \or **%
  \or ***%
  \or ****%
  \or *****%
  \fi
  }

\def\add@addressref#1{%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \add@xtok\t@loc@notes{\note@sep}%
  \fi
  \add@tok\t@loc@notes{#1}%
  }
\def\note@sep{,}
%% <<< author setup <<<

%% >>> affil setup >>>
\newcounter{address}
\def\address@font{\small\itshape}
\def\address@preskip{1\p@}
\def\address{%
  \@ifstar
    {\address@star}
    {\@ifnextchar[{\address@optarg}{\address@noptarg}}%
  }

\def\address@optarg[#1]#2{%
  \refstepcounter{address}%
  \beg@elem
  \init@fm@element{address}{#2}%
  \csxdef{address\the\c@address @counter}{\the\c@address}%
  \temptoks=\expandafter{\@address}%
  \csxdef{address\the\c@address}{\the\temptoks}%
  \protected\csxdef{address\the\c@address t@loc@notes}{\the\t@loc@notes}%
  \@ifundefined{address@list}
    {%
      \xdef\address@list{address\the\c@address}%
    }{%
      \xappto\address@list{,address\the\c@address}%
    }%
  \label{#1}%
  \csname address@end@hook\endcsname
  \ignorespaces
  }

\def\address@noptarg#1{%
  \refstepcounter{address}%
  \beg@elem
  \init@fm@element{address}{#1}%
  \csxdef{address\the\c@address @counter}{\z@}%
  \temptoks=\expandafter{\@address}%
  \csxdef{address\the\c@address}{\the\temptoks}%
  \protected\csxdef{address\the\c@address t@loc@notes}{\the\t@loc@notes}%
  \@ifundefined{address@list}
    {%
      \xdef\address@list{address\the\c@address}%
    }{%
      \xappto\address@list{,address\the\c@address}%
    }%
  \csname address@end@hook\endcsname
  \ignorespaces
  }

\def\address@star#1{%
  \beg@elem
  \init@fm@element{address}{#1}%
  \address@fmt{\m@ne}{\the\t@loc@notes}{\@address}%
  \ignorespaces
  }

\def\theaddress{\alph{address}}

\def\address@fmt#1#2#3{%
  \ifdefined\address@fmt@init@done
  \else
    \address@fmt@init
  \fi
  \bgroup
    \def\baselinestretch{1}%
    \address@font
    \ifnum#1=\z@
      #3\,\fm@textsuperscript{#2}\space
    \else
      \ifnum#1=\m@ne
        \phantom{\fm@textsuperscript{\@alph{#1}}\,}#3\,\fm@textsuperscript{#2}%
      \else
        \fm@textsuperscript{\@alph{#1}}#3\fm@textsuperscript{#2}%
      \fi
    \fi
    \par
  \egroup
  }
\def\address@fmt@init{%
  \gdef\address@fmt@init@done{1}%
  \vskip\address@preskip
  \leavevmode
  }
%% <<< affil setup <<<

%% >>> \beg@elem, \proc@elem (based on iosart2x.cls) >>>
\def\beg@elem{%
  \global\t@loc@notes={}%
  \global\note@cnt\z@
  }
\def\@xnamedef#1{%
  \expandafter\xdef\csname #1\endcsname
  }
\def\no@harm{%
  \let\\=\relax  \let\rm\relax
  \let\ss=\relax \let\ae=\relax \let\oe=\relax
  \let\AE=\relax \let\OE=\relax
  \let\o=\relax  \let\O=\relax
  \let\i=\relax  \let\j=\relax
  \let\aa=\relax \let\AA=\relax
  \let\l=\relax  \let\L=\relax
  \let\d=\relax  \let\b=\relax \let\c=\relax
  \let\bar=\relax
  \def\qq@group@start{}\def\qq@group@end{}\let\qq@cmd\@firstofone\def\qq@style{}%
  \def\protect{\noexpand\protect\noexpand}%
  }
\def\thanks#1#{\@gobble}%
\def\thanksref#1#{\@gobble}%

\def\proc@elem#1#2{%
  \begingroup
    \no@harm
    \def\thanks##1##{\@gobble}%
    \def\thanksref##1##{\@gobble}%
    \csgdef{@#1}{#2}%
  \endgroup
  \prev@elem=\cur@elem
  \cur@elem=\csname e@#1\endcsname
  %\expandafter
  \elem@nothanks#2\thanks\relax
  %\expandafter
  \elem@nothanksref#2\thanksref\relax
  }
%% <<< \beg@elem, \proc@elem (based on iosart2x.cls) <<<

%% >>> thanks macro block >>>
\newtoks\t@glob@notes
\newtoks\t@loc@notes
\newcount\note@cnt
\newcount\c@ThanksID
\newcount\prev@elem \prev@elem=0
\newcount\cur@elem  \cur@elem=0
\chardef\e@pretitle=1
\chardef\e@title=1
\chardef\e@subtitle=1
\chardef\e@author=2
\chardef\e@address=3

\newif\if@thankshyperlink \global\@thankshyperlinkfalse

\def\add@tok#1#2{%
  \global#1\expandafter{\the#1#2}%
  }
\def\add@xtok#1#2{%
  \begingroup
    \no@harm
    \xdef\@act{%
      \global\noexpand#1{\the#1#2}%
      }%
    \@act
  \endgroup
  }

\newcounter{correspnote}
\def\corresp@note@counter{correspnote}
\newcounter{titlenote}
\def\title@note@counter{titlenote}
\def\subtitle@note@counter{titlenote}
\newcounter{authornote}
\def\author@note@counter{authornote}
\def\theauthornote{\arabic{authornote}}%
\def\thecorrespnote{%
  \ifcase\c@correspnote\relax
  \or
    $\ast$%
  \or
    $\ast\ast$%
  \or
    $\ast\ast\ast$%
  \fi
  }%
\def\thetitlenote{%
  \ifcase\c@titlenote\relax
  \or
    \ding{73}%
  \or
    \ding{73}\ding{73}%
  \fi
  }%
\let\thesubtitlenote\thetitlenote

\let\thanks@id\@empty
\let\thanks@mark\@empty
\let\thanks@type\@empty
\define@key{thanks}{id}{\def\thanks@id{#1}}
\define@key{thanks}{mark}{\def\thanks@mark{#1}}
\define@key{thanks}{type}{\def\thanks@type{#1}}
\def\reset@thanks{%
  \let\thanks@id\@empty
  \let\thanks@mark\@empty
  \let\thanks@type\@empty
  }
\def\thanks@optarg@fmt#1#2{%
  \freefootnotetext[#1]{#2}%
  }
\def\thanks@optarg[#1]#2{%
  \let\thanks@type\@empty
  \setkeys{thanks}{#1}%
  \ifx\thanks@type\@empty
    \let\thanks@type\fm@object
  \fi
  \edef\current@counter{\csname\thanks@type @note@counter\endcsname}%
  \refstepcounter{\current@counter}%
  \setcounter{footnote}{\the\csname c@\current@counter\endcsname}%
  \def\thefootnote{\csname the\current@counter\endcsname}%
  \edef\thanks@optarg@id{\thanks@type.thanks\the\c@footnote.\jobname}%
  \@@@Label{\thanks@optarg@id}%
  \if@thankshyperlink %% TODO: make active links
    \ifx\thanks@id\@empty%
      \Hy@GlobalStepCount\Hy@linkcounter
      \xdef\thanks@currentHref{\thanks@type.thanks\the\c@footnote.\jobname.\the\Hy@linkcounter}%
      \edef\my@hy@tmp{\noexpand\hypertarget{\thanks@currentHref}{}}%
      %\edef\my@hy@tmp{\noexpand\hypertarget{\@currentHref}{}}% in case \refstepcounter{footnote} is used
    \else
      \edef\my@hy@tmp{\noexpand\hypertarget{\thanks@id thanks}{}}%
    \fi
    %\expandafter\add@tok\expandafter\t@glob@notes\expandafter{\expandafter{\my@hy@tmp #2}}%
    \ifx\thanks@mark\@empty
      \def\thanks@mark{\thefootnote}%
    \fi
      \freefootnotetext[\thanks@mark]{{\my@hy@tmp #2}}%
  \else
    \ifx\thanks@mark\@empty
      \def\thanks@mark{\thefootnote}%
    \fi
    \thanks@optarg@fmt{\thanks@mark}{#2}%
  \fi
  \csname end@thanks@optarg@hook\endcsname
  \ignorespaces
  }%
\def\freefootnotetext[#1]{%
  \begingroup
    \unrestored@protected@xdef\@thefnmark{#1}%
  \endgroup
  \@footnotetext
  }
%% TODO: do we need \tailthanksref?
\def\tailthanksref[#1]#2{%
  \noexpand\pthanksref{#1}%
  }
\def\pthanksref#1{%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \global\t@loc@notes\expandafter{\the\t@loc@notes\note@sep}%
  \fi
  \global\t@loc@notes\expandafter{\the\t@loc@notes#1}%
  }
\def\elem@nothanksref#1\thanksref{%
  \futurelet\@peektok\elem@thanksref
  }
\def\elem@thanksref{%
  \ifx\@peektok\relax
  \else
    \expandafter\elem@morethanksref
  \fi
  }
\def\elem@morethanksref#1{%
  \csxdef{#1@thankstext@type}{\fm@object}%
  \csletcs{thankstext@type}{#1@thankstext@type}%
  \add@thanks{id=#1}%
  \elem@nothanksref
  }
\def\elem@nothanks#1\thanks{%
  \futurelet\@peektok\elem@thanks
  }
\def\elem@thanks{%
  \ifx\@peektok\relax
  \else
    \ifx\@peektok[%
      \expandafter\expandafter\expandafter\elem@morethankse
    \else
      \expandafter\expandafter\expandafter\elem@morethanks
    \fi
  \fi
  }
\def\elem@morethankse[#1]#2{%
  \thanks@optarg[#1]{#2}%
  \add@thanks{#1}%
  \elem@nothanks
  }
\def\elem@morethanks#1{%
  \thanks@optarg[]{#1}%
  \add@thanks{}%
  \elem@nothanks
  }

\define@key{thankstext}{type}{\gdef\thankstext@type{#1}}
\define@key{thankstext}{id}{\gdef\thankstext@id{#1}}
\def\reset@thankstext{%
  \let\thankstext@id\@empty
  \let\thankstext@mark\@empty
  \let\thankstext@type\@empty
  }
\def\thankstext@fmt#1#2{%
  \freefootnotetext[#1]{#2}%
  }
\def\thankstext[#1]#2{%
    \reset@thankstext
    \setkeys{thankstext}{#1}%
    \ifx\thankstext@type\@empty
      \csletcs{thankstext@type}{\thankstext@id @thankstext@type}%
    \fi
    \edef\current@counter{\csname\thankstext@type @note@counter\endcsname}%
    \refstepcounter{\current@counter}%
    \setcounter{footnote}{\the\csname c@\current@counter\endcsname}%
    \def\thefootnote{\csname the\current@counter\endcsname}%
    \@@@Label{\thankstext@id}%
    \thankstext@fmt{\thefootnote}{#2}%
  }
\define@key{addthanks}{id}{\def\addthanks@id{#1}}
\define@key{addthanks}{mark}{\def\addthanks@mark{#1}}
\define@key{addthanks}{type}{\def\addthanks@type{#1}}
\def\reset@addthanks{%
  \let\addthanks@id\@empty
  \let\addthanks@mark\@empty
  \let\addthanks@type\@empty
  }
\def\add@thanks#1{%
  \reset@addthanks
  \setkeys{addthanks}{#1}%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \add@xtok\t@loc@notes{\note@sep}%
  \fi
  \if@thankshyperlink %% TODO: make active links
    \ifx\addthanks@id\@empty
      \add@xtok\t@loc@notes{\protect\Hy@breaklinkstrue
        \protect\hyper@linkstart{link}{\thanks@currentHref}\thefootnote\protect\hyper@linkend}%
    \else
      \add@xtok\t@loc@notes{\protect\Hy@breaklinkstrue
        \protect\hyper@linkstart{link}{\addthanks@id thanks}\addthanks@id\protect\hyper@linkend}%
    \fi%
  \else
    \ifx\addthanks@id\@empty
      \def\addthanks@mark{\thefootnote}%
    \else
      \ifx\addthanks@mark\@empty
        \def\addthanks@mark{\@@@Ref{\addthanks@id}}%
      \fi
    \fi
    \add@xtok\t@loc@notes{\addthanks@mark}%
  \fi
  \csname end@add@thanks@hook\endcsname
  }
\newcount\c@sv@footnote
\def\output@glob@notes{%
  \bgroup
    \the\t@glob@notes
  \egroup
  }
%% <<< thanks macro block <<<

%% >>> init FM element setup >>>
\newcommand\init@fm@element[3][]{%
  \def\fm@object{#2}%
  \ifcsname init@fm@#2@done\endcsname
  \else
    \setkeys{#2}{#1}%
  \fi
  \csgdef{init@fm@#2@done}{1}%
  \proc@elem{#2}{#3}%
  }
%% <<< init FM element setup <<<

%% >>> title/subtitle setup >>>
\def\title#1{%
  \beg@elem
  \init@fm@element{title}{#1}%
  \gdef\@runtitle{#1}%
  \protected\csxdef{title@t@loc@notes}{\the\t@loc@notes}%
  \csname title@end@hook\endcsname
  }
\def\title@fmt#1#2{%
  \bgroup
    \nohyphen\raggedright
    \title@font
    #1{\hbox{\title@textsuperscript{#2}}}%
    \par
  \egroup
  }
  
\def\subtitle#1{%
  \beg@elem
  \init@fm@element{subtitle}{#1}%
  \protected\csxdef{subtitle@t@loc@notes}{\the\t@loc@notes}%
  \csname subtitle@end@hook\endcsname
  }
\def\subtitle@fmt#1#2{%
  \bgroup
    \nohyphen\raggedright
    \subtitle@font
    #1\hbox{\title@textsuperscript{#2}}%
  \egroup
  }

\def\title@textsuperscript#1{\textsuperscript{#1}}
%% <<< title/subtitle setup <<<

%% >>> email >>>
\def\ead@mark{}
\def\ead@href#1#2{\href{#1}{\ead@mark}}
\def\email@prefix{e-mail:\space}
\newtoks\email@author@toks
\def\email@author@fmt{\ignorespaces}

%% blocked use of printead.sty in author environment
\newcounter{countead}
\def\ead@hook#1#2{%
    \stepcounter{countead}%
    \ifx.#2.
        \gdef\ead@mark{???}%
    \else
        \gdef\ead@mark{#2}%
    \fi
    }
    
\def\ead@hrefprefix@email{mailto:}
        
\DeclareRobustCommand\ead[2][]{{%
%% few necessary printead.sty definitions
  \define@key{ead}{label}{\def\ead@id{#1}}%
  \define@key{ead}{email}[true]{\def\ead@type{email}}%
  \def\@setead##1##2##3{%
    \bgroup
      \csname @setead@hook\endcsname
      \expandafter\xdef\csname ead@##1@##2\endcsname{##3}%
    \egroup
    }%
  %
  \csname before@ead@hook\endcsname
  \setkeys{ead}{label={},email,#1}%
  \@setead{\ead@id}{options}{#1}%
  \@setead{\ead@id}{type}{\ead@type}%
  \@setead{\ead@id}{value}{#2}%
  \csedef{\ead@id @email@author}{}%
  \def\email@type{email}%
  \ifx\ead@type\email@type
    \ead@hook{#1}{#2}%
    \add@xtok\email@author@toks{%
      \csuse{emailauthor@sep}%
      \ead@href{\ead@hrefprefix@email #2}{#2}%
      }%
    \gdef\emailauthor@sep{\unskip,\space}%
  \fi
  \csname after@ead@hook\endcsname
  }\ignorespaces}

\def\email@font{\small\itshape}

\def\output@frontmatter@emails{%
  \bgroup
    \edef\emaillist{\the\email@author@toks}%
    \ifx\emaillist\empty
    \else
      \bgroup
        \email@font
        \email@prefix \the\email@author@toks
        \par
      \egroup
    \fi
  \egroup
  }
%% <<< email <<<

%% >>> history >>>
%% history month - full name
\def\vtxsetvaluelist#1#2{%
  \@tempcnta=0\relax
  \@for\@curr@val:=#2\do{%
    \advance\@tempcnta by1\relax
    \expandafter\protected@xdef\csname #1@item@\the\@tempcnta\endcsname{\@curr@val}%
    }%
    \expandafter\protected@xdef\csname #1@item@0\endcsname{\the\@tempcnta}%
  }
\xdef\vtxgetitemvalue#1#2{\noexpand\csname #1@item@#2\endcsname}
\def\sday#1{#1}
\def\syear#1{#1}
\def\smonth#1{\@ifundefined{month@item@#1}%
  {\vtxClassError{\fmt@name}{There is no month with number '#1'!}\@ehc}%
  {\vtxgetitemvalue{month}{#1}}%
}
\vtxsetvaluelist{month}{January,February,March,April,May,June,July,August,September,October,November,December}
\expandafter\def\csname month@item@0\endcsname{????}

\newif\if@history \@historyfalse
\def\define@history@date#1{%
  \expandafter\def\csname #1\endcsname##1{%
    \def\@tempa{##1}%
    \ifx\@tempa\@empty
    \else
      \csgdef{@#1}{##1}%
    \fi
    }%
  }
\define@history@date{received}
\define@history@date{revised}
\define@history@date{accepted}
\define@history@date{publishedonline}

\def\received@prefix{Received:~}
\def\revised@prefix{revised:~}
\def\accepted@prefix{accepted:~}

\def\publishedonline@prefix{Published~online:~}
\def\received@postfix{}
\def\revised@postfix{}
\def\accepted@postfix{}
\def\publishedonline@postfix{}
\def\history@prefix{}
\def\history@postfix{}

\def\history@sep{%
  \if@history
    ; \allowbreak
  \fi
  }
\def\history@fmt{%
  \history@prefix
  \ifx\@empty\@received
  \else
    \leavevmode
    \received@prefix\hbox{\@received}\received@postfix
    \@historytrue
    \ifx\@empty\@revised
    \else
      \history@sep
      \revised@prefix\hbox{\@revised}\revised@postfix
    \fi
    \ifx\@empty\@accepted
    \else
      \history@sep
      \accepted@prefix\hbox{\@accepted}\accepted@postfix
      \@historytrue
    \fi
    % \output@publishedonline
  \fi
  \history@postfix
  }

\def\history@skip{14pt}  
\def\output@frontmatter@history{%
    \small
    \history@fmt
    \par
  }

%% <<< history <<<

\let\cny\@firstofone
\let\dept\@firstofone
\let\institution\@firstofone
\let\addr\@firstofone
\let\city\@firstofone

\def\dedicated#1{%
  \gdef\@dedicated{#1}%
  }
\def\dedicated@fmt#1{%
  \normalsize\itshape
  #1%
  }
%% <<< Frontmatter <<<

%% definitions execution after \begin{document} (for tex4ht)
\ifdefined\HCode
  {
  \catcode`#=12\relax
  \catcode`&=6\relax
  \gdef\startlocaldefs{%
    \catcode`#=12\relax
    \makeatletter
    \@startlocaldefs
    }
  \gdef\@startlocaldefs@toks{}%
  \long\gdef\@startlocaldefs&1\endlocaldefs{%
    \long\xdef\@startlocaldefs@toks{\detokenize{&1}}%
    \makeatother
    \catcode`#=6\relax
    }
  }
  \appto\document{\makeatletter\expandafter\scantokens\expandafter{\@startlocaldefs@toks}\makeatother}%
\fi

%% Acknowledgement
\define@key{acknowledgement}{title}{\def\acknowledgement@title{#1}}
\def\acknowledgement@title{Acknowledgement}
\newenvironment{acknowledgement}[1][]%
  {%
    \setkeys{acknowledgement}{#1}%
    \section*{\acknowledgement@title}%
  }{%
    \par
  }

%% >>> Funding >>>
\def\@afterbox{%
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
        \everypar{}%2015-04-09
      \fi
    \else
      \clubpenalty \@clubpenalty
      {\setbox\z@\lastbox}%
      \everypar{}%
    \fi
    }%
  }

\newenvironment{Env@EndOfContrib}[1]
  {%
    \if@noskipsec\leavevmode\fi
    \par
    \@afterindenttrue
    \if@nobreak
      \everypar{}%
    \else
      \addpenalty\@secpenalty\addvspace\baselineskip
    \fi
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
        {\setbox\z@\lastbox}%
        \clubpenalty\@M
        {%
          %\sffamily
          \bfseries#1\\\\%
        }%
        %\unskip\hskip0.5em\relax
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi
      }%
    \ignorespaces
  }{%
    \par
    \vskip\baselineskip
    \aftergroup\@afterbox
  }

\define@key{gsponsor}{id}{\def\gsponsor@id{#1}}
\define@key{gsponsor}{sponsor-id}{\def\gsponsor@sponsorid{#1}}
\define@key{gnumber}{refid}{\def\gnumber@refid{#1}}

\def\gsponsor@fmt#1{#1}
\def\gnumber@fmt#1{#1}

\newcommand\gsponsor[2][]{%
  \bgroup
    \setkeys{gsponsor}{#1}%
    \gsponsor@fmt{#2}%
  \egroup
  }
\newcommand\gnumber[2][]{%
  \bgroup
    \setkeys{gnumber}{#1}%
    \gnumber@fmt{#2}%
  \egroup
  }

\def\fundingname{Funding}
\def\funding{\Env@EndOfContrib\fundingname}
\let\endfunding\endEnv@EndOfContrib
%% <<< Funding <<<

%% >>> LaTeX quality checker configuration >>>
\protected@write\@auxout{}{\string\vktinfo{kt-ltx-chk}{cmn}{cmn_info_all}}
\protected@write\@auxout{}{\string\vktinfo{kt-ltx-chk}{cmn}{cmn_vln_all}}
\protected@write\@auxout{}{\string\vktinfo{kt-ltx-chk}{cmn}{cmn_vln_ext}}
\let\vktinfo\@gobblethree
%% <<< LaTeX quality checker configuration <<<

\newenvironment{backmatter}{\goodbreak\ignorespaces}{}

\newenvironment{biography}{%
  \par\smallskip
  \def\author##1{\noindent\textbf{##1}}%
  \def\photofilename##1{%
    \includegraphics[scale=1]{##1}\\
    }%
  }%
 {}%

%% old style support
\newenvironment{keyword}[1][]{\begin{keywords}[#1]}{\end{keywords}}
\def\pf{\begin{proof}}
\def\endpf{\end{proof}}
\let\noqed\relax
\newdimen\tablewidth
\tablewidth=\textwidth

\newenvironment{abstractLT}{\bigskip\bgroup\small%
  \def\title##1{{\large\noindent\textbf{##1}\par\smallskip}}%
  \def\authors##1{{\normalsize\noindent##1\par\smallskip}\noindent\ignorespaces}%
  }{\par\egroup}

%%%%%%%%%%%%%%% CONTTABLE
\newtoks\table@head

\long\def\thead#1\endthead{\global\table@head{#1}#1}
\def\contthead{\the\table@head}

\let\contpart\relax

\newenvironment{conttable}{%
  \let\footnoterule\relax
  \tablewidth=\hsize
  \@float{table}}
  {\end@float}

\newenvironment{conttable*}{%
  \let\footnoterule\relax
  \tablewidth=\textwidth
  \@dblfloat{table}}
  {\end@dblfloat}

\newenvironment{sidewaysconttable}{%
  \@rotfloat{table}}
  {\end@rotfloat}

%%%%%%%%%%%%%%% CONTCAPTION 

\newif\if@contcaption

\def\contcaptionbraces#1#2{\gdef\contcaptionbraces@left{#1}\gdef\contcaptionbraces@right{#2}}
\contcaptionbraces()

\def\contcaption{\@contcaption\@captype}

\long\def\@contcaption#1#2{%
  \par
  \begingroup
    \@parboxrestore
    \if@minipage\@setminipage\fi
    \@contcaptiontrue
    \normalsize\@makecaption{\csname fnum@#1\endcsname}{\ignorespaces\contcaptionbraces@left\textit{#2}\contcaptionbraces@right}\par
  \endgroup
  }

\def\continued#1{\rightline{(\textit{#1})}}

\@namedef{contfigure*}{\@nameuse{figure*}}
\@namedef{endcontfigure*}{\@nameuse{endfigure*}}
\let\contfigure\figure
\let\endcontfigure\endfigure

\let\tsub\textsubscript
\let\tsup\textsuperscript

\endinput
%%
%% End of file `info.cls'.
