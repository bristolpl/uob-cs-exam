% CS-UOB-EXAM
% by Martijn Stam and Nicolas Wu
% 2017/2018
%
% This class file should come supplied with a Makefile.
% To compile your exam and answers, type make.
% You should also be given a template exam.tex which will serve as a
% model for your exam.
%
% This LaTeX class file is a modification of the standard `exam` class,
% to suit University of Bristol exam regulations.
% The class creates a title page when \maketitle is called, and
% automatically places an "END OF PAPER" marking at the end.

% NOTE: The exam.cls style will normally require you to run latex
% several times when compiling final output, since it must calculate
% the number of questions and associated marks. If you do not run
% latex enough times, the marks may be incorrectly calculated.
% Therefore, it is recommended that you use the Makefile provided,
% since this will automatically run latex for you, and detect when no
% more reruns are required.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-uob-exam}[2017/02/06 UoB CS LaTeX class]
\LoadClass[12pt,addpoints]{exam}

%MSM: loading package to ease layout etc.
% \usepackage{cmbright}
\usepackage{lmodern}
\RequirePackage{soul}			% MSM: to underline text
\RequirePackage{fmtcount}		% MSM: to convert numbers into text
\RequirePackage{color}

%MSM: set up exam.cls to provide correct UoB layout for questions
\renewcommand\thequestion{{{\bfseries Q\arabic{question}}}}
\pointsdroppedatright
\marksnotpoints
\marginpointname{ \points}
\pointformat{{\itshape[\themarginpoints]}}
\setlength{\rightpointsmargin}{2.4cm}

%MSM: set up exam.cls to provide correct UoB page layout
\pagestyle{headandfoot}
\lhead{\ifcontinuation{\oddeven{}{(cont.)}}{}}
\chead{}
\rhead{\ifcontinuation{\oddeven{(cont.)}{}}{}}
\lfoot{}
\cfoot{{\bfseries Page \thepage\ of \numpages}}
\rfoot[]{{\bfseries \iflastpage{
\vfill
\begin{center}
{\large\bfseries
END OF PAPER
}
\end{center}
}{\ifincomplete%
{\oddeven{Turn Over/Qu.~continues \ldots}{Qu.~continues \ldots}}%
{\oddeven{Turn Over/\ldots}{}}%
}}}

\CorrectChoiceEmphasis{\color{red}\bfseries}
\shadedsolutions
\definecolor{SolutionColor}{rgb}{1,0.9,0.9}

% flag for online exam: no student card instructions
\newif\ifinperson
\DeclareOption{online}{\inpersonfalse}


\renewcommand\maketitle{

\begin{center}
{\large\bfseries
UNIVERSITY OF BRISTOL
\\[10mm]
\When\ Examination Period
\\[10mm]
FACULTY OF ENGINEERING}
\vspace*{15mm}

{
\large\bfseries
\Year\ Examination for the Degrees of\\
\Degrees
}

\vspace*{2cm}
{\large\bfseries \Coms}\\
{\large\bfseries \Name}

\vspace*{15mm}
{\large\bfseries TIME ALLOWED:\\ \Time}

\vspace*{10mm}
\ifprintanswers
  {\Large\bfseries\color{red} Answers to \Coms: \Name}

\vspace*{10mm}
{\bfseries \ul{Intended Learning Outcomes:}}\\[2mm]
\ILO
\else
{\ifx\Rubrik\undefined
This paper contains \emph{\numberstringnum\numquestions{}} questions. \\
\emph{All} answers will be used for assessment. \\
The maximum for this paper is \emph{\numpoints\ marks}.\\[5mm]

{
  \ifinperson
  \normalsize\bfseries{PLEASE WRITE YOUR 7 DIGIT STUDENT NUMBER (NOT CANDIDATE NUMBER) ON THE ANSWER BOOKLET. YOUR STUDENT NUMBER CAN BE FOUND ON YOUR UCARD}\\
  \fi
}
\else
{\Rubrik}
\fi}

\vspace*{15mm}
{\bfseries \ul{Other Instructions:}\\[2mm]
\Instruct}
\vfill

{\large\bfseries
TURN OVER ONLY WHEN TOLD TO START WRITING\\
}
\fi

\end{center}

\newpage
}
