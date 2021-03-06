\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mycv}[2011/09/18 Insti Standard Template CV]
%\renewcommand{\normalsize}{\fontsize{10pt}{10pt}\selectfont}
%\setlength{\textwidth}{6.5in}
%\setlength{\textheight}{8in}

%Loads the article class as the base template for further changes
\LoadClass{article}

%Following are all the packages required for this class file
\RequirePackage{titlesec}
\RequirePackage{charter}
\RequirePackage[hmargin=.4in, vmargin=.2in]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{array}

%\setlength{\parskip}{0.15pt}
%\setlength{\parsep}{0.15em}
%\setlength{\topskip}{0.1em}
%\setlength{\topsep}{0.1em}

%Define fields that the user can set
\makeatletter
  \newcommand{\Address}[1]{\def \@Address {#1}}
  \newcommand{\PhoneNumber}[1]{\def \@PhoneNumber {#1}}
  \newcommand{\Email}[1]{\def \@Email {#1}}
  \newcommand{\CourseVar}[1]{\def \@CourseVar {#1}}
  \Address{}
  \PhoneNumber{}
  \Email{}
  \CourseVar{}
\makeatother


%Defines how the title will look
\makeatletter
\def \maketitle{%
  \thispagestyle{empty}
  \pagestyle{empty}
    \vspace{2.5em} 
    \begin{minipage}{\textwidth}
      \begin{center}
      {\Large \scshape \@author } %Puts name 
      \end{center}
    \end{minipage}
    \vspace{.5em}
  \\[.5em] 
  \begin{minipage}{.40\textwidth}
    \raggedright
    \@Address %Address of the student
  \end{minipage} 
  \begin{minipage}{.60\textwidth}
    \raggedleft
    \@PhoneNumber %Phone number of the student
    \\
    \@Email %Email id of the student
  \end{minipage}
  %\vspace{-.5em} 
  %\hrule
}
\makeatother



%Define lengths that might be used later on in the document
\newlength{\EduTableOne}
\newlength{\EduTableTwo}
\newlength{\EduTableThree}
\newlength{\EduTableFour}

%Create a new variable TwoColumn to check for two-column format
\newif\ifLeftTwoColumn
\newif\ifRightTwoColumn
\newif\ifTwoColumn
\newif\ifCourse

%Set paragraph indent and lengths of previously defined variables
\setlength{\parindent}{0em}
\settowidth{\EduTableOne}{B.Tech in Electrical Engineering}
\settowidth{\EduTableTwo}{\textbf{Indian Institute of Technology Madras }}
\settowidth{\EduTableThree}{\textbf{\%/CGPA}}
\settowidth{\EduTableFour}{\textbf{completion}}

%Reformat section, subsection and subsubsection as needed
\titleformat{\section}{\Large\scshape\raggedright}{}{0em}{}[\titlerule]
\titleformat{\subsection}{\large\scshape\raggedright}{$\bullet$}{.5em}{}
\titleformat{\subsubsection}[runin]{\bf\large\raggedright}{$\bullet$}{.5em}{}

%Change the spacing options for section, subsection and subsubsection
%The first parameter specifies the gap from the margin in the default case
%and the indentation just before the title for runin
%The second parameter specifies the vertical space before the title
%The third parameter specifies the separation between title and text
\titlespacing{\section}{0em}{.4em}{.4em}
\titlespacing{\subsection}{0em}{.2em}{.15em}
\titlespacing{\subsubsection}{1.5em}{.10em}{.1em}



%Defines a new environment called Education that is dedicated for 
%creating the table for filling in details about education. The command
%\EduDetails must be used in order to enter stuff in here
\newenvironment{EducationTable}{%
  \begin{center}%
    \begin{tabular*}{.96\textwidth}{|m{.35\textwidth} | >{\centering\arraybackslash}m{.25\textwidth} |  >{\centering\arraybackslash}m{0.13\textwidth} | c |}%
      \hline 
      {\bf Program} & {\bf Institution} & {\bf \%/CGPA} & {\bf Completion Year } \\ \hline
}
{\end{tabular*}%
\end{center}%
}
      
%Create a new environment specifically for course related content
\newenvironment{Course}{%
  \TwoColumntrue
  \vspace{-1em}
  \begin{multicols}{2}
    \raggedright
}
{
\end{multicols}
\TwoColumnfalse
}
%\newenvironment{Course}[1]{%
%  \LeftTwoColumntrue
%  \RightTwoColumnfalse
%  \Coursetrue
%  \section{#1}
%  \begin{tabular*}{.8\textwidth}{p{0.4\textwidth} p{0.4\textwidth}}
%}
%{\end{tabular*}
%\RightTwoColumntrue
%\LeftTwoColumnfalse
%\Coursefalse
%}


%Define new commands
%Define a new dated section type (NOT needed for IITM format)
\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}

%Define a new dated subsection that can be used for filling in project 
%durations etc.
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}

%Define a new command called \Point which will take care of indentation and 
%allow you to fill in stuff inside a subsection
\newcommand{\Point}[1]{%
  \subsubsection{}%
  \raggedright
  \hangindent=2.70em\hangafter=1\noindent%
  \ifTwoColumn
    \parbox[t]{.4\textwidth}{#1}
  \else#1%
  \fi
  \par%
}
%\newcommand{\Point}[1]{%
%  %\subsubsection{}
%  \ifCourse
%    \ifLeftTwoColumn
%      
%      \begin{minipage}{.4\textwidth}
%	\subsubsection{} #1
%      \end{minipage}
%      \RightTwoColumntrue
%      \LeftTwoColumnfalse
%    %\fi
%    %\ifRightTwoColumn%
%    \else
%      \begin{minipage}{.4\textwidth}
%	\subsubsection{} #1
%      \end{minipage}
%      \RightTwoColumnfalse
%      \LeftTwoColumntrue
%    \fi
%  \else
%    \subsubsection{} 
%    \hangindent=3.45em\hangafter=1\noindent%
%    #1
%  \fi
%}


%Define the \EduDetails command that must be used inside an Education
%environment defined above
\newcommand{\EduDetails}[4]{%
  {#1} & {#2} & {#3} & {#4} \\[.2em] \hline %
}
