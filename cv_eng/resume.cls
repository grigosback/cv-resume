% resume.cls

% \documentstyle{resume}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved.  This file is offered as-is,
% without any warranty.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,a4paper]{article}
\usepackage{hyperref}
\usepackage[parfill]{parskip}       % Do not indent paragraphs
\usepackage{array}                  % required for boldface tabular columns
\usepackage{ifthen}
\usepackage{graphicx}
\usepackage{wrapfig}
\usepackage{enumitem}% http://ctan.org/pkg/enumitem

%\nofiles                            % .aux files are not needed for resumes
\pagestyle{empty}                   % resumes do not need page numbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADINGS: Commands for printing name and address

\def \name#1{\def\@name{#1}}        % \name command can be used to set name
\def \@name {}                      % Set \@name to empty by default

\def \title#1{\def\@title{#1}} % Defines the \title command to set title
\def \@title {} % Sets \@title to empty by default

\def \mat#1{\def\@mat{#1}} % Defines the \title command to set title
\def \@mat {} % Sets \@title to empty by default

\def \addressSep {$\diamond$}         % Set default address seperator

% One or two address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set first and second address (optional)
\def \address #1{
    \@ifundefined{@addresstwo}{
        \def \@addresstwo {#1}
    }{
        \@ifundefined{@addressthree}{
            \def \@addressthree {#1}
        }{
            \def \@addressone {#1}
        }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

\def \printprofilepic {
  \begingroup
  \centerline{\includegraphics[width=4cm]{images/profile.jpg}}
  \bigskip
  \endgroup
  \smallbreak
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \centerline{\textbf{\MakeUppercase{\namesize\@name}}}
    \bigskip
  \endgroup
  \par

}

% \printtitle is used to print the title as a page header
\def \printtitle {
    \begingroup
    \centerline{\MakeUppercase{\titlesize\bf \@title}}
    \bigskip
    \endgroup

}

\def \printmat {
    \begingroup
    \centerline{\MakeUppercase{\matsize\bf \@mat}}
    \bigskip
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT: Create the head of the document

\AtBeginDocument{                     % Begin document
  %\printprofilepic
  \printname                        % Print the name specified with \name
  \printtitle % Print the title specified with \title
  %\printmat
  \@ifundefined{@addressone}{}{     % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{     % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
      \printaddress{\@addressthree}}
}

%\AddToHook{begindocument/before}{\RequirePackage{hyperref}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTIONS: Create section headings

% Used to create large resume section
\newenvironment{rSection}[1]{
  \sectionskip
  \textbf{\MakeUppercase{#1}}
  \sectionlineskip
  \hrule
  \begin{list}{}{
    \setlength{\leftmargin}{1.5em}
  }
  \item[]
}{
  \end{list}
}

% Used to format job listing
\newenvironment{rSubsection}[4]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Employer (bold)                     Dates (regular)    %%
  %%    Title (emphasis)                Location (emphasis)    %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \textbf{#1}                 \hfill                  {    #2}% Stop a space
  \ifthenelse{\equal{#3}{}}{}{
  \\
  \emph{#3}                \hfill                  \emph{#4}% Stop a space
  }\smallskip
  % \cdot used for bullets, items non-indented
  \begin{list}{$\cdot$}{\leftmargin=0em}
  \itemsep -0.5em \vspace{-0.5em}
}{
  \end{list}
  \vspace{0.5em}
}

\def\namesize{\huge}
\def\titlesize{\LARGE} %
\def\matsize{\LARGE} %

\def\nameskip{\bigskip}
\def\titleskip{\smallskip} %
\def\addressskip{\smallskip}
\def\sectionskip{\medskip}
\def\sectionlineskip{\medskip}
