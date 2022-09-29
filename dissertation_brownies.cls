%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dissertation_brownies
%% pdfLaTeX or XeLaTeX Template
%%
%% Based on:
%% Thesis Template by Victor Caldas
%% https://github.com/vcaldas/Groningen-thesis-template
%% 
%% Modified by:
%% Jorn Steen & Linda Eijsink
%% https://github.com/JornSteen/thesis-template-brownies
%%
%% Important notes:
%%	 This template can be compiled either with pdfLaTeX or with XeLaTeX
%%	 	%% see below for the differences and (dis)advantages
%%	 The bibliography needs to be compiled with biber.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%% START document class, language, and other basic things %%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dissertation_brownies}[2013/07/08 v1.0 TU Delft dissertation class]

\newif\if@nativefonts %% this command is needed for the xetex option
\DeclareOption{nativefonts}{\@nativefontstrue} %% nativefonts are the fonts used with pdflatex (so not with xelatex)
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[10pt, twoside]{book}

\RequirePackage[french,dutch,british]{babel} %%% the last is the default language; other languages before that can be used for some sections
%% british (instead of english) changes, for example, month/day to day/month

%\RequirePackage{ifpdf} %% not necessary anymore since it's included in iftex
%\RequirePackage{ifxetex} %% not necessary anymore since it's included in iftex
\RequirePackage{iftex} %% has replaced and includes the packages ifpdf and ifxetex, etc.

\ifxetex %% if compiler is xelatex
	\RequirePackage[xetex]{geometry}
	\RequirePackage[xetex]{graphicx}
	\RequirePackage[xetex]{hyperref}
	\RequirePackage{xltxtra}
	\defaultfontfeatures{Ligatures=TeX}
\else %% if compiler is not xelatex, but for example pdflatex
	\ifpdf
		\RequirePackage[pdftex]{geometry}
		\RequirePackage[pdftex]{graphicx} %% for figures, etcetera
		\RequirePackage[pdftex]{hyperref} %% for hyperlinks
	\else
		\RequirePackage[dvips]{geometry}
		\RequirePackage[dvips]{graphicx} %% for figures, etcetera
		\RequirePackage[hypertex]{hyperref} %% for hyperlinks
	\fi
\fi
%% Set the paper size to 17 by 24 cm, approximately halfway between A4 and A5.
%% In print mode we add a 3 mm bleed on the outside of the page.
\if@print
	\geometry{
		papersize = {176mm,246mm}, %% size of paper. Related to layoutsize+layoutoffset
		layoutsize = {170mm,240mm}, %% total width and height including header and footer
		layoutoffset = {3mm,3mm}, %% offset from paper size to center the layoutbox
		top = 27mm, bottom = 27mm, inner = 23mm, outer=14mm%
	}
\else
	\geometry{%
		papersize={170mm,240mm},%
		top = 27mm, bottom = 27mm, inner = 23mm, outer=14mm} %% 
\fi
%% see here https://texdoc.org/serve/geometry.pdf/0

	%%%%% END document class, language, geometry, and other basic things %%%%%
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%% START fonts %%%%

%% these ams packages only necessary for non-xelatex?
\RequirePackage{amsfonts} %% for \checkmark
\RequirePackage{amsmath} %% math symbols (necessary for mhchem) 
	%% pdflatex does not work with unicode-math, so the package amsmath is used
	%% for xelatex: amsmath needs to be loaded before unicode-math
\RequirePackage{amssymb} %% extra mathematical symbols
%%

\RequirePackage{expl3} %% necessary for mhchem
\RequirePackage{calc} %% necessary for mhchem %% provides commands for basic calculations
\RequirePackage[version=4]{mhchem} %% for \ce{}
\mhchemoptions{layout=stacked} %% this changes whether superscript and subscript are stacked or not in \ce notation

%% other related packages
\RequirePackage{siunitx} % handle units with proper spacing % http://ctan.math.utah.edu/ctan/tex-archive/macros/latex/contrib/siunitx/siunitx.pdf
\RequirePackage{gensymb} %% for symbols, such as \degree
\RequirePackage{microtype} %% improves reading
%\RequirePackage{textcomp} %% addition to gensymb %% now part of LaTeX distribution already, so no need to add
\RequirePackage{textgreek} %% provides greek symbols for regular text mode 
%%

%%%%%%%%%%%%
%%% start INFORMATION about fonts: how to use, install, change, etcetera %%%

%% - https://www.overleaf.com/learn/latex/Font_typefaces %% Overleaf Font typefaces
%% - https://tug.org/FontCatalogue/docs.html %% LaTeX Font Catalogue -- Font Documentation (with links)
%% - https://tug.org/pracjourn/2006-1/schmidt/schmidt.pdf %% Font selection in LATEX: The most frequently asked questions (a pdf)
%% - https://www.overleaf.com/learn/latex/XeLaTeX %% Overleaf brief introduction to XeLaTeX (for use of many more fonts, for example, OpenType and TrueType fonts)

%%%% fonts with pdflatex: %%%%
	%% - choose a different font: https://www.ctan.org/tex-archive/fonts 
	%% - packages with math fonts: https://tug.org/FontCatalogue/mathfonts.html
	%% - for example: cmbright %% changes the math font to sf and also has a sans serif inside
	%% - mathpazo
	%% - mathptmx %% defines font Adobe Times Roman as default, with math support from Symbol, Chancery, and Computer Modern
	%% - https://tug.org/FontCatalogue/baskervaldx/ %% this one is nice, but, doesn't have all fonts (no sans serif?)
	%% - can also do \RequirePackage[font]{mathdesign} to pull the math-mode glyphs from various other sources %% https://tex.stackexchange.com/questions/193754/warning-font-shape-lgr-mdbch-m-n-undefinedfont-using-lgr-cmr-m-n-instead
%%%%

%%%% fonts with xelatex: opentype and truetype fonts: %%%%
	%% - see: https://tug.org/FontCatalogue/opentypefonts.html
	%% - for math fonts: 
		%%% - use either mathspec for specifying only the maths alphabets (Greek and Latin letters, and Arabic numerals)
		%%% - or use unicode-math for a Unicode glyph encoding for all mathematical characters (it's still experimental but works well mostly)
		%%% - mathspec and unicode-math are not compatible
	%% - make sure that the fonts (.otf/.ttf) that you want to use are installed on your computer.
		%%% - The easiest way is to download the font (from a free fonts website, or ctan.org if it is available there); right-click the .otf/.ttf file; install for all users. 
		%%% - You can check in the Fonts folder "C:\Windows\Fonts" whether it has been installed: it should show up in the list	
	%% - some font shapes may not be available for a font family (e.g. bold+italic, smallcaps+bold, etc.). Another font will be automatically substituted by LaTeX.
%%%%

%%% end INFORMATION fonts %%%
%%%%%%%%%%%%

%% If the document is not compiled with XeLaTeX, we need to use the native fonts (no opentype/truetype)
\ifxetex
\else
	\@nativefontstrue
\fi
%%

%% if-else statement that makes sure the document can be compiled with either pdflatex or xelatex
\if@nativefonts %% with pdflatex
	\RequirePackage[T1]{fontenc} %% required for native fonts, so non-opentype/-truetype
	\RequirePackage[utf8]{inputenc} %% required for native fonts, so non-opentype/-truetype
	\RequirePackage{kpfonts} %% kpfonts has math support and all styles (e.g., sans serif and monospace)
\else %% with xelatex: opentype (.otf) or truetype (.ttf) fonts
	%% you need to have the fonts installed on your computer
	%% Can define separately the fonts used for: main (serif), sans serif, monospace, and math.
	\RequirePackage{fontspec} %% fontspec required for opentype/truetype fonts
	\RequirePackage{unicode-math} %% for all math characters; needs to be loaded after all other maths and font-related packages in case it needs to overwrite their definitions
	\setmainfont[Mapping=tex-text]{texgyrebonum-regular.otf}[%
		BoldFont = texgyrebonum-bold.otf ,
		ItalicFont = texgyrebonum-italic.otf ,
		BoldItalicFont = texgyrebonum-bolditalic.otf ]
	\setsansfont[Mapping=tex-text]{texgyreadventor-regular.otf}[%
		BoldFont = texgyreadventor-bold.otf ,
		ItalicFont = texgyreadventor-italic.otf ,
		BoldItalicFont = texgyreadventor-bolditalic.otf ]
	\setmonofont[Mapping=tex-text]{texgyrecursor-regular.otf}[%
		BoldFont = texgyrecursor-bold.otf ,
		ItalicFont = texgyrecursor-italic.otf ,
		BoldItalicFont = texgyrecursor-bolditalic.otf ]
	\setmathfont[Mapping=tex-text]{texgyrebonum-math.otf} %% if none specified: Latin Modern Math will be loaded automatically
\fi
%% 

%% this should also work when fonts are installed (i.e., they are system fonts)
%\setmainfont[Mapping=tex-text]{TeX Gyre Bonum}[%
%Numbers=OldStyle,%
%]
%%

	%%%%% END fonts %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%% START bibliography setup %%%%%

\RequirePackage{notoccite} %% to prevent issues with \cite in headers of TOC
\RequirePackage{csquotes} %% needed to make sure biblatex uses correct typesetting %% and it fixes some punctuation marks, for example, the apostrophe

\RequirePackage[sorting=none,style=chem-acs,articletitle=true,natbib=true,backend=biber,date=long]{biblatex}
	%% see documentation for all options
		%% can use style=numeric-comp as well; or ieee; or chem-angew;
		%% https://www.overleaf.com/learn/latex/Biblatex_citation_styles
	
	%%%%% instructions for using backend=biber : 
		%% set Default Bibliography Tool to biber in TeXstudio (go to Options/Configure/Build)
		%% need to run Bibliography/biber separately, so: pdflatex - biber - pdflatex (i.e. Build & View (F5) - Bibliography (F8) - Build & View (F5))
		%% it seems that you don't need to do this all the time -- I think it is only needed when the .bib has been changed, then biber needs to be run again (F8) in order to update the .bbl file.
	%%%%%

\DeclarePrintbibliographyDefaults{heading=subbibintoc,title=Bibliography} %% use {heading=...} to set the level of the bibliography
	%% title="" changes title from default "References" to "Bibliography".
	%% to include as well in table of contents: use heading=subbibintoc (unnumbered section) or subbibnumbered (numbered section)

\let\cite=\supercite %% With this, when using the command \cite, it uses \supercite, which gives superscripted references in text.

	%%%%% END bibliography setup %%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%% START figure/graphics/etcetera setup %%%%%

%% define graphicspath per \subfile: see example "subfile".tex
	%% like so: \graphicspath{ {Figures/}{Schemes/} } 
	%% see also https://latex.org/forum/viewtopic.php?t=13267
%%

\RequirePackage{caption} %% Changing the caption is done using \captionsetup of the caption package
\RequirePackage{subcaption} %% to use subcaptions, for example, for subfigure
\captionsetup{singlelinecheck=off,format=plain,indention=0.0cm,labelsep=colon,labelfont=bf,font={sf,small}}

\RequirePackage{float}
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[fileext=los, name=Scheme, placement=htbp]{scheme} %% new float scheme
\DeclareFloatingEnvironment[fileext=los, name=Figure, placement=htbp]{figureSI} %% new float figure SI
\DeclareFloatingEnvironment[fileext=los, name=Scheme, placement=htbp]{schemeSI} %% new float scheme SI
\DeclareFloatingEnvironment[fileext=los, name=Table, placement=htbp]{tableSI} %% new float table SI

%% Use here the main language you use with the package babel
\addto{\captionsbritish}{\renewcommand{\thefigureSI}{S\thechapter.\arabic{figureSI}}} %% change label to "Figure S#"
\addto{\captionsbritish}{\renewcommand{\theschemeSI}{S\thechapter.\arabic{schemeSI}}} %% change label to "Scheme S#"
\addto{\captionsbritish}{\renewcommand{\thetableSI}{S\thechapter.\arabic{tableSI}}} %% change label to "Table S#"

\RequirePackage{placeins} %% to use \FloatBarrier

\DeclareGraphicsExtensions{.pdf,.png} %% remove .png file or put .pdf as first argument to use high resolution .pdf image

%% for tables
\RequirePackage{multirow} %% to merge cells in tables
\RequirePackage{makecell} %% to insert linebreak in cells in tables
\RequirePackage{array} %% extra options and for better working of tabular and array
\RequirePackage{adjustbox} %% to resize tables
\RequirePackage{tabularx} %% tabularx readjusts column widths to fill appointed size (x\textwidth)
\RequirePackage{boldline} %% to make thicker lines %% https://tex.stackexchange.com/questions/314882/tabular-thicker-lines
\RequirePackage{adjustbox} %% Limit table dimensions
\RequirePackage{colortbl} %% colors in tables.
\RequirePackage{rotating} %% table rotation
\RequirePackage{supertabular} %% allows two-column tables for when they are too long for one page
\RequirePackage{longtable} %% allows multi-page tables
\RequirePackage{csvsimple} %% to make table from .csv (not needed for simple tables)
%\RequirePackage{booktabs} %% this package is used for more professionally looking tables, which have some differences regarding line thickness and line spacing
%%

	%%%%% END figures/graphics/etcetera setup %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%% START layout, formatting, etcetera %%%%	

\RequirePackage{fancyhdr} %% for fancyheaders
\RequirePackage[noindentafter]{titlesec} %% A package providing an interface to sectioning commands for selection from various title styles. E.g., marginal titles and to change the font of all headings with a single command, also providing simple one-step page styles. %% the option [noindentafter} removes indent of paragraph after titles (still needed when using package parskip??)
\RequirePackage{titletoc} %% A companion for titlesec handling toc/lof/lot entries.
\RequirePackage[nottoc]{tocbibind} %% Automatically adds the bibliography and/or the index and/or the contents, etc., to the Table of Contents listing %% argument [nottoc] excludes the TOC itself
\RequirePackage[flushmargin,hang]{footmisc} %% A collection of ways to change the typesetting of footnotes.
%\RequirePackage{setspace} %% provides options for linespacing (between linespace within a paragraph)
%\RequirePackage{fnpos} %% to control position of footnotes in certain circumstances where the default is undesired
%\RequirePackage[skip=6pt plus 1pt,tocskip=2pt plus .1pt]{parskip} %% offers paragraph spacing options: [skip] specifies \parskip: the vspace between paragraphs; [tocskip] for \parskip in toc (it's not working...); [indent] specifies \parindent: the paragraph indentation; [parfill] adjusts value of \parfillskip 
	%% the toc spacing seems to be following the regular \parskip... even though using the option tocskip should prevent this
	%% may need to set \parskip locally for \tableofcontents in main.tex

\RequirePackage{lettrine} %% package for dropcaps

\RequirePackage[shortcuts]{extdash} %% provides commands to allow hyphenation of words with dashes in them (\-/)
\RequirePackage{etaremune} %% package for reverse-counting (enumerate reversed). Used for List of Publications
\RequirePackage{enumitem} %% options for enumerate

\RequirePackage[final]{pdfpages} %% add pdf pages
\RequirePackage{afterpage} %% page selection and control %% allows afterpage{\clearpage} %% see for instructions: https://www.ctan.org/pkg/afterpage
\RequirePackage[strict]{changepage} %% safe way of detecting whether a page is even or odd %% see: https://ctan.org/pkg/changepage

\RequirePackage{xcolor} %% colour package; [cmyk] means: use target color model cmyk %% https://ftp.snt.utwente.nl/pub/software/tex/macros/latex/contrib/xcolor/xcolor.pdf
\RequirePackage{tikz} %% TikZ is probably the most complex and powerful tool to create graphic elements in LaTeX. %% required here to make the thumb indices

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Define the style for titles and headers:
\def\titlefont{\sffamily} 
	%% \sffamily for sans serif; \ttfamily for monospaced font family;
	%% Not all fonts contain small caps so depending on settings it might resolve to serif/small caps or sans serif/regular
\def\titleshape{\scshape} %%\scshape is small caps; % \upshape is upright (regular)
\def\titlestyle{\titlefont\titleshape\bfseries}

%% Can include an if--else--fi statement in case a difference between print and non-print is desired
%\if@print
\def\headerstyle{\titlefont\titleshape\bfseries} %
%\else
%	\def\headerstyle{\titlefont\titleshape}
%\fi

%% define command used in main.tex to define colour of thumb indices per chapter (subfile); also used for colour of chaptertitle and headers (if desired, see below)
\definecolor{myblack}{cmyk}{0.00,0.00,0.00,1.00}
\newcommand{\thumbcolor}{myblack}

\colorlet{title}{myblack} %% define default color for "title"

%% if desired: add an \if@print to define colour of title in print mode
	%% but I don't think there is such a desire
%\definecolor{anthracite}{cmyk}{0,0,0,0.8}
%\if@print
%	\colorlet{title}{anthracite} %% if desired: in [print] mode the title is this colour 
%%

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
	\def\@subtitle{#1}%
	\def\@title{#2}%
	%% Add the title to the PDF meta data.
	\hypersetup{pdftitle=#2}%
}

%% Redefine the author command to accept a first and last name, and to add the
%% full name to the PDF meta data.
\renewcommand*\author[2]{%
	\def\@firstname{#1}%
	\def\@lastname{#2}%
	\hypersetup{pdfauthor=#1\ #2}%
}

	%%%%% END layout, formatting, etcetera %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%% CREATE CROPMARKS %%%

\if@print%
	\newcommand*\cropmarks{%
		\ifodd\c@page%
			\begin{tikzpicture}[remember picture,overlay]
				\draw ($(current page.north east)+(0mm,-3mm)$) -- ($(current page.north east)+(-2mm,-3mm)$);
				\draw ($(current page.north east)+(-3mm,0mm)$) -- ($(current page.north east)+(-3mm,-2mm)$);
				\draw ($(current page.south east)+(0mm,3mm)$) -- ($(current page.south east)+(-2mm,3mm)$);
				\draw ($(current page.south east)+(-3mm,0mm)$) -- ($(current page.south east)+(-3mm,2mm)$);
				\draw ($(current page.north west)+(0mm,-3mm)$) -- ($(current page.north west)+(2mm,-3mm)$);
				\draw ($(current page.north west)+(3mm,0mm)$) -- ($(current page.north west)+(3mm,-2mm)$);
				\draw ($(current page.south west)+(0mm,3mm)$) -- ($(current page.south west)+(2mm,3mm)$);
				\draw ($(current page.south west)+(3mm,0mm)$) -- ($(current page.south west)+(3mm,2mm)$);
			\end{tikzpicture}%
		\else%
			\begin{tikzpicture}[remember picture,overlay]
				\draw ($(current page.north west)+(0mm,-3mm)$) -- ($(current page.north west)+(2mm,-3mm)$);
				\draw ($(current page.north west)+(3mm,0mm)$) -- ($(current page.north west)+(3mm,-2mm)$);
				\draw ($(current page.south west)+(0mm,3mm)$) -- ($(current page.south west)+(2mm,3mm)$);
				\draw ($(current page.south west)+(3mm,0mm)$) -- ($(current page.south west)+(3mm,2mm)$);
				\draw ($(current page.north east)+(0mm,-3mm)$) -- ($(current page.north east)+(-2mm,-3mm)$);
				\draw ($(current page.north east)+(-3mm,0mm)$) -- ($(current page.north east)+(-3mm,-2mm)$);
				\draw ($(current page.south east)+(0mm,3mm)$) -- ($(current page.south east)+(-2mm,3mm)$);
				\draw ($(current page.south east)+(-3mm,0mm)$) -- ($(current page.south east)+(-3mm,2mm)$);
			\end{tikzpicture}%
		\fi%
}
\else
\newcommand*\cropmarks{}
\fi%

	%%% END CREATE CROPMARKS %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%% START THUMB INDICES %%%

%%% Thumb indices consist of white text on a rectangular colored background. The
%%% font-size is 75% of the size of thumb height.
\newif\ifthumb

\newlength\thumbheight
\setlength\thumbheight{24pt}
\newlength\thumbedge
\setlength\thumbedge{4pt} %Controls rounding of the square box, and it is also the distance of the number to the edge of the box
\newlength\thumbhspace
\setlength\thumbhspace{32pt} %Controls width of the box but not intuitively original is 36
\newlength\thumbvspace
\setlength\thumbvspace{3\thumbheight} %Controls vertical distance between thumbs was 2

\newlength\thumbwidth
\setlength\thumbwidth{40pt}
\newlength\thumbspacing
\setlength\thumbspacing{2\thumbheight}
	
\newif\ifthumbback 	%% ifcommand for thumb indices for backmatter (used to print not a digit but an acronym/abbreviation)

%% We need the TikZ library calc to calculate the coordinates of the thumb
%% indices.
\usetikzlibrary{calc}

%% The lthumb command prints the current chapter number in a thumb index on the
	%% left (even) page.
%% Added an extra command: thumbback
	%% This is used in conjunction with the new command \myacronym{} to print a self-defined number/letter/acronym/whatever, instead of the default \thechapter, intended for backmatter chapters like Summary and Acknowledgements.
	%% see the Summary.tex file for an example

\newcommand*\myacronym{} %% define a command to use in ifthumbback to print self-made chapter acronyms/abbreviations
	%% in the commands \lthumb and \rthumb defined below, the above-defined \ifthumbback is added for which \thechapter has been replaced by \myacronym{}
	%% we can adjust the position and size of the printed acronym to make it fit on the thumb indices

\newcommand*\lthumb{%
	\ifthumb% 
	\begin{tikzpicture}[remember picture,overlay]
		\coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
		\coordinate (left margin) at (33mm+\evensidemargin,0pt);
		%% Calculate the corners of the thumb index based on the current
		%% chapter number.
		\coordinate (top left) at ($(current page.north west)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
		\coordinate (bottom right) at ($(top left)+(left margin)-(\thumbhspace,\thumbheight)$);
		%% Shift the left edge to prevent the rounded corner from showing.
		\coordinate (top left) at ($(top left)-(\thumbedge,0pt)$);
		%% Draw the thumb index.
		\fill[fill=\thumbcolor,rounded corners=\thumbedge](top left) rectangle (bottom right);
		%% Print the chapter number at the center right in the thumb index. % -- comment this out to remove the chapter number
		\coordinate (center right) at ($(bottom right)+(0pt,0.5\thumbheight)$);
		\node at (center right)[anchor=east,inner sep=2\thumbedge]{
			\titlefont\bfseries\color{white} %controls color and style of the label
			\fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
			\thechapter
		};
	\end{tikzpicture}%
	\fi%
	\ifthumbback% 
	\begin{tikzpicture}[remember picture,overlay]
		\coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
		\coordinate (left margin) at (33mm+\evensidemargin,0pt);
		%% Calculate the corners of the thumb index based on the current
		%% chapter number.
		\coordinate (top left) at ($(current page.north west)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
		\coordinate (bottom right) at ($(top left)+(left margin)-(\thumbhspace,\thumbheight)$);
		%% Shift the left edge to prevent the rounded corner from showing.
		\coordinate (top left) at ($(top left)-(\thumbedge,0pt)$);
		%% Draw the thumb index.
		\fill[fill=\thumbcolor,rounded corners=\thumbedge](top left) rectangle (bottom right);
		%% Print the defined acronym at the center right in the thumb index. % -- comment this out to remove the chapter number
		\coordinate (center right) at ($(bottom right)+(0pt,0.5\thumbheight)$);
		\node at (center right)[anchor=east,inner sep=.5\thumbedge]{%% change value of inner sep (original was 2/thumbedge) to move acronym more inwards
			\titlefont\bfseries\color{white} %% controls color and style of the label
			\fontsize{0.55\thumbheight}{0.55\thumbheight}\selectfont %% can also decrease fontsize (original was 0.75)
			\myacronym{} %% \myacronym{} here instead of \thechapter
		};
	\end{tikzpicture}%
	\fi%
}

\newcommand*\rthumb{%
	\ifthumb%
	\begin{tikzpicture}[remember picture,overlay]
		\coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
		\coordinate (right margin) at (33mm+\evensidemargin,0pt);
		%% Calculate the corners of the thumb index based on the current
		%% chapter number.
		\coordinate (top right) at ($(current page.north east)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
		\coordinate (bottom left) at ($(top right)-(right margin)-(-\thumbhspace,\thumbheight)$);
		%% Shift the left right to prevent the rounded corner from showing.
		\coordinate (top right) at ($(top right)+(\thumbedge,0pt)$);
		%% Draw the thumb index.
		\fill[fill=\thumbcolor,rounded corners=\thumbedge](top right) rectangle (bottom left);
		%% Print the chapter number at the center right in the thumb index.
		\coordinate (center left) at ($(bottom left)+(0pt,0.5\thumbheight)$);
		\node at (center left)[anchor=west,inner sep=2\thumbedge]{
			\titlefont\bfseries\color{white}
			\fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
			\thechapter
		};
	\end{tikzpicture}%
	\fi%
	\ifthumbback%
	\begin{tikzpicture}[remember picture,overlay]
		\coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
		\coordinate (right margin) at (33mm+\evensidemargin,0pt);
		%% Calculate the corners of the thumb index based on the current
		%% chapter number.
		\coordinate (top right) at ($(current page.north east)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
		\coordinate (bottom left) at ($(top right)-(right margin)-(-\thumbhspace,\thumbheight)$);
		%% Shift the left right to prevent the rounded corner from showing.
		\coordinate (top right) at ($(top right)+(\thumbedge,0pt)$);
		%% Draw the thumb index.
		\fill[fill=\thumbcolor,rounded corners=\thumbedge](top right) rectangle (bottom left);
		%% Print the self-defined acronym at the center right in the thumb index.
		\coordinate (center left) at ($(bottom left)+(0pt,0.5\thumbheight)$);
		\node at (center left)[anchor=west,inner sep=0.5\thumbedge]{%% change value of inner sep (was 2/thumbedge) to move acronym more inwards
			\titlefont\bfseries\color{white}
			\fontsize{0.55\thumbheight}{0.55\thumbheight}\selectfont %% can also decrease fontsize
			\myacronym{} %% \myacronym{} here instead of \thechapter
		};
	\end{tikzpicture}%
	\fi%
}

	%%% END THUMB INDICES %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%% START PAGE STYLES %%%
%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
	\clearpage%
	\if@twoside%
		\ifodd
			\c@page%
		\else%
			\thispagestyle{empty}\vspace*{\fill}\newpage%
		\fi%
	\fi%
}

%% Page style for empty pages.
\fancypagestyle{empty}{%
	\fancyhf{}
	\renewcommand*\headrulewidth{0pt}
	\renewcommand*\footrulewidth{0pt}
	\fancyhead{\cropmarks}
}

%% Pagestyle default for titlepages of Chapter and TOC is plain.
%% Can adjust the pagestyle plain here.
%% This defines titlepage of all chapters including TOC, so it makes them look the same -- if not desired, see below
%\fancypagestyle{plain}{%
%	\fancyhf{}
%	\renewcommand*\headrulewidth{0pt}
%	\renewcommand*\footrulewidth{0pt}
%	\fancyhead{\cropmarks}
%%	\fancyfoot[C]{\titlefont\thepage} % turn on/off pagenumber on title page
%}

%% Pagestyle used for titlepages instead of the default pagestyle plain.
%% This pagestyle is created in order to be able to have different titlepages for Chapters and the TOC: see main_brownies.tex for implementation.
\fancypagestyle{chaptertitlepage}{%
	\fancyhf{}
	\renewcommand*\headrulewidth{0pt}
	\renewcommand*\footrulewidth{0pt}
	\fancyhead{\cropmarks}
	%	\fancyfoot[C]{\titlefont\thepage} % turn on/off pagenumber on titlepage
}

%% Pagestyle for the firstpage of the TOC, used in combination with pagestyle chaptertitlepage to have distinct chapter and TOC titlepages: see main_brownies.tex for implementation
\fancypagestyle{frontmatterTOCfirstpage}{%
	\fancyhf{}
	%% Page numbers on the bottom left (even) and bottom right (odd).
	\fancyfoot[RO]{\cropmarks\rthumb\titlefont\thepage}
	\renewcommand{\footrulewidth}{0.4pt} % to add footrule. headrulewidth is defined in the package fancyhdr: default is 0.4pt
	\renewcommand{\headrulewidth}{0pt}
}
%%

%% Fancy pagestyle for the front matter
\fancypagestyle{frontmatter}{%
	\fancyhf{}
	%% Page numbers on the bottom left (even) and bottom right (odd).
	\fancyfoot[LE]{\cropmarks\lthumb\titlefont\thepage}
	\fancyfoot[RO]{\cropmarks\rthumb\titlefont\thepage}
	\renewcommand{\footrulewidth}{\headrulewidth} %% to add footrule; headrulewidth is defined in the package fancyhdr: default is 0.4pt
%	\renewcommand{\headrulewidth}{0pt}
	%% Chapter name top left on the even page.
	\fancyhead[LE]{\titlefont\titleshape\nouppercase{\leftmark}} %% leftmark = chapternumber+chapter by default 
	%% Chapter name top right on the odd page.
	\fancyhead[RO]{\titlefont\titleshape\nouppercase{\leftmark}} %% on odd pages on the right [RO]
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
	\fancyhf{}
	%% Page numbers on the bottom left (even) and bottom right (odd).
	\fancyfoot[LE]{\cropmarks\lthumb\titlefont\thepage}
	\fancyfoot[RO]{\cropmarks\rthumb\titlefont\thepage}
	\renewcommand{\footrulewidth}{\headrulewidth} % to add footrule in mainmatter. headrulewidth is defined in the package fancyhdr: default is 0.4pt
	%% Chapter name top left on the even page.
	\fancyhead[LE]{\titlefont\titleshape\nouppercase{\leftmark}} %% leftmark = chapternumber+chapter by default. Redefined it below (\renewcommand*\chaptermark{}) to have it add the word Chapter
	%% Section name top right on the odd page.
	\fancyhead[RO]{\titlefont\titleshape\nouppercase{\rightmark}} %% \rightmark is defined below with the command \markright (to be \thesubsection but it can be \thesection too if preferred)
}

%% Fancy style for the backmatter.
\fancypagestyle{backmatter}{%
	\fancyhf{}
	%% Page numbers on the bottom left (even) and bottom right (odd).
	\fancyfoot[LE]{\cropmarks\lthumb\titlefont\thepage}
	\fancyfoot[RO]{\cropmarks\rthumb\titlefont\thepage}
	\renewcommand{\footrulewidth}{\headrulewidth} %% to add footrule in mainmatter. headrulewidth is defined in the package fancyhdr: default is 0.4pt
	%% Chapter name top left on the even page.
	\fancyhead[LE,RO]{\titlefont\titleshape\nouppercase{\leftmark}} %% leftmark = chapternumber+chapter by default %% set to both left even and right odd
}

%% Pagestyle of the backmatter titlepages that excludes fancyhead and headrule.
%% Requires additional commands in the corresponding .tex files of the subfiles in the backmatter: see, for example, Summary and Acknowledgments
\fancypagestyle{backmattertitle}{%
	\fancyhf{}
	%% Page numbers on the bottom left (even) and bottom right (odd).
	\fancyfoot[LE]{\cropmarks\lthumb\titlefont\thepage}
	\fancyfoot[RO]{\cropmarks\rthumb\titlefont\thepage}
	\renewcommand{\footrulewidth}{0.4pt} %% to add footrule in mainmatter. headrulewidth is defined in the package fancyhdr: default is 0.4pt
	\renewcommand*\headrulewidth{0pt} %% headrulewidth set to 0pt to remove it
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

	%%% END PAGE STYLES %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%% START HEADER STYLES AND CONTENT %%%

%% Change name of TOC
\addto\captionsbritish{%% Use here the main language you use with the package babel
	\renewcommand{\contentsname}%
	{Table of Contents}%
}

%% Adjust fancyheader style for chapter, section, subsection, etc.
\renewcommand*\chaptermark[1]{\markboth{\chaptername\ \thechapter.\ #1}{}} %% to adjust fancyheader Chapter style
%\renewcommand*\sectionmark[1]{\markright{\thesection.\ #1}} %% to put Section header as rightmark
\renewcommand*\subsectionmark[1]{\markright{\thesubsection.\ #1}} %% to put Subsection header as rightmark

%% Possible: use \color{title}#1}{} to change the colour of fancyheader.
%\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{title}#1}{}} 

%% color{title} is defined above to equal \thumbcolor, but it doesn't seem to follow the \thumbcolor re-defined in main_brownies.tex, so something is not working yet...
%%

%% The setheader command can be used to print the title of unnumbered chapters
	%% in the page header.
%% Haven't used it, but seems like it could be handy for use in backmatter (where unnumbered chapters are inserted using \chapter*)
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.		
%\renewcommand*\headrule{%
%	\if@fancyplain%
%		\let\headrulewidth\plainheadrulewidth%
%	\fi%
%	{\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
%	\vskip-\headrulewidth%
%}

%% Draw the line above a footnote in the title color as well.
	%% and can adjust width and height here
\renewcommand*\footnoterule{%
	\vspace*{-3pt}%
	{\color{title}\hrule width \textwidth height 0.4pt}% % it was 0.5\textwidth
	\vspace*{2.6pt}%
}

\setcounter{secnumdepth}{4} %% down to level {#} will be a numbered "section" (sub-/subsub-/subsubsubsection, etc.)
%\setcounter{tocdepth}{2} %% level {#} will show up in TOC %% not needed when using secnumdepth with higher #

%% A part title starts with a huge (96pt) bold black number, flushed to the
	%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
{\flushright\titlestyle}
{\fontsize{96pt}{96pt}\selectfont\bfseries\color{\thumbcolor}\thepart} %% color = thumbcolor to get the chapter number in the same colors as the thumbs
{0pt}
%{\Huge\color{title}} %% print title in color "title" defined above
{\Huge\color{\thumbcolor}} %% print title in color defined by \thumbcolor in main_brownies.tex
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
	%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
{\flushright\titlestyle}
{\fontsize{96pt}{96pt}\selectfont\bfseries\color{\thumbcolor}\thechapter} %% color = thumbcolor to get the chapter number in the same colors as the thumbs
{0pt}
%{\Huge\color{title}} %% print title in color "title" defined above
{\Huge\color{\thumbcolor}} %% print title in color defined by \thumbcolor in main_brownies.tex
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
	%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
	%% in the title color.
\titleformat{\section}
{\Large\headerstyle}
{\bfseries\thesection.\ }
{0pt}
{\color{title}} %% print title in color "title" defined above
%{\color{\thumbcolor}} %% print title in color defined by \thumbcolor in main_brownies.tex
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{10pt}
%% In the table of contents, section names are followed by a line of dots 8pt
	%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
	%% font.
\titleformat{\subsection}
{\large\headerstyle}
{\bfseries\thesubsection.\ }
{0pt}
{\color{title}} %% print title in color "title" defined above
%{\color{\thumbcolor}} %% print title in color defined in main_brownies.tex by \thumbcolor
\titlespacing{\subsection}{0pt}{\baselineskip}{8pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt} %% \dottedcontents determines style in TOC

%% Subsubsections have the same font and color as sections and subsections
%% Can adjust here whether they are numbered or not
\titleformat{\subsubsection}
{\headerstyle}
{\thesubsubsection.\ } %% leave out \thesubsubsection to have it unnumbered
{0pt}
{\color{title}} %% print title in color "title" defined above
%{\color{\thumbcolor}} %% print title in color defined in main_brownies.tex by \thumbcolor
%% Subsubsections are preceded by an empty line and do not appear in the table
	%% of contents (no \dottedcontents)
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Paragraphs (subsubsubsections)
\titleformat{\paragraph}
{\small\headerstyle}
{\theparagraph.\ } %% leave out \theparagraph to have it unnumbered
{0pt}
{\color{title}} %% print title in color "title" defined above
%{\color{\thumbcolor}} %% print title in color defined by \thumbcolor in main_brownies.tex
%% Paragraphs (subsubsubsections) are preceded by an empty line and do not appear in the table
	%% of contents (no \dottedcontents)
\titlespacing{\paragraph}{0pt}{\medskipamount}{0pt}

	%%% END HEADER STYLES AND CONTENT %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%% START ENVIRONMENTS: NEW AND ADJUSTMENTS %%%

%% Color the bullets of the itemize environment and make the symbol of the third
	%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% The dedication is vertically centered on a separate page and flushed to the
	%% right.
\newcommand\dedication[1]{%
	\thispagestyle{empty}%
	\vspace*{\fill}%
	\begin{flushright}%
		#1%
	\end{flushright}%
	\vspace*{\fill}%
	\cleardoublepage%
}

%% Define an unnumbered footnote command.
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

%% The authors environment is used to display the authors of a chapter on the
	%% title page. This is only necessary if multiple people contributed
		%% significantly to the chapter.
\newcommand*\authors[1]{%
	\begin{center}%
		{\Large\bfseries #1}%
	\end{center}%
	\vspace{2\baselineskip}%
}

%% The epigraph environment can be used to to add a quote to the title page of
	%% a chapter.
\newcommand\epigraph[3][2\baselineskip]{%
	\begin{flushright}%
		{\rmfamily\itshape #2}%
		\vskip 0.5\baselineskip%
		#3%
	\end{flushright}%
	\vspace{#1}%
}

%% The abstract environment is used for the abstract of a chapter.
\newenvironment{abstract}{%
	\clearpage
%	\vspace*{24pt} %% This creates a space before the start of the text, for example, when placing the abstract on the titlepage under an image or title (in this case: remove \clearpage)
	\begin{flushleft}% %was center
		{\Large\titleshape\bfseries\titlefont{Abstract}}
	\end{flushleft}%was center
	\vspace*{0pt} %original 10pt
	\list{}{\leftmargin\rightmargin}%
	\item%
	\relax%
	\rmfamily\slshape %itshape gives text in italic, \slshape in slanted which is slightly less italic. Not all font classes have a slanted font in which case italic is used.
	
}{%
	\endlist%
}

%% Define a drop command which can be used to generate drop caps at the
	%% beginning of a section.
\renewcommand*\LettrineTextFont{\titleshape}
\newcommand*\dropcap[2]{
	\lettrine[lines=2,findent=0.2em,nindent=0pt]{\color{title} #1}{#2}%
}

	%%% START ENVIRONMENTS: NEW AND ADJUSTMENTS %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%% START MISCELLANEOUS %%%
%% Formatting of hyperlinks (from package \hyperref added at the start of the .cls file)
\hypersetup{
	colorlinks = true,
	citecolor = title, %% color "title" defined above
	linkcolor = title,
	urlcolor = title
}

%\RequirePackage{comment} % necessary to use \comment{} environment
%\RequirePackage[normalem]{ulem} % used for strikethrough
%\RequirePackage{tabto} % used for list of abbreviations
%\RequirePackage{ifthen} % need for %\setboolean

%\RequirePackage{metalogo} %This package exposes spacing parameters for various TeX logos to the end user, to optimise the logos for different fonts. Written especially for XeLaTeX users. 

%%%%%% TO DO
%% add an if-else--fi statement to include these unicode characters when xelatex is not used

%\DeclareUnicodeCharacter{2212}{-}
%\DeclareUnicodeCharacter{2032}{'}

%%

	%%% END MISCELLANEOUS %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%