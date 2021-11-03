% CS-UOB-EXAM
%
% Created by Martijn Stam, Nicolas Wu (2017-2018).
% Updated by Alex Kavvos (2021)
%
% You should also be given a template exam.tex which will serve as a model
% for your exam.
%
% This LaTeX class file is a modification of the standard `exam` class, to
% suit University of Bristol exam regulations. The class creates a title page
% when \maketitle is called, and automatically places an "END OF PAPER"
% marking at the end.

% NOTE: The exam.cls style will normally require you to run latex several
% times when compiling final output, since it must calculate the number of
% questions and associated marks. If you do not run latex enough times, the
% marks may be incorrectly calculated. *It is recommended that you use
% latexmk to do this, as it will automatically run latex for you, and detect
% when no more reruns are required.*

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-uob-exam}[2017/02/06 UoB CS LaTeX class]
\LoadClass[12pt,addpoints]{exam}

%MSM: loading package to ease layout etc.
% \usepackage{cmbright}
\usepackage{mlmodern}
\usepackage[T1]{fontenc}
\RequirePackage{soul}			% MSM: to underline text
\RequirePackage{fmtcount}		% MSM: to convert numbers into text
\RequirePackage{color}

%MSM: set up exam.cls to provide correct UoB layout for questions
\renewcommand\thequestion{{\bfseries Q\arabic{question}}}
\pointsdroppedatright
\marksnotpoints
\marginpointname{ \points}
\pointformat{[\themarginpoints]}
\setlength{\rightpointsmargin}{2.4cm}

%MSM: set up exam.cls to provide correct UoB page layout
\pagestyle{headandfoot}
\lhead{\ifcontinuation{\oddeven{}{(cont.)}}{}}
\chead{}
\rhead{\ifcontinuation{\oddeven{(cont.)}{}}{}}
\lfoot{}
\cfoot{{\bfseries Page \thepage\ of \numpages}}
\rfoot[]{
  {
    \bfseries
    \iflastpage{
      \vfill
      \begin{center}
        {\large\bfseries END OF PAPER}
      \end{center}
    }{
      \ifincomplete%
      {\oddeven{Turn Over/Qu.~continues \ldots}{Qu.~continues \ldots}}%
      {\oddeven{Turn Over/\ldots}{}}%
    }
  }
}

\CorrectChoiceEmphasis{\color{red}\bfseries}
\shadedsolutions
\definecolor{SolutionColor}{rgb}{1,0.9,0.9}

% Flag for online exam
\newif\if@online
\@onlinefalse
\DeclareOption{online}{\@onlinetrue}
\ProcessOptions\relax

\renewcommand\maketitle{

  \begin{center}
    {
      \large\bfseries
      UNIVERSITY OF BRISTOL\\[5mm]
      \When~Examination Period\\[5mm]
      \Dept
    }
    \vspace*{15mm}

    {
    \large\bfseries
    \Year~Examination for the Degrees of\\
    \Degrees
    }

    \vspace*{2cm}

    {\large\bfseries \Coms}\\
    {\large\bfseries \Name}

    \vspace*{15mm}

    {
      \large\bfseries 
      TIME ALLOWED:\\
      \Time

      \if@online
        plus \UploadTime~to allow for collation and uploading of answers.
      \else
        % nothing for in person exams
      \fi
    }

    \vspace*{10mm}

    \ifprintanswers
      {\Large\bfseries\color{red} Answers to \Coms: \Name}

      \vspace*{10mm}

      % This seems to be for printing ILOs. I assume that is something we no longer do.
      %
      % {
      %   \bfseries
      %   \ul{Intended Learning Outcomes:}
      % }\\[2mm]
      % \ILO

    \else

      % Rubric generation
      {
        \ifx\Rubrik\undefined
        This paper contains \textbf{\numberstringnum\numquestions{}} questions. \\
        \textbf{All} answers will be used for assessment. \\
        The maximum for this paper is \textbf{\numpoints\ marks}.\\[5mm]
        \else
        {\Rubrik}
        \fi
      }

    \vspace*{15mm}

    % Other instructions
    {
      \bfseries
      \ul{Other Instructions}\\[2mm]
      \Instruct
    }

    \vfill
    
    {
      \if@online
      % nothing here for online exams
      \else
      {
        \large\bfseries
        % Please write your student number on the answer booklet, as found on your uCard.\\[2mm]

        TURN OVER ONLY WHEN TOLD TO START WRITING\\
      }
      \fi
    }

  \end{center}

  \newpage
}