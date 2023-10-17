$pdf_mode=1;    # pdflatex is 1, xelatex is 5
$force_mode=1;  # -f option
$max_repeat=5;
set_tex_cmds('-interaction=nonstopmode -shell-escape %O %P');
